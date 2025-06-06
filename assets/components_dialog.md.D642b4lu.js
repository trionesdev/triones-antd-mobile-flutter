import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Dialog 对话框","description":"","frontmatter":{},"headers":[],"relativePath":"components/dialog.md","filePath":"components/dialog.md"}'),o={name:"components/dialog.md"};function e(c,n,l,r,u,i){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="dialog-对话框" tabindex="-1">Dialog 对话框 <a class="header-anchor" href="#dialog-对话框" aria-label="Permalink to &quot;Dialog 对话框&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">DialogPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">DialogPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_DialogPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_DialogPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>DialogPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Dialog 对话框&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本使用&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">8</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;最简单的小对话框&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">showAntAlertDialog</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                            <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                              <span class="token literal-property property">alignment</span><span class="token operator">:</span> Alignment<span class="token punctuation">.</span>center<span class="token punctuation">,</span>
                              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;人在天边月上明&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">onConfirm</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                              Navigator<span class="token punctuation">.</span><span class="token function">maybePop</span><span class="token punctuation">(</span>context<span class="token punctuation">)</span><span class="token punctuation">;</span>
                            <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;点击遮罩层关闭&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">showAntAlertDialog</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                            <span class="token literal-property property">closeOnMaskClick</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                              <span class="token literal-property property">alignment</span><span class="token operator">:</span> Alignment<span class="token punctuation">.</span>center<span class="token punctuation">,</span>
                              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;点击遮罩层关闭&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">onConfirm</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                              Navigator<span class="token punctuation">.</span><span class="token function">maybePop</span><span class="token punctuation">(</span>context<span class="token punctuation">)</span><span class="token punctuation">;</span>
                            <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;确认框&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">8</span><span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;确定&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">showAntConfirmDialog</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                            <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                              <span class="token literal-property property">alignment</span><span class="token operator">:</span> Alignment<span class="token punctuation">.</span>center<span class="token punctuation">,</span>
                              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;是否提交申请&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token literal-property property">onConfirm</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                              Navigator<span class="token punctuation">.</span><span class="token function">maybePop</span><span class="token punctuation">(</span>context<span class="token punctuation">)</span><span class="token punctuation">;</span>
                            <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/dialog"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><h3 id="提示对话框-showantalertdialog" tabindex="-1">提示对话框 <code>showAntAlertDialog</code> <a class="header-anchor" href="#提示对话框-showantalertdialog" aria-label="Permalink to &quot;提示对话框 \`showAntAlertDialog\`&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>maxWidth</td><td>最大宽度</td><td>double</td><td>-</td></tr><tr><td>content</td><td>内容</td><td>Widget</td><td></td></tr><tr><td>onConfirm</td><td>确认按钮回调</td><td><code>Function</code></td><td>true</td></tr><tr><td>closeOnMaskClick</td><td>点击遮罩层是否关闭</td><td><code>bool</code></td><td>false</td></tr><tr><td>confirmText</td><td>确认文本</td><td><code>String</code></td><td>-</td></tr></tbody></table><h3 id="确认对话框-showantconfirmdialog" tabindex="-1">确认对话框 <code>showAntConfirmDialog</code> <a class="header-anchor" href="#确认对话框-showantconfirmdialog" aria-label="Permalink to &quot;确认对话框 \`showAntConfirmDialog\`&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>maxWidth</td><td>最大宽度</td><td>double</td><td>-</td></tr><tr><td>content</td><td>内容</td><td>Widget</td><td></td></tr><tr><td>onConfirm</td><td>确认按钮回调</td><td><code>Function</code></td><td></td></tr><tr><td>onCancel</td><td>取消按钮回调</td><td><code>Function</code></td><td></td></tr><tr><td>closeOnMaskClick</td><td>点击遮罩层是否关闭</td><td><code>bool</code></td><td>false</td></tr><tr><td>cancelText</td><td>取消文本</td><td><code>String</code></td><td>-</td></tr><tr><td>confirmText</td><td>确认文本</td><td><code>String</code></td><td>-</td></tr></tbody></table>`,8)]))}const y=a(o,[["render",e]]);export{d as __pageData,y as default};
