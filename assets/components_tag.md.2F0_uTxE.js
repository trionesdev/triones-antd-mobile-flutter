import{_ as s,c as a,o as p,ae as t}from"./chunks/framework.CJ_HZlMT.js";const y=JSON.parse('{"title":"Tag 标签","description":"","frontmatter":{},"headers":[],"relativePath":"components/tag.md","filePath":"components/tag.md"}'),o={name:"components/tag.md"};function e(c,n,l,r,u,k){return p(),a("div",null,n[0]||(n[0]=[t(`<h1 id="tag-标签" tabindex="-1">Tag 标签 <a class="header-anchor" href="#tag-标签" aria-label="Permalink to &quot;Tag 标签&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">TagPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">TagPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_TagPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_TagPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>TagPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Tag&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">ListView</span><span class="token punctuation">(</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基础使用&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Wrap</span><span class="token punctuation">(</span>
                <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
                <span class="token literal-property property">alignment</span><span class="token operator">:</span> WrapAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">closeable</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Link&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">closeable</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">closeIcon</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>cancel_outlined<span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Default&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;类型&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Wrap</span><span class="token punctuation">(</span>
                <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
                <span class="token literal-property property">alignment</span><span class="token operator">:</span> WrapAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">type</span><span class="token operator">:</span> AntTagType<span class="token punctuation">.</span>success<span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">type</span><span class="token operator">:</span> AntTagType<span class="token punctuation">.</span>processing<span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">type</span><span class="token operator">:</span> AntTagType<span class="token punctuation">.</span>warning<span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">type</span><span class="token operator">:</span> AntTagType<span class="token punctuation">.</span>error<span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;自定义颜色&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Wrap</span><span class="token punctuation">(</span>
                <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
                <span class="token literal-property property">alignment</span><span class="token operator">:</span> WrapAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff2db7f5</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff87d068</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff108ee9</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>red<span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;自定义样式&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Wrap</span><span class="token punctuation">(</span>
                <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
                <span class="token literal-property property">alignment</span><span class="token operator">:</span> WrapAlignment<span class="token punctuation">.</span>start<span class="token punctuation">,</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntTag</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token function">StateStyle</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">style</span><span class="token operator">:</span> <span class="token function">Style</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>white<span class="token punctuation">,</span>
                          <span class="token literal-property property">backgroundColor</span><span class="token operator">:</span> <span class="token function">Color</span><span class="token punctuation">(</span><span class="token number">0xff6c2121</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">border</span><span class="token operator">:</span> <span class="token function">StyleBorder</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">borderRadius</span><span class="token operator">:</span> <span class="token number">0</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tag1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">]</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/tag"></iframe></div></div>`,3)]))}const g=s(o,[["render",e]]);export{y as __pageData,g as default};
