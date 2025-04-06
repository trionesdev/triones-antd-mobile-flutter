import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const y=JSON.parse('{"title":"Cascader 级联选择","description":"","frontmatter":{},"headers":[],"relativePath":"components/cascader.md","filePath":"components/cascader.md"}'),o={name:"components/cascader.md"};function e(c,n,l,r,u,k){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="cascader-级联选择" tabindex="-1">Cascader 级联选择 <a class="header-anchor" href="#cascader-级联选择" aria-label="Permalink to &quot;Cascader 级联选择&quot;">​</a></h1><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">CascaderPickerPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">CascaderPickerPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_CascaderPickerPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_CascaderPickerPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>CascaderPickerPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  final List<span class="token operator">&lt;</span>AntCascaderPickerOption<span class="token operator">&gt;</span> _options <span class="token operator">=</span> <span class="token punctuation">[</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;江苏&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;jiangsu&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
      <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;泰州&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;taizhou&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
        <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;泰兴&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;taixing&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;靖江&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;靖江&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;苏州&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;suzhou&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;无锡&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;wuxi&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;山东&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;shandong&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;浙江&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;zhejiang&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;上海&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;shanghai&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;广东&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;guangdong&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;福建&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;fujian&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;云南&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;yunan&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;贵州&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;guizhou&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;四川&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;sichuan&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;湖南&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;hunan&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;湖北&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;hubei&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;河南&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;heinan&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntCascaderPickerOption</span><span class="token punctuation">(</span>label<span class="token operator">:</span> <span class="token string">&quot;河北&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;hebei&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
  <span class="token punctuation">]</span><span class="token punctuation">;</span>

  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntPageContainer</span><span class="token punctuation">(</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
        <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token keyword">const</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;CascaderPicker&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>children<span class="token operator">:</span> <span class="token punctuation">[</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本使用&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntButton</span><span class="token punctuation">(</span>
                <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;CascaderPicker&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                  AntCascaderPicker<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                      <span class="token literal-property property">options</span><span class="token operator">:</span> _options<span class="token punctuation">,</span>
                      <span class="token literal-property property">maxHeight</span><span class="token operator">:</span> <span class="token number">400</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onOk</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span>value<span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;设置默认值&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntButton</span><span class="token punctuation">(</span>
                <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;CascaderPicker 默认值&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                  AntCascaderPicker<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                      <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token string">&quot;jiangsu&quot;</span><span class="token punctuation">,</span><span class="token string">&quot;taizhou&quot;</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">options</span><span class="token operator">:</span> _options<span class="token punctuation">,</span>
                      <span class="token literal-property property">maxHeight</span><span class="token operator">:</span> <span class="token number">400</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onOk</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span>value<span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
            <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;设置默认值,并自动滚动到对应位置&quot;</span><span class="token punctuation">,</span>
            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntButton</span><span class="token punctuation">(</span>
                <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;CascaderPicker 默认值&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                  AntCascaderPicker<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                      <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token string">&quot;hebei&quot;</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">options</span><span class="token operator">:</span> _options<span class="token punctuation">,</span>
                      <span class="token literal-property property">maxHeight</span><span class="token operator">:</span> <span class="token number">400</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onOk</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span>value<span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">)</span>
        <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>

</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/cascader-picker"></iframe></div></div>`,2)]))}const d=s(o,[["render",e]]);export{y as __pageData,d as default};
