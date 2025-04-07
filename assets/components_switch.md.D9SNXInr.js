import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Switch 开关","description":"","frontmatter":{},"headers":[],"relativePath":"components/switch.md","filePath":"components/switch.md"}'),o={name:"components/switch.md"};function e(c,n,l,u,i,r){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="switch-开关" tabindex="-1">Switch 开关 <a class="header-anchor" href="#switch-开关" aria-label="Permalink to &quot;Switch 开关&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">SwitchPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span><span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">SwitchPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_SwitchPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_SwitchPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>SwitchPage<span class="token operator">&gt;</span><span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntPageContainer</span><span class="token punctuation">(</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Switch 开关&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&quot;基本用法&quot;</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntSwitch</span><span class="token punctuation">(</span>onChange<span class="token operator">:</span> <span class="token punctuation">(</span>bool value<span class="token punctuation">)</span> <span class="token punctuation">{</span>  <span class="token punctuation">}</span><span class="token punctuation">,</span><span class="token punctuation">)</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&quot;三种大小&quot;</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntSwitch</span><span class="token punctuation">(</span>size<span class="token operator">:</span> AntSwitchSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span><span class="token literal-property property">onChange</span><span class="token operator">:</span> <span class="token punctuation">(</span>bool value<span class="token punctuation">)</span> <span class="token punctuation">{</span>  <span class="token punctuation">}</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntSwitch</span><span class="token punctuation">(</span>size<span class="token operator">:</span> AntSwitchSize<span class="token punctuation">.</span>middle<span class="token punctuation">,</span><span class="token literal-property property">onChange</span><span class="token operator">:</span> <span class="token punctuation">(</span>bool value<span class="token punctuation">)</span> <span class="token punctuation">{</span>  <span class="token punctuation">}</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntSwitch</span><span class="token punctuation">(</span>size<span class="token operator">:</span> AntSwitchSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span><span class="token literal-property property">onChange</span><span class="token operator">:</span> <span class="token punctuation">(</span>bool value<span class="token punctuation">)</span> <span class="token punctuation">{</span>  <span class="token punctuation">}</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span>
          <span class="token punctuation">]</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>

<span class="token punctuation">}</span></code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/switch"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2>`,4)]))}const h=a(o,[["render",e]]);export{d as __pageData,h as default};
