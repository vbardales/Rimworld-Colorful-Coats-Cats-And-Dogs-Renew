using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using RimWorld;
using RimWorks.Pickle;
using UnityEngine;
using Verse;

namespace ColorfulCoatsCatsAndDogs.PickleSteps
{
    /// <summary>
    /// What only a running game can say about this mod. The offline suite already runs the game's own
    /// patch engine on the real defs, so nothing here repeats "the patch writes these values". What
    /// it cannot do is load the whole mod list through the real loader (inheritance, ordering,
    /// other mods' patches) and then ask what the game kept, or draw an animal. Both are here.
    /// </summary>
    [PickleSteps]
    public class CoatSteps
    {
        [BeforeScenario]
        public void ResetScene(PickleContext ctx) => Scene.Reset();

        private static PawnKindDef Kind(PickleContext ctx, string kindName)
        {
            var kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(kindName);
            ctx.Require(kind != null, $"no PawnKindDef named '{kindName}' is loaded in this pass");
            return kind;
        }

        private static IntVec3 FreeCell(PickleContext ctx, int radius = 20)
        {
            var map = Scene.Map(ctx);
            IntVec3 cell;
            var found = CellFinder.TryFindRandomCellNear(map.Center, map, radius,
                c => c.Standable(map) && c.GetEdifice(map) == null && c.GetFirstPawn(map) == null, out cell);
            ctx.Require(found, $"no free standable cell was found near {map.Center}");
            return cell;
        }

        private static Pawn Spawn(PickleContext ctx, string kindName, Faction faction, float age, int radius = 20)
        {
            var kind = Kind(ctx, kindName);
            var pawn = PawnGenerator.GeneratePawn(new PawnGenerationRequest(
                kind, faction, forceGenerateNewPawn: true, fixedBiologicalAge: age));
            GenSpawn.Spawn(pawn, FreeCell(ctx, radius), Scene.Map(ctx));
            return pawn;
        }

        // ---- what the game kept after loading the whole mod list -------------------------------

        [Then("Colorful Coats the pawn kind {string} keeps {int} coats at a chance of {string}")]
        public void KeepsCoats(PickleContext ctx, string kindName, int count, string chance)
        {
            var kind = Kind(ctx, kindName);
            var list = kind.alternateGraphics;
            ctx.Assert(list != null && list.Count == count,
                $"{kindName} keeps {(list == null ? "no coat list" : list.Count + " coats")}, expected {count}");
            var expected = float.Parse(chance, CultureInfo.InvariantCulture);
            ctx.Assert(Mathf.Abs(kind.alternateGraphicChance - expected) < 0.0001f,
                $"{kindName} has alternateGraphicChance {kind.alternateGraphicChance}, expected {expected}");
        }

        [Then("Colorful Coats the pawn kind {string} keeps no coat list")]
        public void KeepsNoCoats(PickleContext ctx, string kindName)
        {
            var list = Kind(ctx, kindName).alternateGraphics;
            ctx.Assert(list == null || list.Count == 0,
                $"{kindName} keeps {list?.Count} coats, and none was expected");
        }

        // Written 0-255 in the XML. ParseHelper.ParseColor reads a triple as 0-255 when a component
        // exceeds 1, and the offline suite mirrors that rule because the method cannot be called
        // under Windows PowerShell 5.1. Here the game has really parsed it, so this is the check that
        // the mirror is right.
        [Then("Colorful Coats the pawn kind {string} has a coat coloured {int} {int} {int}")]
        public void HasCoatColoured(PickleContext ctx, string kindName, int r, int g, int b)
        {
            var list = Kind(ctx, kindName).alternateGraphics;
            ctx.Require(list != null && list.Count > 0, $"{kindName} keeps no coat list");
            bool Close(float actual, int wanted) => Mathf.Abs(actual - wanted / 255f) < 0.005f;
            var found = list.Any(a => a.color.HasValue && Close(a.color.Value.r, r) && Close(a.color.Value.g, g) && Close(a.color.Value.b, b));
            var seen = string.Join(", ", list.Select(a => a.color.HasValue
                ? $"({Mathf.RoundToInt(a.color.Value.r * 255)},{Mathf.RoundToInt(a.color.Value.g * 255)},{Mathf.RoundToInt(a.color.Value.b * 255)})"
                : "texture"));
            ctx.Assert(found, $"{kindName} has no coat coloured ({r},{g},{b}); it keeps: {seen}");
        }

        // The other side of "standing aside": a coat this mod wrote is a colour with no texture path,
        // which painted coats (Erin, Animal Variety Coats, the sibling port) never are. So an animal a
        // painter owns must keep coats, and none of them may be colour-only.
        [Then("Colorful Coats the pawn kind {string} keeps coats and none of them is one of this mod's tints")]
        public void KeepsNoTint(PickleContext ctx, string kindName)
        {
            var list = Kind(ctx, kindName).alternateGraphics;
            ctx.Require(list != null && list.Count > 0, $"{kindName} keeps no coat list, so there is nothing to compare");
            var tints = list.Count(a => a.color.HasValue && string.IsNullOrEmpty(a.texPath));
            ctx.Assert(tints == 0, $"{tints} of the {list.Count} coats of {kindName} are colour-only, which is what this mod writes; a painter should have kept the animal");
        }

        // The mod's whole claim: a coat is a tint and never a texture. A texPath here would replace
        // the sprite of another mod's animal with something this mod does not ship.
        [Then("Colorful Coats every coat of {string} is a colour and not a texture")]
        public void EveryCoatIsAColour(PickleContext ctx, string kindName)
        {
            var list = Kind(ctx, kindName).alternateGraphics;
            ctx.Require(list != null && list.Count > 0, $"{kindName} keeps no coat list");
            var bad = list.Where(a => !a.color.HasValue || !string.IsNullOrEmpty(a.texPath)).ToList();
            ctx.Assert(bad.Count == 0, $"{bad.Count} coat(s) of {kindName} carry a texture path or no colour");
        }

        // ---- what the game draws --------------------------------------------------------------

        [Given("Colorful Coats spawns {int} wild animals as {string}")]
        public void SpawnBatch(PickleContext ctx, int count, string kindName)
        {
            for (var i = 0; i < count; i++) Scene.RememberInBatch(Spawn(ctx, kindName, null, 3f));
        }

        // For the review captures: the same batch, packed within four cells of the map centre so one
        // frame can hold it. The wide batch above is for the statistics, which need no picture.
        [Given("Colorful Coats spawns {int} wild animals as {string} close together")]
        public void SpawnBatchClose(PickleContext ctx, int count, string kindName)
        {
            for (var i = 0; i < count; i++) Scene.RememberInBatch(Spawn(ctx, kindName, null, 3f, 4));
        }

        // Paused first, so nothing wanders out of frame between the jump and the picture. The size is the
        // one the Dalmatians suite settled on after its first captures showed a dog a few pixels wide.
        [When("Colorful Coats frames the batch", TimeoutSeconds = 15f)]
        public async Task FrameBatch(PickleContext ctx)
        {
            var pawns = Scene.Batch(ctx);
            ctx.Require(pawns.Count > 0, "no batch was spawned");
            var x = (int)pawns.Average(p => p.Position.x);
            var z = (int)pawns.Average(p => p.Position.z);
            Find.TickManager.CurTimeSpeed = TimeSpeed.Paused;
            Find.Selector.ClearSelection();
            Find.CameraDriver.JumpToCurrentMapLoc(new IntVec3(x, 0, z - 2));
            Find.CameraDriver.SetRootSize(9f);
            await ctx.WaitFrames(5);
        }

        [Given("Colorful Coats spawns the player animal {string} as {string}")]
        public void SpawnPlayer(PickleContext ctx, string alias, string kindName) =>
            Scene.Remember(alias, Spawn(ctx, kindName, Faction.OfPlayer, 3f));

        // A coat is the index into the kind's list, -1 for the original one. The bounds are wide on
        // purpose: the roll is seeded from each animal's id, so a batch of forty is a sample and not
        // a quota, and a chance of 0.6 should not fail a scenario at 0.5.
        [Then("Colorful Coats between {int} and {int} percent of the batch wear an alternate coat")]
        public void AlternateShare(PickleContext ctx, int low, int high)
        {
            var pawns = Scene.Batch(ctx);
            ctx.Require(pawns.Count > 0, "no batch was spawned");
            var alternate = pawns.Count(p => p.GetGraphicIndex() >= 0);
            var share = 100f * alternate / pawns.Count;
            ctx.Assert(share >= low && share <= high,
                $"{alternate} of {pawns.Count} animals wear an alternate coat ({share:0}%); expected {low} to {high}%");
        }

        [Then("Colorful Coats the batch wears at least {int} different coats")]
        public void DifferentCoats(PickleContext ctx, int minimum)
        {
            var pawns = Scene.Batch(ctx);
            ctx.Require(pawns.Count > 0, "no batch was spawned");
            var seen = pawns.Select(p => p.GetGraphicIndex()).Distinct().OrderBy(i => i).ToList();
            ctx.Assert(seen.Count >= minimum,
                $"the batch of {pawns.Count} wears {seen.Count} coat(s) ({string.Join(", ", seen)}); expected at least {minimum}");
        }

        [When("Colorful Coats records the coat of {string}")]
        public void RecordCoat(PickleContext ctx, string alias) =>
            Scene.Coats[alias] = Scene.Named(ctx, alias).GetGraphicIndex();

        [Then("Colorful Coats the coat of {string} is the one recorded")]
        public void CoatUnchanged(PickleContext ctx, string alias)
        {
            int before;
            ctx.Require(Scene.Coats.TryGetValue(alias, out before), $"no coat was recorded for {alias}");
            var after = Scene.Named(ctx, alias).GetGraphicIndex();
            ctx.Assert(after == before, $"the coat of {alias} was {before} and is now {after}");
        }

    }
}
