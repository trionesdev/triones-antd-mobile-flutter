import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"ImagesWall 图片墙","description":"","frontmatter":{},"headers":[],"relativePath":"components/images-wall.md","filePath":"components/images-wall.md"}'),o={name:"components/images-wall.md"};function e(c,n,l,r,u,i){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="imageswall-图片墙" tabindex="-1">ImagesWall 图片墙 <a class="header-anchor" href="#imageswall-图片墙" aria-label="Permalink to &quot;ImagesWall 图片墙&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">ImagesWallPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">ImagesWallPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_ImageUploadPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_ImageUploadPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>ImagesWallPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
        <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;ImagesWall 图片墙&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
          <span class="token literal-property property">mainAxisSize</span><span class="token operator">:</span> MainAxisSize<span class="token punctuation">.</span>min<span class="token punctuation">,</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本使用&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token function">AntImagesWall</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;赋值&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntImagesWall</span><span class="token punctuation">(</span>
                <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntImageRecord</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">path</span><span class="token operator">:</span> <span class="token string">&quot;https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">status</span><span class="token operator">:</span> AntImageStatus<span class="token punctuation">.</span>done<span class="token punctuation">)</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token literal-property property">onChange</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>

                <span class="token punctuation">}</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span>
          <span class="token punctuation">]</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/images-wall"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2>`,4)]))}const m=a(o,[["render",e]]);export{d as __pageData,m as default};
