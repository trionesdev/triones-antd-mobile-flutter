import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const y=JSON.parse('{"title":"Toast 轻提示","description":"","frontmatter":{},"headers":[],"relativePath":"components/toast.md","filePath":"components/toast.md"}'),o={name:"components/toast.md"};function e(c,n,l,u,r,k){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="toast-轻提示" tabindex="-1">Toast 轻提示 <a class="header-anchor" href="#toast-轻提示" aria-label="Permalink to &quot;Toast 轻提示&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">import</span> <span class="token string">&#39;../demo_block.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">ToastPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">ToastPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_ToastPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_ToastPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>ToastPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntPageContainer</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Toast&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>children<span class="token operator">:</span> <span class="token punctuation">[</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本使用&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>spacing<span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;轻提示&quot;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      AntToast<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                          <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Hello World, This is a long text&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;图标&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Wrap</span><span class="token punctuation">(</span>
              <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;成功&quot;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    AntToast<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                        <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>check<span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;操作成功&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;失败&quot;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    AntToast<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                        <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>close<span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;操作失败&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;位置&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Wrap</span><span class="token punctuation">(</span>
              <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;顶部&quot;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    AntToast<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                        <span class="token literal-property property">position</span><span class="token operator">:</span> AntToastPosition<span class="token punctuation">.</span>top<span class="token punctuation">,</span>
                        <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;顶部显示&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;底部&quot;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    AntToast<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                        <span class="token literal-property property">position</span><span class="token operator">:</span> AntToastPosition<span class="token punctuation">.</span>bottom<span class="token punctuation">,</span>
                        <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;底部显示&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span>
        <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/toast"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2>`,4)]))}const d=s(o,[["render",e]]);export{y as __pageData,d as default};
