const fs=require('fs'),path=require('path'),http=require('http');
const deps=process.env.PREVIEW_NODE_MODULES||'C:/Users/nelim/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules';
const {chromium}=require(path.join(deps,'playwright'));const sharp=require(path.join(deps,'sharp'));
const root=path.resolve(__dirname,'..');
(async()=>{
const server=http.createServer((req,res)=>{const p=path.resolve(root,'.'+decodeURIComponent(req.url.split('?')[0]));if(!p.startsWith(root+path.sep)){res.writeHead(403).end();return}fs.readFile(p,(e,b)=>{if(e){res.writeHead(404).end();return}res.setHeader('Content-Type',p.endsWith('.html')?'text/html':p.endsWith('.json')?'application/json':p.endsWith('.xml')?'application/xml':'image/png');res.end(b)})});
await new Promise(r=>server.listen(0,'127.0.0.1',r));let browser;
try{
browser=await chromium.launch({executablePath:'C:/Program Files/Google/Chrome/Application/chrome.exe',headless:true});
const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});await page.goto(`http://127.0.0.1:${server.address().port}/Art/preview.html`);await page.evaluate(()=>window.ready);
const cdp=await page.context().newCDPSession(page);await cdp.send('DOM.enable');await cdp.send('CSS.enable');const doc=await cdp.send('DOM.getDocument');
const report={};for(const selector of ['h1','h1 .link-word','h1 .suffix','.tag','.summary','.version']){const {nodeId}=await cdp.send('DOM.querySelector',{nodeId:doc.root.nodeId,selector});report[selector]={fonts:(await cdp.send('CSS.getPlatformFontsForNode',{nodeId})).fonts,rect:await page.locator(selector).boundingBox()};}
await page.screenshot({path:path.join(root,'Mod/About/Preview.png')});
await page.evaluate(()=>document.body.classList.add('background-only'));const bg=await page.screenshot();await fs.promises.writeFile(path.join(__dirname,'preview-background-qa.png'),bg);
const {data,info}=await sharp(bg).removeAlpha().raw().toBuffer({resolveWithObject:true});const palette=JSON.parse(fs.readFileSync(path.join(__dirname,'preview-palette.json')));
const lum=rgb=>rgb.map(v=>v/255).map(v=>v<=.04045?v/12.92:((v+.055)/1.055)**2.4).reduce((s,v,i)=>s+v*[.2126,.7152,.0722][i],0);
const rgb=h=>h.slice(1).match(/../g).map(x=>parseInt(x,16));const ratio=(a,b)=>(Math.max(a,b)+.05)/(Math.min(a,b)+.05);
for(const s of ['h1','h1 .link-word','h1 .suffix','.tag','.summary']){const r=report[s].rect;let min=Infinity;const l=lum(rgb(palette[(s==='.tag'||s==='h1 .suffix')?'inkSecondary':'inkPrimary']));for(let y=Math.floor(r.y);y<Math.ceil(r.y+r.height);y++)for(let x=Math.floor(r.x);x<Math.ceil(r.x+r.width);x++){const i=(y*info.width+x)*3;min=Math.min(min,ratio(l,lum([...data.subarray(i,i+3)])))}report[s].minimumContrast=min;}
report['.version'].minimumContrast=ratio(lum(rgb(palette.badgeInk)),lum(rgb(palette.accent)));
const out=path.join(root,'Mod/About/Preview.png');await sharp(out).resize(268).png().toFile(path.join(__dirname,'preview-268.png'));report.bytes=fs.statSync(out).size;
fs.writeFileSync(path.join(__dirname,'preview-qa.json'),JSON.stringify(report,null,2));console.log(JSON.stringify(report,null,2));if(Object.values(report).some(x=>x.minimumContrast<4.5)||report.bytes>=900000)throw Error('Preview QA failed');
}finally{if(browser)await browser.close();server.close();}
})().catch(e=>{console.error(e);process.exitCode=1});
