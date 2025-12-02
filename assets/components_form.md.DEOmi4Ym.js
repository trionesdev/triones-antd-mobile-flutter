import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Form 表单","description":"","frontmatter":{},"headers":[],"relativePath":"components/form.md","filePath":"components/form.md"}'),o={name:"components/form.md"};function e(c,n,l,u,r,k){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="form-表单" tabindex="-1">Form 表单 <a class="header-anchor" href="#form-表单" aria-label="Permalink to &quot;Form 表单&quot;">​</a></h1><blockquote><p>参考Antd Form实现的表单</p></blockquote><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">FormPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">FormPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_FormPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_FormPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>FormPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  final _formKey <span class="token operator">=</span> GlobalKey<span class="token operator">&lt;</span>AntFormState<span class="token operator">&gt;</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  final _formKey2 <span class="token operator">=</span> GlobalKey<span class="token operator">&lt;</span>AntFormState<span class="token operator">&gt;</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  final _formKey3 <span class="token operator">=</span> GlobalKey<span class="token operator">&lt;</span>AntFormState<span class="token operator">&gt;</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  final _formKey4 <span class="token operator">=</span> GlobalKey<span class="token operator">&lt;</span>AntFormState<span class="token operator">&gt;</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  final _formKey5 <span class="token operator">=</span> GlobalKey<span class="token operator">&lt;</span>AntFormState<span class="token operator">&gt;</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  final _formKey6 <span class="token operator">=</span> GlobalKey<span class="token operator">&lt;</span>AntFormState<span class="token operator">&gt;</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  final _formKey7 <span class="token operator">=</span> GlobalKey<span class="token operator">&lt;</span>AntFormState<span class="token operator">&gt;</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  <span class="token keyword">void</span> <span class="token function">setValues</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    Future<span class="token punctuation">.</span><span class="token function">delayed</span><span class="token punctuation">(</span><span class="token function">Duration</span><span class="token punctuation">(</span>milliseconds<span class="token operator">:</span> <span class="token number">500</span><span class="token punctuation">)</span><span class="token punctuation">,</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
      _formKey6<span class="token punctuation">.</span>currentState<span class="token operator">?.</span><span class="token function">setFieldsValue</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
        <span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;name&quot;</span><span class="token punctuation">,</span>
        <span class="token string-property property">&quot;items&quot;</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token string">&quot;1&quot;</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
      <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>

  @override
  <span class="token keyword">void</span> <span class="token function">initState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token function">setValues</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token keyword">super</span><span class="token punctuation">.</span><span class="token function">initState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>

  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
      <span class="token literal-property property">backgroundColor</span><span class="token operator">:</span> Colors<span class="token punctuation">.</span>white<span class="token punctuation">,</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>title<span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&#39;Form&#39;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本使用&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntForm</span><span class="token punctuation">(</span>
                <span class="token literal-property property">key</span><span class="token operator">:</span> _formKey<span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    AntFormItem<span class="token operator">&lt;</span>String<span class="token operator">&gt;</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;年龄&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token string">&#39;age&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;性别&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;gender&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    AntFormItem<span class="token operator">&lt;</span>String<span class="token operator">?</span><span class="token operator">&gt;</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;username&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">validator</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">if</span> <span class="token punctuation">(</span>value <span class="token operator">==</span> <span class="token keyword">null</span> <span class="token operator">||</span> value<span class="token punctuation">.</span>isEmpty<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                          <span class="token keyword">return</span> <span class="token string">&#39;请输入用户名&#39;</span><span class="token punctuation">;</span>
                        <span class="token punctuation">}</span>
                        <span class="token keyword">return</span> <span class="token keyword">null</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                          <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&#39;请输入用户名&#39;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">prefix</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>person<span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;password&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                          <span class="token literal-property property">type</span><span class="token operator">:</span> AntInputType<span class="token punctuation">.</span>password<span class="token punctuation">,</span>
                          <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&#39;请输入密码&#39;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">prefix</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>lock<span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">Column</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">spacing</span><span class="token operator">:</span> <span class="token number">10</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                        <span class="token function">AntButton</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;保存&quot;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                          <span class="token function-variable function">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                            _formKey<span class="token punctuation">.</span>currentState
                                <span class="token operator">?.</span><span class="token function">validateFields</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
                                <span class="token punctuation">.</span><span class="token function">then</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">values</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span><span class="token function">print</span><span class="token punctuation">(</span>values<span class="token punctuation">)</span><span class="token punctuation">}</span><span class="token punctuation">)</span>
                                <span class="token punctuation">.</span><span class="token function">catchError</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">err</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span><span class="token function">print</span><span class="token punctuation">(</span>err<span class="token punctuation">)</span><span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token punctuation">}</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token function">AntButton</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;赋值&quot;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                          <span class="token function-variable function">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                            _formKey<span class="token punctuation">.</span>currentState<span class="token operator">?.</span><span class="token function">setFieldsValue</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token string-property property">&quot;age&quot;</span><span class="token operator">:</span> <span class="token string">&quot;1&quot;</span><span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token punctuation">}</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token punctuation">]</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;垂直布局&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntForm</span><span class="token punctuation">(</span>
                <span class="token literal-property property">key</span><span class="token operator">:</span> _formKey2<span class="token punctuation">,</span>
                <span class="token literal-property property">layout</span><span class="token operator">:</span> AntFormLayout<span class="token punctuation">.</span>vertical<span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;用户名&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;username&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">validator</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">if</span> <span class="token punctuation">(</span>value <span class="token operator">==</span> <span class="token keyword">null</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                          <span class="token keyword">return</span> <span class="token string">&#39;请输入用户名&#39;</span><span class="token punctuation">;</span>
                        <span class="token punctuation">}</span>
                        <span class="token keyword">return</span> <span class="token keyword">null</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                          <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&#39;请输入用户名&#39;</span><span class="token punctuation">,</span>
                          <span class="token literal-property property">prefix</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>person<span class="token punctuation">)</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntButton</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;保存&quot;</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">block</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
                      <span class="token function-variable function">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                        _formKey2<span class="token punctuation">.</span>currentState
                            <span class="token operator">?.</span><span class="token function">validateFields</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
                            <span class="token punctuation">.</span><span class="token function">then</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">values</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span><span class="token function">print</span><span class="token punctuation">(</span>values<span class="token punctuation">)</span><span class="token punctuation">}</span><span class="token punctuation">)</span>
                            <span class="token punctuation">.</span><span class="token function">catchError</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">err</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span><span class="token function">print</span><span class="token punctuation">(</span>err<span class="token punctuation">)</span><span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;col flex&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntForm</span><span class="token punctuation">(</span>
                <span class="token literal-property property">key</span><span class="token operator">:</span> _formKey3<span class="token punctuation">,</span>
                <span class="token literal-property property">layout</span><span class="token operator">:</span> AntFormLayout<span class="token punctuation">.</span>horizontal<span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;用户名&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;username&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">validator</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">if</span> <span class="token punctuation">(</span>value <span class="token operator">==</span> <span class="token keyword">null</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                          <span class="token keyword">return</span> <span class="token string">&#39;请输入用户名&#39;</span><span class="token punctuation">;</span>
                        <span class="token punctuation">}</span>
                        <span class="token keyword">return</span> <span class="token keyword">null</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">labelCol</span><span class="token operator">:</span> <span class="token function">AntCol</span><span class="token punctuation">(</span>flex<span class="token operator">:</span> <span class="token number">100</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                          <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&#39;请输入用户名&#39;</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;col span&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntForm</span><span class="token punctuation">(</span>
                <span class="token literal-property property">key</span><span class="token operator">:</span> _formKey4<span class="token punctuation">,</span>
                <span class="token literal-property property">layout</span><span class="token operator">:</span> AntFormLayout<span class="token punctuation">.</span>horizontal<span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;用户名&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;username&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">validator</span><span class="token operator">:</span> <span class="token punctuation">(</span>value<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">if</span> <span class="token punctuation">(</span>value <span class="token operator">==</span> <span class="token keyword">null</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                          <span class="token keyword">return</span> <span class="token string">&#39;请输入用户名&#39;</span><span class="token punctuation">;</span>
                        <span class="token punctuation">}</span>
                        <span class="token keyword">return</span> <span class="token keyword">null</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">wrapperCol</span><span class="token operator">:</span> <span class="token function">AntCol</span><span class="token punctuation">(</span>span<span class="token operator">:</span> <span class="token number">18</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                          <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&#39;请输入用户名&#39;</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;标签靠右&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntForm</span><span class="token punctuation">(</span>
                <span class="token literal-property property">key</span><span class="token operator">:</span> _formKey5<span class="token punctuation">,</span>
                <span class="token literal-property property">labelAlign</span><span class="token operator">:</span> AntLabelAlign<span class="token punctuation">.</span>right<span class="token punctuation">,</span>
                <span class="token literal-property property">labelCol</span><span class="token operator">:</span> <span class="token function">AntCol</span><span class="token punctuation">(</span>flex<span class="token operator">:</span> <span class="token number">50</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;年龄&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token string">&#39;age&#39;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;性别&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;gender&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> field<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> field<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;Form List&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntForm</span><span class="token punctuation">(</span>
                <span class="token literal-property property">key</span><span class="token operator">:</span> _formKey6<span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;名称&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;name&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState state<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> state<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> state<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntFormList</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token string">&quot;items&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>context<span class="token punctuation">,</span> fields<span class="token punctuation">,</span> operations<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">var</span> list <span class="token operator">=</span> fields<span class="token punctuation">.</span><span class="token function">map</span><span class="token punctuation">(</span><span class="token punctuation">(</span>field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                          <span class="token keyword">return</span> <span class="token function">Row</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                              <span class="token function">Expanded</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">child</span><span class="token operator">:</span> AntFormItem<span class="token operator">&lt;</span>String<span class="token operator">?</span><span class="token operator">&gt;</span><span class="token punctuation">(</span>
                                  <span class="token literal-property property">name</span><span class="token operator">:</span> field<span class="token punctuation">.</span>name<span class="token punctuation">,</span>
                                  <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Item&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                  <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState state<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                                    <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                                      <span class="token literal-property property">value</span><span class="token operator">:</span> state<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                                      <span class="token literal-property property">onChange</span><span class="token operator">:</span> state<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                                    <span class="token punctuation">)</span><span class="token punctuation">;</span>
                                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                              <span class="token punctuation">)</span><span class="token punctuation">,</span>
                              <span class="token function">GestureDetector</span><span class="token punctuation">(</span>
                                <span class="token function-variable function">onTap</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>operations<span class="token punctuation">.</span>remove<span class="token operator">!</span><span class="token punctuation">(</span>field<span class="token punctuation">.</span>index<span class="token punctuation">)</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
                                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>delete<span class="token punctuation">)</span><span class="token punctuation">,</span>
                              <span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token punctuation">]</span><span class="token punctuation">,</span>
                          <span class="token punctuation">)</span><span class="token punctuation">;</span>
                        <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token function">toList</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                        <span class="token keyword">return</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                            <span class="token operator">...</span>list<span class="token punctuation">,</span>
                            <span class="token function">Row</span><span class="token punctuation">(</span>
                              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;添加&quot;</span><span class="token punctuation">,</span>
                                  <span class="token function-variable function">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>operations<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span><span class="token string">&quot;&quot;</span><span class="token punctuation">)</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
                                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;确定&quot;</span><span class="token punctuation">,</span>
                                  <span class="token function-variable function">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                                    _formKey6<span class="token punctuation">.</span>currentState
                                        <span class="token operator">?.</span><span class="token function">validateFields</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
                                        <span class="token punctuation">.</span><span class="token function">then</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">values</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span><span class="token function">print</span><span class="token punctuation">(</span>values<span class="token punctuation">)</span><span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                              <span class="token punctuation">]</span><span class="token punctuation">,</span>
                            <span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token punctuation">]</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntFormList</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token string">&quot;users&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>context<span class="token punctuation">,</span> fields<span class="token punctuation">,</span> operations<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                            <span class="token operator">...</span>fields<span class="token punctuation">.</span><span class="token function">map</span><span class="token punctuation">(</span><span class="token punctuation">(</span>field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                              <span class="token keyword">return</span> AntFormItem<span class="token operator">&lt;</span>String<span class="token operator">&gt;</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span>field<span class="token punctuation">.</span>index<span class="token punctuation">,</span> <span class="token string">&quot;name&quot;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Item&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState<span class="token operator">&lt;</span>String<span class="token operator">?</span><span class="token operator">&gt;</span> state<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                                  <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                                    <span class="token literal-property property">value</span><span class="token operator">:</span> state<span class="token punctuation">.</span>value<span class="token operator">?.</span><span class="token function">toString</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                    <span class="token literal-property property">onChange</span><span class="token operator">:</span> state<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                                  <span class="token punctuation">)</span><span class="token punctuation">;</span>
                                <span class="token punctuation">}</span><span class="token punctuation">,</span>
                              <span class="token punctuation">)</span><span class="token punctuation">;</span>
                            <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token function">Row</span><span class="token punctuation">(</span>
                              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;添加&quot;</span><span class="token punctuation">,</span>
                                  <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                                    Map<span class="token operator">&lt;</span>dynamic<span class="token punctuation">,</span> dynamic<span class="token operator">&gt;</span> user <span class="token operator">=</span> <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token keyword">null</span><span class="token punctuation">}</span><span class="token punctuation">;</span>
                                    operations<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span>user<span class="token punctuation">)</span><span class="token punctuation">;</span>
                                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                              <span class="token punctuation">]</span><span class="token punctuation">,</span>
                            <span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token punctuation">]</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;FormList With Sub FormList&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntForm</span><span class="token punctuation">(</span>
                <span class="token literal-property property">key</span><span class="token operator">:</span> _formKey7<span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                    <span class="token function">AntFormItem</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;名称&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token string">&#39;name&#39;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>AntFieldState state<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">value</span><span class="token operator">:</span> state<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> state<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                    <span class="token function">AntFormList</span><span class="token punctuation">(</span>
                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token string">&quot;items&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>context<span class="token punctuation">,</span> fields<span class="token punctuation">,</span> operations<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                        <span class="token keyword">var</span> list <span class="token operator">=</span> fields<span class="token punctuation">.</span><span class="token function">map</span><span class="token punctuation">(</span><span class="token punctuation">(</span>field<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                          <span class="token keyword">return</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                            <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                              <span class="token function">Row</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                  <span class="token function">Expanded</span><span class="token punctuation">(</span>
                                    <span class="token literal-property property">child</span><span class="token operator">:</span> AntFormItem<span class="token operator">&lt;</span>String<span class="token operator">&gt;</span><span class="token punctuation">(</span>
                                      <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span>field<span class="token punctuation">.</span>index<span class="token punctuation">,</span> <span class="token string">&quot;itemName&quot;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                      <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Item&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                      <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span> state<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                                        <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                                          <span class="token literal-property property">placeholder</span><span class="token operator">:</span> <span class="token string">&quot;请输入&quot;</span><span class="token punctuation">,</span>
                                          <span class="token literal-property property">value</span><span class="token operator">:</span> state<span class="token punctuation">.</span>value<span class="token punctuation">,</span>
                                          <span class="token literal-property property">onChange</span><span class="token operator">:</span> state<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                  <span class="token function">GestureDetector</span><span class="token punctuation">(</span>
                                    <span class="token function-variable function">onTap</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                                      operations<span class="token punctuation">.</span><span class="token function">remove</span><span class="token punctuation">(</span>field<span class="token punctuation">.</span>index<span class="token punctuation">)</span><span class="token punctuation">,</span>
                                    <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                    <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>delete<span class="token punctuation">)</span><span class="token punctuation">,</span>
                                  <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                <span class="token punctuation">]</span><span class="token punctuation">,</span>
                              <span class="token punctuation">)</span><span class="token punctuation">,</span>
                              <span class="token function">AntFormList</span><span class="token punctuation">(</span>
                                <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span>field<span class="token punctuation">.</span>index<span class="token punctuation">,</span> <span class="token string">&quot;users&quot;</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>context<span class="token punctuation">,</span> fields<span class="token punctuation">,</span> operationsSub<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                                  <span class="token keyword">return</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                                    <span class="token literal-property property">mainAxisSize</span><span class="token operator">:</span> MainAxisSize<span class="token punctuation">.</span>min<span class="token punctuation">,</span>
                                    <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                      <span class="token operator">...</span>fields<span class="token punctuation">.</span><span class="token function">map</span><span class="token punctuation">(</span><span class="token punctuation">(</span>field1<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                                        <span class="token keyword">return</span> AntFormItem<span class="token operator">&lt;</span>String<span class="token operator">&gt;</span><span class="token punctuation">(</span>
                                          <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token function">NamePath</span><span class="token punctuation">(</span><span class="token punctuation">[</span>
                                            field1<span class="token punctuation">.</span>index<span class="token punctuation">,</span>
                                            <span class="token string">&quot;name&quot;</span><span class="token punctuation">,</span>
                                          <span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                          <span class="token literal-property property">labelWidget</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;SubItem&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                          <span class="token literal-property property">builder</span><span class="token operator">:</span> <span class="token punctuation">(</span>  state<span class="token punctuation">)</span> <span class="token punctuation">{</span>
                                            <span class="token keyword">return</span> <span class="token function">AntInput</span><span class="token punctuation">(</span>
                                              <span class="token literal-property property">value</span><span class="token operator">:</span> state<span class="token punctuation">.</span>value<span class="token operator">?.</span><span class="token function">toString</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                              <span class="token literal-property property">onChange</span><span class="token operator">:</span> state<span class="token punctuation">.</span>didChange<span class="token punctuation">,</span>
                                            <span class="token punctuation">)</span><span class="token punctuation">;</span>
                                          <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                          <span class="token comment">// child: AntInput(),</span>
                                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                                      <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                      <span class="token function">Row</span><span class="token punctuation">(</span>
                                        <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                          <span class="token function">AntButton</span><span class="token punctuation">(</span>
                                            <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;添加&quot;</span><span class="token punctuation">,</span>
                                            <span class="token literal-property property">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                                              operationsSub<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
                                                <span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;subItem&quot;</span><span class="token punctuation">,</span>
                                              <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                                            <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                          <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                        <span class="token punctuation">]</span><span class="token punctuation">,</span>
                                      <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                    <span class="token punctuation">]</span><span class="token punctuation">,</span>
                                  <span class="token punctuation">)</span><span class="token punctuation">;</span>
                                <span class="token punctuation">}</span><span class="token punctuation">,</span>
                              <span class="token punctuation">)</span><span class="token punctuation">,</span>
                            <span class="token punctuation">]</span><span class="token punctuation">,</span>
                          <span class="token punctuation">)</span><span class="token punctuation">;</span>
                        <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token function">toList</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
                        <span class="token keyword">return</span> <span class="token function">Column</span><span class="token punctuation">(</span>
                          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                            <span class="token operator">...</span>list<span class="token punctuation">,</span>
                            <span class="token function">Row</span><span class="token punctuation">(</span>
                              <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;添加&quot;</span><span class="token punctuation">,</span>
                                  <span class="token function-variable function">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                                    operations<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
                                      <span class="token string-property property">&quot;itemName&quot;</span><span class="token operator">:</span> <span class="token string">&quot;&quot;</span><span class="token punctuation">,</span>
                                      <span class="token string-property property">&quot;users&quot;</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                        <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;1&quot;</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
                                      <span class="token punctuation">]</span><span class="token punctuation">,</span>
                                    <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;确定&quot;</span><span class="token punctuation">,</span>
                                  <span class="token function-variable function">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                                    _formKey7<span class="token punctuation">.</span>currentState<span class="token operator">?.</span><span class="token function">validateFields</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token function">then</span><span class="token punctuation">(</span>
                                      <span class="token punctuation">(</span><span class="token parameter">values</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                                        <span class="token function">print</span><span class="token punctuation">(</span>
                                          <span class="token string">&quot;------------------------values------------------------&quot;</span><span class="token punctuation">,</span>
                                        <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                        <span class="token function">print</span><span class="token punctuation">(</span>values<span class="token punctuation">)</span><span class="token punctuation">,</span>
                                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                                <span class="token function">AntButton</span><span class="token punctuation">(</span>
                                  <span class="token literal-property property">text</span><span class="token operator">:</span> <span class="token string">&quot;设置&quot;</span><span class="token punctuation">,</span>
                                  <span class="token function-variable function">onPressed</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
                                    _formKey7<span class="token punctuation">.</span>currentState<span class="token operator">?.</span><span class="token function">setFieldsValue</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
                                      <span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;test&quot;</span><span class="token punctuation">,</span>
                                      <span class="token string-property property">&quot;items&quot;</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                        <span class="token punctuation">{</span>
                                          <span class="token string-property property">&quot;itemName&quot;</span><span class="token operator">:</span> <span class="token string">&quot;111&quot;</span><span class="token punctuation">,</span>
                                          <span class="token string-property property">&quot;users&quot;</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                            <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;1&quot;</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
                                          <span class="token punctuation">]</span><span class="token punctuation">,</span>
                                        <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                        <span class="token punctuation">{</span>
                                          <span class="token string-property property">&quot;itemName&quot;</span><span class="token operator">:</span> <span class="token string">&quot;ddddd&quot;</span><span class="token punctuation">,</span>
                                          <span class="token string-property property">&quot;users&quot;</span><span class="token operator">:</span> <span class="token punctuation">[</span>
                                            <span class="token punctuation">{</span><span class="token string-property property">&quot;name&quot;</span><span class="token operator">:</span> <span class="token string">&quot;ssd&quot;</span><span class="token punctuation">}</span><span class="token punctuation">,</span>
                                          <span class="token punctuation">]</span><span class="token punctuation">,</span>
                                        <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                      <span class="token punctuation">]</span><span class="token punctuation">,</span>
                                    <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
                                  <span class="token punctuation">}</span><span class="token punctuation">,</span>
                                <span class="token punctuation">)</span><span class="token punctuation">,</span>
                              <span class="token punctuation">]</span><span class="token punctuation">,</span>
                            <span class="token punctuation">)</span><span class="token punctuation">,</span>
                          <span class="token punctuation">]</span><span class="token punctuation">,</span>
                        <span class="token punctuation">)</span><span class="token punctuation">;</span>
                      <span class="token punctuation">}</span><span class="token punctuation">,</span>
                    <span class="token punctuation">)</span><span class="token punctuation">,</span>
                  <span class="token punctuation">]</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
          <span class="token punctuation">]</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/form"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><h3 id="antform" tabindex="-1">AntForm <a class="header-anchor" href="#antform" aria-label="Permalink to &quot;AntForm&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>layout</td><td>表单布局，可选值为 horizontal（水平） vertical（垂直）</td><td><code>AntFormLayout</code></td><td><code>horizontal</code></td></tr><tr><td>labelCol</td><td>label 布局</td><td><code>AntCol</code></td><td></td></tr><tr><td>labelAlign</td><td>label 对其方式</td><td><code>AntLabelAlign</code></td><td><code>left</code></td></tr><tr><td>wrapperCol</td><td>内容布局</td><td><code>AntCol</code></td><td></td></tr><tr><td>spacing</td><td>间隔</td><td>double</td><td></td></tr><tr><td>rowSpacing</td><td>行间隔</td><td>double</td><td></td></tr><tr><td>columnSpacing</td><td>列间隔</td><td>double</td><td></td></tr></tbody></table><h3 id="antformitem" tabindex="-1">AntFormItem <a class="header-anchor" href="#antformitem" aria-label="Permalink to &quot;AntFormItem&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>layout</td><td>表单布局，可选值为 horizontal（水平） vertical（垂直）</td><td><code>AntFormLayout</code></td><td><code>horizontal</code></td></tr><tr><td>name</td><td>name属性</td><td><code>NamePath</code></td><td></td></tr><tr><td>label</td><td>标签</td><td><code>Widget</code></td><td></td></tr><tr><td>labelCol</td><td>label 布局,会覆盖Form 的labelCol</td><td><code>AntCol</code></td><td></td></tr><tr><td>labelAlign</td><td>label 对其方式,会覆盖Form的labelAlign</td><td><code>AntLabelAlign</code></td><td><code>left</code></td></tr><tr><td>wrapperCol</td><td>内容布局</td><td><code>AntCol</code></td><td></td></tr><tr><td>builder</td><td>Item创建函数</td><td><code>Widget Function(AntFieldState field)</code></td><td></td></tr><tr><td>onSaved</td><td>保存时回调</td><td><code>void Function(dynamic? newValue)</code></td><td></td></tr><tr><td>initialValue</td><td>初始值</td><td>dynamic</td><td></td></tr><tr><td>validator</td><td>验证函数</td><td><code>String? Function(dynamic? value)</code></td><td></td></tr><tr><td>required</td><td>是否必填</td><td>bool</td><td></td></tr></tbody></table><h3 id="antformlist" tabindex="-1">AntFormList <a class="header-anchor" href="#antformlist" aria-label="Permalink to &quot;AntFormList&quot;">​</a></h3><table tabindex="0"><thead><tr><th>属性</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>name</td><td>name属性</td><td><code>NamePath</code></td><td></td></tr><tr><td>builder</td><td>List创建函数</td><td><code>Widget Function(BuildContext context,List&lt;AntFormListField&gt; fields,AntFormListOperations operations)</code></td><td></td></tr></tbody></table>`,11)]))}const y=s(o,[["render",e]]);export{d as __pageData,y as default};
