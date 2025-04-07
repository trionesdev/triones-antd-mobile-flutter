import{_ as s,c as a,o as p,ae as t}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Radio 单选框","description":"","frontmatter":{},"headers":[],"relativePath":"components/radio.md","filePath":"components/radio.md"}'),o={name:"components/radio.md"};function e(c,n,l,u,r,i){return p(),a("div",null,n[0]||(n[0]=[t(`<h1 id="radio-单选框" tabindex="-1">Radio 单选框 <a class="header-anchor" href="#radio-单选框" aria-label="Permalink to &quot;Radio 单选框&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">RadioPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">RadioPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_RadioPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_RadioPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>RadioPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Radio 单选框&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基础用法&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">mainAxisSize</span><span class="token operator">:</span> MainAxisSize<span class="token punctuation">.</span>min<span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntRadio</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntRadio</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;有描述的单选框&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;选项组&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">mainAxisSize</span><span class="token operator">:</span> MainAxisSize<span class="token punctuation">.</span>min<span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntRadioGroup</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">defaultValue</span><span class="token operator">:</span> <span class="token string">&quot;1&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onChange</span><span class="token operator">:</span> <span class="token punctuation">(</span>val<span class="token punctuation">)</span><span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span>val<span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                        <span class="token function">AntRadio</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;1&quot;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;第一项&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token function">AntRadio</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;2&quot;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;第二项&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token function">AntRadio</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;3&quot;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;第三项&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token punctuation">]</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;沾满整行宽度&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">mainAxisSize</span><span class="token operator">:</span> MainAxisSize<span class="token punctuation">.</span>min<span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntRadio</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>grey<span class="token punctuation">,</span>
                          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span>
                            <span class="token string">&quot;块级元素&quot;</span><span class="token punctuation">,</span>
                          <span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntRadio</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>grey<span class="token punctuation">,</span>
                        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span>
                          <span class="token string">&quot;非块级元素&quot;</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/radio"></iframe></div></div>`,3)]))}const y=s(o,[["render",e]]);export{d as __pageData,y as default};
