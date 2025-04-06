import{_ as s,c as a,o as p,ae as t}from"./chunks/framework.CJ_HZlMT.js";const y=JSON.parse('{"title":"Button 按钮","description":"","frontmatter":{},"headers":[],"relativePath":"components/button.md","filePath":"components/button.md"}'),o={name:"components/button.md"};function e(c,n,l,u,r,k){return p(),a("div",null,n[0]||(n[0]=[t(`<h1 id="button-按钮" tabindex="-1">Button 按钮 <a class="header-anchor" href="#button-按钮" aria-label="Permalink to &quot;Button 按钮&quot;">​</a></h1><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">ButtonPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">ButtonPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_ButtonPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_ButtonPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>ButtonPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntPageContainer</span><span class="token punctuation">(</span>
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
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span>
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
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span>
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
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>small<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>middle<span class="token punctuation">,</span>
                      <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xffEB2F96</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">icon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&#39;ElevatedButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">shape</span><span class="token operator">:</span> AntButtonShape<span class="token punctuation">.</span>circle<span class="token punctuation">,</span>
                      <span class="token literal-property property">size</span><span class="token operator">:</span> AntButtonSize<span class="token punctuation">.</span>large<span class="token punctuation">,</span>
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
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/button"></iframe></div></div>`,2)]))}const f=s(o,[["render",e]]);export{y as __pageData,f as default};
