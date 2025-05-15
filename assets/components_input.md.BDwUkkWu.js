import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Input 输入框","description":"","frontmatter":{},"headers":[],"relativePath":"components/input.md","filePath":"components/input.md"}'),o={name:"components/input.md"};function e(c,n,l,r,u,i){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="input-输入框" tabindex="-1">Input 输入框 <a class="header-anchor" href="#input-输入框" aria-label="Permalink to &quot;Input 输入框&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">InputPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">InputPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_InputPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_InputPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>InputPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Input 输入框&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>spacing<span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;普通使用&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
              <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&quot;请输入内容&quot;</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;类型&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntInput</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">type</span><span class="token operator">:</span> AntInputType<span class="token punctuation">.</span>password<span class="token punctuation">,</span>
                  <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&quot;请输入内容&quot;</span><span class="token punctuation">,</span>
                  <span class="token comment">// height: 24,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;自定义样式&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntInput</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token function">StateStyle</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token function">Style</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">borderRadius</span><span class="token operator">:</span> <span class="token number">0</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">borderBottom</span><span class="token operator">:</span> <span class="token function">StyleBorder</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>blue<span class="token punctuation">,</span>
                            <span class="token literal-property property">width</span><span class="token operator">:</span> <span class="token number">2</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">style</span><span class="token operator">:</span> BorderStyle<span class="token punctuation">.</span>solid<span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&quot;请输入内容&quot;</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntInput</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">decoration</span><span class="token operator">:</span> <span class="token function">BoxDecoration</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">border</span><span class="token operator">:</span> Border<span class="token punctuation">.</span><span class="token function">all</span><span class="token punctuation">(</span>color<span class="token operator">:</span> Colors<span class="token punctuation">.</span>black<span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&quot;请输入内容&quot;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">height</span><span class="token operator">:</span> <span class="token number">48</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">suffix</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>add<span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token comment">// height: 24,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/input"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>style</td><td>按钮样式</td><td>StateStyle</td><td></td></tr><tr><td>decoration</td><td>背景渲染</td><td>BoxDecoration</td><td></td></tr><tr><td>type</td><td>输入框类型</td><td>AntInputType: <code>text</code>| <code>password</code></td><td></td></tr><tr><td>prefix</td><td>前缀</td><td>Widget</td><td></td></tr><tr><td>suffix</td><td>后缀</td><td>Widget</td><td></td></tr><tr><td>placeholder</td><td>占位</td><td>String</td><td></td></tr><tr><td>value</td><td>值</td><td>String</td><td></td></tr><tr><td>onChange</td><td>值变化回调</td><td>Function(String val)</td><td></td></tr><tr><td>onBlur</td><td>失去焦点回调</td><td>Function(String val)</td><td></td></tr><tr><td>onFocus</td><td>获得焦点回调</td><td>Function(String val)</td><td></td></tr></tbody></table>`,5)]))}const y=s(o,[["render",e]]);export{d as __pageData,y as default};
