import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"List 列表","description":"","frontmatter":{},"headers":[],"relativePath":"components/list.md","filePath":"components/list.md"}'),o={name:"components/list.md"};function e(c,n,l,r,u,i){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="list-列表" tabindex="-1">List 列表 <a class="header-anchor" href="#list-列表" aria-label="Permalink to &quot;List 列表&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">ListPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">ListPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_ListPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_ListPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>ListPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  List<span class="token operator">&lt;</span>dynamic<span class="token operator">&gt;</span> list <span class="token operator">=</span> <span class="token punctuation">[</span>
    <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;A&quot;</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;B&quot;</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;C&quot;</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;D&quot;</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;E&quot;</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token punctuation">]</span><span class="token punctuation">;</span>

  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntPageContainer</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;List&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本用法&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">height</span><span class="token operator">:</span> <span class="token number">300</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntList</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">dataSource</span><span class="token operator">:</span> list<span class="token punctuation">,</span>
                    <span class="token literal-property property">itemBuilder</span><span class="token operator">:</span> <span class="token punctuation">(</span>context<span class="token punctuation">,</span> item<span class="token punctuation">,</span> index<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token keyword">return</span> <span class="token function">AntListItem</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token function">StateStyle</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Style</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">borderBottom</span><span class="token operator">:</span> <span class="token function">StyleBorder</span><span class="token punctuation">(</span>
                                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>black<span class="token punctuation">,</span>
                                    <span class="token literal-property property">width</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
                                    <span class="token literal-property property">style</span><span class="token operator">:</span> BorderStyle<span class="token punctuation">.</span>solid<span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>person<span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span>item<span class="token punctuation">[</span><span class="token string">&quot;name&quot;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">extra</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>chevron_right_outlined<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/list"></iframe></div></div>`,3)]))}const y=s(o,[["render",e]]);export{d as __pageData,y as default};
