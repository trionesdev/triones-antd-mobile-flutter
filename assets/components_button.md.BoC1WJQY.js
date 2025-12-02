import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const y=JSON.parse('{"title":"Button 按钮","description":"","frontmatter":{},"headers":[],"relativePath":"components/button.md","filePath":"components/button.md"}'),o={name:"components/button.md"};function e(c,n,l,u,r,i){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="button-按钮" tabindex="-1">Button 按钮 <a class="header-anchor" href="#button-按钮" aria-label="Permalink to &quot;Button 按钮&quot;">​</a></h1><p>按钮用于开始一个即时操作。</p><h2 id="何时使用" tabindex="-1">何时使用 <a class="header-anchor" href="#何时使用" aria-label="Permalink to &quot;何时使用&quot;">​</a></h2><p>标记了一个（或封装一组）操作命令，响应用户点击行为，触发相应的业务逻辑。</p><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">ButtonPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">ButtonPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_ButtonPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_ButtonPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>ButtonPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Button&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">ListView</span><span class="token punctuation">(</span>children<span class="token operator">:</span> <span class="token punctuation">[</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;普通使用&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Wrap</span><span class="token punctuation">(</span>
              <span class="token literal-property property">direction</span><span class="token operator">:</span> Axis<span class="token punctuation">.</span>horizontal<span class="token punctuation">,</span>
              <span class="token literal-property property">alignment</span><span class="token operator">:</span> WrapAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
              <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">4.0</span><span class="token punctuation">,</span>
              <span class="token literal-property property">runSpacing</span><span class="token operator">:</span> <span class="token number">4.0</span><span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">type</span><span class="token operator">:</span> AntButtonType<span class="token punctuation">.</span>primary<span class="token punctuation">,</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Primary&#39;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Default&#39;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">type</span><span class="token operator">:</span> AntButtonType<span class="token punctuation">.</span>text<span class="token punctuation">,</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Text&#39;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">type</span><span class="token operator">:</span> AntButtonType<span class="token punctuation">.</span>link<span class="token punctuation">,</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Link&#39;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;类型&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">crossAxisAlignment</span><span class="token operator">:</span> CrossAxisAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
              <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">Wrap</span><span class="token punctuation">(</span>spacing<span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">runSpacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Primary&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff000000</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>solid<span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>outlined<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff000000</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Outlined&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>filled<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff000000</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Filled&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>text<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff000000</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Text&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>link<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff000000</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Link&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">Wrap</span><span class="token punctuation">(</span>spacing<span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">runSpacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Primary&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>solid<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff1677FF</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>outlined<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff1677FF</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Outlined&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>filled<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff1677FF</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Filled&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>text<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff1677FF</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Text&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>link<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff1677FF</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Link&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">Wrap</span><span class="token punctuation">(</span>spacing<span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">runSpacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Primary&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>solid<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffFF4D4F</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>outlined<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffFF4D4F</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Outlined&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>filled<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffFF4D4F</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Filled&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>text<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffFF4D4F</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Text&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>link<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffFF4D4F</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Link&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">Wrap</span><span class="token punctuation">(</span>spacing<span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">runSpacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Primary&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>solid<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>outlined<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Outlined&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>filled<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Filled&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>text<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Text&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">variant</span><span class="token operator">:</span> AntButtonVariant<span class="token punctuation">.</span>link<span class="token punctuation">,</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Link&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;大小&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">crossAxisAlignment</span><span class="token operator">:</span> CrossAxisAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">Wrap</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">runSpacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Large&#39;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Middle&#39;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Middle&#39;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Small&#39;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;图形&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">crossAxisAlignment</span><span class="token operator">:</span> CrossAxisAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">Wrap</span><span class="token punctuation">(</span>spacing<span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">runSpacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                    <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>round<span class="token punctuation">,</span>
                    <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span>
                <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">Wrap</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">runSpacing</span><span class="token operator">:</span> <span class="token number">4</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Middle&#39;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>round<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>middle<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&#39;Middle&#39;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>

            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token string">&quot;自定义样式&quot;</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
            <span class="token literal-property property">crossAxisAlignment</span><span class="token operator">:</span> CrossAxisAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
              <span class="token function">Wrap</span><span class="token punctuation">(</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token function">StateStyle</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token function">Style</span><span class="token punctuation">(</span>borderColor<span class="token operator">:</span> Colors<span class="token punctuation">.</span>amber<span class="token punctuation">)</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;Button&quot;</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span>
        <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/button"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><p>按钮的属性说明如下：</p><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>style</td><td>按钮样式</td><td>StateStyle?</td><td>null</td></tr><tr><td>type</td><td>按钮类型</td><td>AntButtonType?</td><td>null</td></tr><tr><td>variant</td><td>设置按钮的变体</td><td>AntButtonVariant?</td><td>null</td></tr><tr><td>text</td><td>按钮文字</td><td>String?</td><td>null</td></tr><tr><td>icon</td><td>按钮图标</td><td>Widget?</td><td>null</td></tr><tr><td>color</td><td>按钮颜色</td><td>Color?</td><td>null</td></tr><tr><td>shape</td><td>按钮形状</td><td>AntButtonShape</td><td>round</td></tr><tr><td>size</td><td>按钮大小</td><td>AntSize</td><td>middle</td></tr><tr><td>onPressed</td><td>点击事件</td><td>VoidCallback?</td><td>null</td></tr><tr><td>disabled</td><td>是否禁用</td><td>bool?</td><td>false</td></tr><tr><td>block</td><td>是否块级元素</td><td>bool?</td><td>false</td></tr><tr><td>danger</td><td>是否危险按钮</td><td>bool?</td><td>false</td></tr><tr><td>child</td><td>子组件</td><td>Widget?</td><td>null</td></tr></tbody></table><h3 id="antbuttontype-枚举值" tabindex="-1">AntButtonType 枚举值 <a class="header-anchor" href="#antbuttontype-枚举值" aria-label="Permalink to &quot;AntButtonType 枚举值&quot;">​</a></h3><table tabindex="0"><thead><tr><th>值</th><th>说明</th></tr></thead><tbody><tr><td>primary</td><td>主要按钮</td></tr><tr><td>text</td><td>文本按钮</td></tr><tr><td>link</td><td>链接按钮</td></tr></tbody></table><h3 id="antbuttonvariant-枚举值" tabindex="-1">AntButtonVariant 枚举值 <a class="header-anchor" href="#antbuttonvariant-枚举值" aria-label="Permalink to &quot;AntButtonVariant 枚举值&quot;">​</a></h3><table tabindex="0"><thead><tr><th>值</th><th>说明</th></tr></thead><tbody><tr><td>outlined</td><td>描边按钮</td></tr><tr><td>solid</td><td>实心按钮</td></tr><tr><td>filled</td><td>填充按钮</td></tr><tr><td>text</td><td>文本按钮</td></tr><tr><td>link</td><td>链接按钮</td></tr></tbody></table><h3 id="antbuttonshape-枚举值" tabindex="-1">AntButtonShape 枚举值 <a class="header-anchor" href="#antbuttonshape-枚举值" aria-label="Permalink to &quot;AntButtonShape 枚举值&quot;">​</a></h3><table tabindex="0"><thead><tr><th>值</th><th>说明</th></tr></thead><tbody><tr><td>circle</td><td>圆形</td></tr><tr><td>round</td><td>圆角矩形</td></tr></tbody></table><h3 id="antsize-枚举值" tabindex="-1">AntSize 枚举值 <a class="header-anchor" href="#antsize-枚举值" aria-label="Permalink to &quot;AntSize 枚举值&quot;">​</a></h3><table tabindex="0"><thead><tr><th>值</th><th>说明</th><th>尺寸</th></tr></thead><tbody><tr><td>small</td><td>小尺寸</td><td>高24px</td></tr><tr><td>middle</td><td>中尺寸</td><td>高32px</td></tr><tr><td>large</td><td>大尺寸</td><td>高48px</td></tr></tbody></table><h3 id="优先级说明" tabindex="-1">优先级说明 <a class="header-anchor" href="#优先级说明" aria-label="Permalink to &quot;优先级说明&quot;">​</a></h3><ol><li>child 和 text 属性中，优先使用 child 属性作为按钮内容。</li><li>当 icon 和 text 都存在时，按钮会同时显示图标和文字。</li><li>当只有 icon 且没有 text 和 child 时，按钮表现为图标按钮。</li></ol>`,19)]))}const d=s(o,[["render",e]]);export{y as __pageData,d as default};
