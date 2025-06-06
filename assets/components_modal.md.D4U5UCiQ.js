import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const y=JSON.parse('{"title":"Modal 模态框","description":"","frontmatter":{},"headers":[],"relativePath":"components/modal.md","filePath":"components/modal.md"}'),o={name:"components/modal.md"};function e(c,n,l,u,r,k){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="modal-模态框" tabindex="-1">Modal 模态框 <a class="header-anchor" href="#modal-模态框" aria-label="Permalink to &quot;Modal 模态框&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">import</span> <span class="token string">&#39;../demo_block.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">ModalPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">ModalPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_ModalPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_ModalPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>ModalPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Modal&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>children<span class="token operator">:</span> <span class="token punctuation">[</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本使用&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;最简单的弹窗&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        AntModal<span class="token punctuation">.</span><span class="token function">alert</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span> <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;人在天边月上明&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;点击遮罩关闭&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        AntModal<span class="token punctuation">.</span><span class="token function">alert</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                            <span class="token literal-property property">closeOnMaskClick</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;人在天边月上明&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;显示关闭图标&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        AntModal<span class="token punctuation">.</span><span class="token function">alert</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;带关闭图标的弹窗&quot;</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;右上角有个关闭的小图标，点击它也可以关闭弹窗&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">showCloseButton</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">)</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;操作按钮&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;自定义按钮&quot;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    AntModal<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                        <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                        <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;人在天边月上明，风初紧，吹入画帘旌&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">closeOnAction</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                        <span class="token literal-property property">actions</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                          <span class="token function">AntButton</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">type</span><span class="token operator">:</span> AntButtonType<span class="token punctuation">.</span>primary<span class="token punctuation">,</span>
                            <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;在线阅读&quot;</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                              Navigator<span class="token punctuation">.</span><span class="token function">of</span><span class="token punctuation">(</span>context<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token function">pop</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                              <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&quot;在线阅读&quot;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                            <span class="token punctuation">}</span><span class="token punctuation">,</span>
                          <span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token function">AntButton</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;下载文件&quot;</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                              Navigator<span class="token punctuation">.</span><span class="token function">of</span><span class="token punctuation">(</span>context<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token function">pop</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                              <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&quot;下载文件&quot;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                            <span class="token punctuation">}</span><span class="token punctuation">,</span>
                          <span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token function">AntButton</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;分享&quot;</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                              Navigator<span class="token punctuation">.</span><span class="token function">of</span><span class="token punctuation">(</span>context<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token function">pop</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                              <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&quot;分享&quot;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                            <span class="token punctuation">}</span><span class="token punctuation">,</span>
                          <span class="token punctuation">)</span>
                        <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;无按钮操作&quot;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    AntModal<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                      <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;人在天边月上明，风初紧，吹入画帘旌,人在天边月上明，风初紧，吹入画帘旌&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">closeOnMaskClick</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;确认&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;确认&quot;</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                    AntModal<span class="token punctuation">.</span><span class="token function">confirm</span><span class="token punctuation">(</span>context<span class="token operator">:</span> context<span class="token punctuation">,</span> <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;人在天边月上明，风初紧，吹入画帘旌&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span>
              <span class="token punctuation">]</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span>
        <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/modal"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2>`,4)]))}const d=s(o,[["render",e]]);export{y as __pageData,d as default};
