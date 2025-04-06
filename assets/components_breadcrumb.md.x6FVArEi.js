import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Breadcrumb 面包屑","description":"","frontmatter":{},"headers":[],"relativePath":"components/breadcrumb.md","filePath":"components/breadcrumb.md"}'),o={name:"components/breadcrumb.md"};function e(c,n,r,l,u,k){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="breadcrumb-面包屑" tabindex="-1">Breadcrumb 面包屑 <a class="header-anchor" href="#breadcrumb-面包屑" aria-label="Permalink to &quot;Breadcrumb 面包屑&quot;">​</a></h1><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">BreadcrumbPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">BreadcrumbPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_BreadcrumbPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_BreadcrumbPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>BreadcrumbPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  final _breadcrumbs <span class="token operator">=</span> <span class="token punctuation">[</span>
    <span class="token function">AntBreadcrumbItemRecord</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&#39;首页&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntBreadcrumbItemRecord</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&#39;应用中心&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntBreadcrumbItemRecord</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&#39;应用列表&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntBreadcrumbItemRecord</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&#39;书阙&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntBreadcrumbItemRecord</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&#39;文章&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
  <span class="token punctuation">]</span><span class="token punctuation">;</span>

  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
        <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Breadcrumb 面包屑&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
        <span class="token literal-property property">scrollDirection</span><span class="token operator">:</span> Axis<span class="token punctuation">.</span>vertical<span class="token punctuation">,</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本使用&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntBreadcrumb</span><span class="token punctuation">(</span>items<span class="token operator">:</span> _breadcrumbs<span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;自定义分隔符&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntBreadcrumb</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">items</span><span class="token operator">:</span> _breadcrumbs<span class="token punctuation">,</span> <span class="token literal-property property">separator</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;&gt;&#39;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;自定义渲染&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                <span class="token literal-property property">constraints</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">BoxConstraints</span><span class="token punctuation">(</span>maxWidth<span class="token operator">:</span> <span class="token number">200</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntBreadcrumb</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">items</span><span class="token operator">:</span> _breadcrumbs<span class="token punctuation">,</span> <span class="token literal-property property">separator</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;&gt;&gt;&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">itemRender</span><span class="token operator">:</span> <span class="token punctuation">(</span>item<span class="token punctuation">,</span>index<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                  <span class="token keyword">return</span> <span class="token function">Text</span><span class="token punctuation">(</span>item<span class="token punctuation">.</span>title<span class="token operator">??</span><span class="token string">&#39;&#39;</span><span class="token punctuation">,</span><span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token function">TextStyle</span><span class="token punctuation">(</span>fontSize<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">,</span><span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>blueAccent<span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                <span class="token punctuation">}</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>

          <span class="token punctuation">]</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>

</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/breadcrumb"></iframe></div></div>`,2)]))}const m=s(o,[["render",e]]);export{d as __pageData,m as default};
