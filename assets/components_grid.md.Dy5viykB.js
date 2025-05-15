import{_ as s,c as a,o as p,ae as t}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Grid 栅格","description":"","frontmatter":{},"headers":[],"relativePath":"components/grid.md","filePath":"components/grid.md"}'),o={name:"components/grid.md"};function e(c,n,l,r,u,i){return p(),a("div",null,n[0]||(n[0]=[t(`<h1 id="grid-栅格" tabindex="-1">Grid 栅格 <a class="header-anchor" href="#grid-栅格" aria-label="Permalink to &quot;Grid 栅格&quot;">​</a></h1><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">GridPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">GridPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_GridPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_GridPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>GridPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
        <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Grid 栅格&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&quot;基本使用&quot;</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntGrid</span><span class="token punctuation">(</span>
              <span class="token literal-property property">columns</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span>
              <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">2</span><span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntGridItem</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">span</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">decoration</span><span class="token operator">:</span> <span class="token function">BoxDecoration</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>red<span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;111&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntGridItem</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">span</span><span class="token operator">:</span> <span class="token number">2</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">decoration</span><span class="token operator">:</span> <span class="token function">BoxDecoration</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>red<span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;111&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntGridItem</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">span</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">decoration</span><span class="token operator">:</span> <span class="token function">BoxDecoration</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>red<span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;111&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntGridItem</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">span</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">decoration</span><span class="token operator">:</span> <span class="token function">BoxDecoration</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>red<span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;111&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntGridItem</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">span</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">decoration</span><span class="token operator">:</span> <span class="token function">BoxDecoration</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>red<span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;111&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntGridItem</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">span</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">decoration</span><span class="token operator">:</span> <span class="token function">BoxDecoration</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>red<span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;111&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntGridItem</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">span</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">decoration</span><span class="token operator">:</span> <span class="token function">BoxDecoration</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>red<span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;111&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span>
          <span class="token punctuation">]</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/grid"></iframe></div></div>`,2)]))}const y=s(o,[["render",e]]);export{d as __pageData,y as default};
