import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Grid 栅格","description":"","frontmatter":{},"headers":[],"relativePath":"components/grid.md","filePath":"components/grid.md"}'),o={name:"components/grid.md"};function e(c,n,r,l,i,u){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="grid-栅格" tabindex="-1">Grid 栅格 <a class="header-anchor" href="#grid-栅格" aria-label="Permalink to &quot;Grid 栅格&quot;">​</a></h1><p>栅格布局组件，用于创建响应式的网格布局。</p><h2 id="何时使用" tabindex="-1">何时使用 <a class="header-anchor" href="#何时使用" aria-label="Permalink to &quot;何时使用&quot;">​</a></h2><p>当需要将页面内容按规则的网格排列时使用，可以方便地创建各种复杂的网格布局。</p><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
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
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/grid"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><h3 id="antgrid-属性" tabindex="-1">AntGrid 属性 <a class="header-anchor" href="#antgrid-属性" aria-label="Permalink to &quot;AntGrid 属性&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>columns</td><td>列数</td><td>int?</td><td>1</td></tr><tr><td>spacing</td><td>子项间距</td><td>double?</td><td>0</td></tr><tr><td>children</td><td>子项</td><td><code>List&lt;AntGridItem&gt;?</code></td><td>null</td></tr><tr><td>decoration</td><td>装饰</td><td><code>BoxDecoration?</code></td><td>null</td></tr></tbody></table><h3 id="antgriditem-属性" tabindex="-1">AntGridItem 属性 <a class="header-anchor" href="#antgriditem-属性" aria-label="Permalink to &quot;AntGridItem 属性&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>span</td><td>跨列数</td><td>int?</td><td>1</td></tr><tr><td>child</td><td>子组件</td><td>Widget?</td><td>null</td></tr><tr><td>decoration</td><td>装饰</td><td>BoxDecoration?</td><td>null</td></tr></tbody></table>`,11)]))}const y=a(o,[["render",e]]);export{d as __pageData,y as default};
