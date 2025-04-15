import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Image 图片","description":"","frontmatter":{},"headers":[],"relativePath":"components/image.md","filePath":"components/image.md"}'),o={name:"components/image.md"};function e(c,n,l,r,i,u){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="image-图片" tabindex="-1">Image 图片 <a class="header-anchor" href="#image-图片" aria-label="Permalink to &quot;Image 图片&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">ImagePage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">ImagePage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_ImagePageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_ImagePageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>ImagePage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Image 图片&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&#39;基础用法&#39;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">UnconstrainedBox</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">alignment</span><span class="token operator">:</span> Alignment<span class="token punctuation">.</span>centerLeft<span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntImage</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">src</span><span class="token operator">:</span>
                        <span class="token string">&#39;https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">width</span><span class="token operator">:</span> <span class="token number">200</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&#39;默认图片&#39;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">UnconstrainedBox</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">alignment</span><span class="token operator">:</span> Alignment<span class="token punctuation">.</span>centerLeft<span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntImage</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">width</span><span class="token operator">:</span> <span class="token number">200</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&#39;加载失败&#39;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">UnconstrainedBox</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">alignment</span><span class="token operator">:</span> Alignment<span class="token punctuation">.</span>centerLeft<span class="token punctuation">,</span>
                  <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntImage</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">src</span><span class="token operator">:</span>
                    <span class="token string">&#39;https://zos.alipayobjects.com/rmsportal/1.png&#39;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">width</span><span class="token operator">:</span> <span class="token number">200</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">]</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/image"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>src</td><td>图片地址</td><td>String</td><td>-</td></tr><tr><td>width</td><td>宽度</td><td>double</td><td>-</td></tr><tr><td>height</td><td>高度</td><td>double</td><td>-</td></tr><tr><td>preview</td><td>是否可以预览</td><td>bool</td><td>true</td></tr></tbody></table>`,5)]))}const m=a(o,[["render",e]]);export{d as __pageData,m as default};
