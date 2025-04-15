import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Card 卡片","description":"","frontmatter":{},"headers":[],"relativePath":"components/card.md","filePath":"components/card.md"}'),o={name:"components/card.md"};function e(c,n,l,r,u,k){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="card-卡片" tabindex="-1">Card 卡片 <a class="header-anchor" href="#card-卡片" aria-label="Permalink to &quot;Card 卡片&quot;">​</a></h1><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">CardPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">CardPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_CardPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_CardPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>CardPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Card 卡片&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本用法&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>children<span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntCard</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Card Title&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">extra</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>more_horiz_rounded<span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Card Content&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/card"></iframe></div></div>`,2)]))}const y=s(o,[["render",e]]);export{d as __pageData,y as default};
