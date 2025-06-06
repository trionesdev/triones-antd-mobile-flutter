import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"CalendarPicker 日历选择器","description":"","frontmatter":{},"headers":[],"relativePath":"components/calendar-picker.md","filePath":"components/calendar-picker.md"}'),o={name:"components/calendar-picker.md"};function e(c,n,l,u,r,k){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="calendarpicker-日历选择器" tabindex="-1">CalendarPicker 日历选择器 <a class="header-anchor" href="#calendarpicker-日历选择器" aria-label="Permalink to &quot;CalendarPicker 日历选择器&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/cupertino.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">CalendarPickerPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">CalendarPickerPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_CalendarPickerPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_CalendarPickerPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>CalendarPickerPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
        <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;CalendarPicker&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本用法&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;基本用法&quot;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">showAntCalendarPicker</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                          <span class="token literal-property property">onOk</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                            AntToast<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span> <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;$value&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                          <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;设置默认值&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;设置默认值&quot;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">showAntCalendarPicker</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> DateTime<span class="token punctuation">.</span><span class="token function">now</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">onOk</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                            AntToast<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span> <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;$value&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                          <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本用法(范围选择)&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;基本用法&quot;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">showAntCalendarRangePicker</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                          <span class="token literal-property property">onOk</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                            AntToast<span class="token punctuation">.</span><span class="token function">show</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                                <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span>
                                    <span class="token string">&quot;\${value?.elementAtOrNull(0)}~\${value?.elementAtOrNull(1)}&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                          <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;设置默认值(范围选择)&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                  <span class="token function">AntButton</span><span class="token punctuation">(</span>
                    <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;设置默认值&quot;</span><span class="token punctuation">,</span>
                    <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                      <span class="token function">showAntCalendarRangePicker</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                            DateTime<span class="token punctuation">.</span><span class="token function">now</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                            DateTime<span class="token punctuation">.</span><span class="token function">now</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span><span class="token function">Duration</span><span class="token punctuation">(</span>days<span class="token operator">:</span> <span class="token number">7</span><span class="token punctuation">)</span><span class="token punctuation">)</span>
                          <span class="token punctuation">]</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">onOk</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                            <span class="token function">showAntToast</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">context</span><span class="token operator">:</span> context<span class="token punctuation">,</span>
                                <span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span>
                                    <span class="token string">&quot;\${value?.elementAtOrNull(0)}~\${value?.elementAtOrNull(1)}&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                          <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token punctuation">]</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">]</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/calendar-picker"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><h3 id="日历选择器-showantcalendarpicker" tabindex="-1">日历选择器 <code>showAntCalendarPicker</code> <a class="header-anchor" href="#日历选择器-showantcalendarpicker" aria-label="Permalink to &quot;日历选择器 \`showAntCalendarPicker\`&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>value</td><td>当前值</td><td><code>DateTime? </code></td><td>DateTime.now()</td></tr><tr><td>onOk</td><td>确定按钮回调</td><td><code>ValueChanged&lt;DateTime?&gt;? </code></td><td></td></tr></tbody></table><h3 id="日历区间选择器-showantcalendarrangepicker" tabindex="-1">日历区间选择器 <code>showAntCalendarRangePicker</code> <a class="header-anchor" href="#日历区间选择器-showantcalendarrangepicker" aria-label="Permalink to &quot;日历区间选择器 \`showAntCalendarRangePicker\`&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>value</td><td>当前值</td><td><code>List&lt;DateTime&gt;?</code></td><td></td></tr><tr><td>onOk</td><td>确定按钮回调</td><td><code>ValueChanged&lt;List&lt;DateTime?&gt;?&gt;?</code></td><td></td></tr></tbody></table>`,8)]))}const y=a(o,[["render",e]]);export{d as __pageData,y as default};
