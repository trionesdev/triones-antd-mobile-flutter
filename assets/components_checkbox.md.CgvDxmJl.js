import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Checkbox 复选框","description":"","frontmatter":{},"headers":[],"relativePath":"components/checkbox.md","filePath":"components/checkbox.md"}'),o={name:"components/checkbox.md"};function e(c,n,l,u,r,i){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="checkbox-复选框" tabindex="-1">Checkbox 复选框 <a class="header-anchor" href="#checkbox-复选框" aria-label="Permalink to &quot;Checkbox 复选框&quot;">​</a></h1><p>复选框用于在一组可选项中进行多项选择。</p><h2 id="何时使用" tabindex="-1">何时使用 <a class="header-anchor" href="#何时使用" aria-label="Permalink to &quot;何时使用&quot;">​</a></h2><ul><li>需要在多个选项中选择一个或多个选项时</li><li>表单中需要进行多选操作时</li><li>需要开启或关闭某个功能时</li></ul><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">CheckboxPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">CheckboxPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_CheckboxPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_CheckboxPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>CheckboxPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
        <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
          <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Checkbox 复选框&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基础用法&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">mainAxisSize</span><span class="token operator">:</span> MainAxisSize<span class="token punctuation">.</span>min<span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntCheckbox</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntCheckbox</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;有描述的复选框&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
                <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;选项组&quot;</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">mainAxisSize</span><span class="token operator">:</span> MainAxisSize<span class="token punctuation">.</span>min<span class="token punctuation">,</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntCheckboxGroup</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">defaultValue</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token string">&quot;1&quot;</span><span class="token punctuation">,</span><span class="token string">&quot;3&quot;</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">onChange</span><span class="token operator">:</span> <span class="token punctuation">(</span>val<span class="token punctuation">)</span><span class="token punctuation">{</span>
                        <span class="token function">print</span><span class="token punctuation">(</span><span class="token string">&quot;------value changed-------&quot;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                        <span class="token function">print</span><span class="token punctuation">(</span>val<span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                        <span class="token function">AntCheckbox</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;1&quot;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;第一项&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token function">AntCheckbox</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&quot;2&quot;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;第二项&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token function">AntCheckbox</span><span class="token punctuation">(</span>
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
                    <span class="token function">Container</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">width</span><span class="token operator">:</span> double<span class="token punctuation">.</span>infinity<span class="token punctuation">,</span>
                      <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntCheckbox</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>

                            <span class="token literal-property property">color</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>grey<span class="token punctuation">,</span>
                            <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span>
                              <span class="token string">&quot;块级元素&quot;</span><span class="token punctuation">,</span>
                            <span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntCheckbox</span><span class="token punctuation">(</span>
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
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/checkbox"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><h3 id="antcheckbox-组件参数" tabindex="-1">AntCheckbox 组件参数 <a class="header-anchor" href="#antcheckbox-组件参数" aria-label="Permalink to &quot;AntCheckbox 组件参数&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>label</td><td>标签</td><td>Widget?</td><td>null</td></tr><tr><td>labelText</td><td>标签文本</td><td>String?</td><td>null</td></tr><tr><td>block</td><td>是否块级</td><td>bool</td><td>false</td></tr><tr><td>checked</td><td>是否选中</td><td>bool?</td><td>null</td></tr><tr><td>defaultChecked</td><td>是否选中(默认)</td><td>bool</td><td>false</td></tr><tr><td>disabled</td><td>是否禁用</td><td>bool?</td><td>false</td></tr><tr><td>checkedIcon</td><td>选中图标</td><td>Widget?</td><td>null</td></tr><tr><td>uncheckedIcon</td><td>未选中图标</td><td>Widget?</td><td>null</td></tr><tr><td>onChange</td><td>选中状态变化回调</td><td><code>ValueChanged&lt;bool&gt;?</code></td><td>null</td></tr><tr><td>onTap</td><td>点击回调</td><td><code>ValueChanged&lt;void&gt;?</code></td><td>null</td></tr><tr><td>value</td><td>值</td><td>dynamic</td><td>null</td></tr><tr><td>iconSize</td><td>图标大小</td><td>double?</td><td>null</td></tr><tr><td>spacing</td><td>间距</td><td>double?</td><td>4</td></tr></tbody></table><h3 id="antcheckboxgroup-组件参数" tabindex="-1">AntCheckboxGroup 组件参数 <a class="header-anchor" href="#antcheckboxgroup-组件参数" aria-label="Permalink to &quot;AntCheckboxGroup 组件参数&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>layout</td><td>布局方向</td><td>AntLayout</td><td><code>AntLayout.vertical</code></td></tr><tr><td>defaultValue</td><td>默认值</td><td><code>List&lt;dynamic&gt;?</code></td><td>null</td></tr><tr><td>value</td><td>当前值</td><td><code>List&lt;dynamic&gt;?</code></td><td>null</td></tr><tr><td>disabled</td><td>是否禁用</td><td>bool</td><td>false</td></tr><tr><td>iconSize</td><td>图标大小</td><td>double?</td><td>null</td></tr><tr><td>onChange</td><td>选中状态变化回调</td><td><code>ValueChanged&lt;List&lt;dynamic&gt;?&gt;?</code></td><td>null</td></tr><tr><td>children</td><td>子组件</td><td><code>List&lt;AntCheckbox&gt;?</code></td><td>null</td></tr></tbody></table><h3 id="组件特性" tabindex="-1">组件特性 <a class="header-anchor" href="#组件特性" aria-label="Permalink to &quot;组件特性&quot;">​</a></h3><ol><li>支持单个复选框和复选框组两种使用方式</li><li>支持自定义选中和未选中图标</li><li>支持水平和垂直布局</li><li>支持禁用状态</li><li>支持设置图标大小和间距</li><li>支持标签文本和自定义标签Widget</li><li>支持块级显示模式</li></ol><h3 id="使用说明" tabindex="-1">使用说明 <a class="header-anchor" href="#使用说明" aria-label="Permalink to &quot;使用说明&quot;">​</a></h3><ul><li>单个复选框可以通过[value]和[checked]属性控制选中状态</li><li>复选框组通过[value]属性控制整体选中状态，组内每个复选框通过[value]标识</li><li>[onChange]回调在选中状态改变时触发</li><li>[onTap]回调在点击复选框时触发</li><li>可以通过[disabled]属性禁用复选框</li><li>支持通过[label]或[labelText]设置标签</li><li>[block]属性控制复选框是否为块级元素</li></ul>`,15)]))}const h=a(o,[["render",e]]);export{d as __pageData,h as default};
