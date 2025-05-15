import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Scaffold 脚手架","description":"","frontmatter":{},"headers":[],"relativePath":"components/scaffold.md","filePath":"components/scaffold.md"}'),o={name:"components/scaffold.md"};function e(c,n,l,r,u,i){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="scaffold-脚手架" tabindex="-1">Scaffold 脚手架 <a class="header-anchor" href="#scaffold-脚手架" aria-label="Permalink to &quot;Scaffold 脚手架&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">ScaffoldPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">ScaffoldPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_ScaffoldPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_ScaffoldPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>ScaffoldPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Scaffold 脚手架&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">bottomNavigationBar</span><span class="token operator">:</span> <span class="token function">AntTabBar</span><span class="token punctuation">(</span>
        <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
          <span class="token function">AntTabBarItem</span><span class="token punctuation">(</span>
            <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>home<span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;首页&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token literal-property property">antKey</span><span class="token operator">:</span> <span class="token string">&#39;index&#39;</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">AntTabBarItem</span><span class="token punctuation">(</span>
            <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>search<span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;搜索&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token literal-property property">antKey</span><span class="token operator">:</span> <span class="token string">&#39;search&#39;</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">AntTabBarItem</span><span class="token punctuation">(</span>
            <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>person<span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;我的&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token literal-property property">antKey</span><span class="token operator">:</span> <span class="token string">&#39;my&#39;</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">]</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/scaffold"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2>`,4)]))}const f=a(o,[["render",e]]);export{d as __pageData,f as default};
