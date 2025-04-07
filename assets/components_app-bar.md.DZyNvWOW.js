import{_ as a,c as s,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"AppBar 导航栏","description":"","frontmatter":{},"headers":[],"relativePath":"components/app-bar.md","filePath":"components/app-bar.md"}'),o={name:"components/app-bar.md"};function e(c,n,l,u,i,k){return t(),s("div",null,n[0]||(n[0]=[p(`<h1 id="appbar-导航栏" tabindex="-1">AppBar 导航栏 <a class="header-anchor" href="#appbar-导航栏" aria-label="Permalink to &quot;AppBar 导航栏&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:flutter/material.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">import</span> <span class="token string">&#39;../../../antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">AntAppBar</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token keyword">implements</span> <span class="token class-name">PreferredSizeWidget</span> <span class="token punctuation">{</span>
  <span class="token function">AntAppBar</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>title<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>back <span class="token operator">=</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>backIcon<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>backText<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>onBack<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>left<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>right<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>decoration<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>bottom<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>child<span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>childHeight <span class="token operator">=</span> <span class="token number">0</span><span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>bottomHeight <span class="token operator">=</span> <span class="token number">0</span><span class="token punctuation">,</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span>toolbarHeight<span class="token punctuation">}</span><span class="token punctuation">)</span>
      <span class="token operator">:</span> preferredSize <span class="token operator">=</span>
  <span class="token function">_PreferredAppBarSize</span><span class="token punctuation">(</span>toolbarHeight<span class="token punctuation">,</span> childHeight<span class="token punctuation">,</span> bottomHeight<span class="token punctuation">)</span><span class="token punctuation">;</span>

  final Widget<span class="token operator">?</span> title<span class="token punctuation">;</span>
  final bool<span class="token operator">?</span> back<span class="token punctuation">;</span>
  final Widget<span class="token operator">?</span> backIcon<span class="token punctuation">;</span>
  final Widget<span class="token operator">?</span> backText<span class="token punctuation">;</span>
  final <span class="token function">Function</span><span class="token punctuation">(</span>BuildContext context<span class="token punctuation">)</span><span class="token operator">?</span> onBack<span class="token punctuation">;</span>
  final List<span class="token operator">&lt;</span>Widget<span class="token operator">&gt;</span><span class="token operator">?</span> left<span class="token punctuation">;</span>
  final List<span class="token operator">&lt;</span>Widget<span class="token operator">&gt;</span><span class="token operator">?</span> right<span class="token punctuation">;</span>
  final BoxDecoration<span class="token operator">?</span> decoration<span class="token punctuation">;</span>
  final Widget<span class="token operator">?</span> child<span class="token punctuation">;</span>
  final double<span class="token operator">?</span> childHeight<span class="token punctuation">;</span>
  final Widget<span class="token operator">?</span> bottom<span class="token punctuation">;</span>
  final double<span class="token operator">?</span> bottomHeight<span class="token punctuation">;</span>
  final double<span class="token operator">?</span> toolbarHeight<span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_AntAppBarState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  final Size preferredSize<span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_AntAppBarState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>AntAppBar<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  @override
  <span class="token keyword">void</span> <span class="token function">initState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">super</span><span class="token punctuation">.</span><span class="token function">initState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>

  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    List<span class="token operator">&lt;</span>Widget<span class="token operator">&gt;</span> widgets <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">;</span>
    List<span class="token operator">&lt;</span>Widget<span class="token operator">&gt;</span> toolbarWidgets <span class="token operator">=</span> <span class="token punctuation">[</span>
      <span class="token function">Center</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> widget<span class="token punctuation">.</span>title<span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">]</span><span class="token punctuation">;</span>
    <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token punctuation">(</span>widget<span class="token punctuation">.</span>left <span class="token operator">!=</span> <span class="token keyword">null</span> <span class="token operator">&amp;&amp;</span> widget<span class="token punctuation">.</span>left<span class="token operator">!</span><span class="token punctuation">.</span>isNotEmpty<span class="token punctuation">)</span> <span class="token operator">||</span>
        widget<span class="token punctuation">.</span>back <span class="token operator">==</span> <span class="token boolean">true</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
      List<span class="token operator">&lt;</span>Widget<span class="token operator">&gt;</span> leftWidgets <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">;</span>
      <span class="token keyword">if</span> <span class="token punctuation">(</span>widget<span class="token punctuation">.</span>back <span class="token operator">==</span> <span class="token boolean">true</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
        leftWidgets<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span><span class="token function">GestureDetector</span><span class="token punctuation">(</span>
          <span class="token literal-property property">onTap</span><span class="token operator">:</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token keyword">if</span> <span class="token punctuation">(</span>widget<span class="token punctuation">.</span>onBack <span class="token operator">!=</span> <span class="token keyword">null</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
              widget<span class="token punctuation">.</span>onBack<span class="token operator">!</span><span class="token punctuation">.</span><span class="token function">call</span><span class="token punctuation">(</span>context<span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
              Navigator<span class="token punctuation">.</span><span class="token function">pop</span><span class="token punctuation">(</span>context<span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token punctuation">}</span>
          <span class="token punctuation">}</span><span class="token punctuation">,</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Row</span><span class="token punctuation">(</span>children<span class="token operator">:</span> <span class="token punctuation">[</span>
            widget<span class="token punctuation">.</span>backIcon <span class="token operator">??</span> <span class="token function">Icon</span><span class="token punctuation">(</span>Icons<span class="token punctuation">.</span>arrow_back<span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token keyword">if</span><span class="token punctuation">(</span>widget<span class="token punctuation">.</span>backText <span class="token operator">!=</span> <span class="token keyword">null</span><span class="token punctuation">)</span> widget<span class="token punctuation">.</span>backText<span class="token operator">!</span>
          <span class="token punctuation">]</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token punctuation">}</span>
      <span class="token keyword">if</span> <span class="token punctuation">(</span>leftWidgets<span class="token punctuation">.</span>isNotEmpty<span class="token punctuation">)</span> <span class="token punctuation">{</span>
        toolbarWidgets<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span><span class="token function">Positioned</span><span class="token punctuation">(</span>
          <span class="token literal-property property">left</span><span class="token operator">:</span> <span class="token number">8</span><span class="token punctuation">,</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Row</span><span class="token punctuation">(</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> leftWidgets<span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token punctuation">}</span>
    <span class="token punctuation">}</span>
    <span class="token keyword">if</span> <span class="token punctuation">(</span>widget<span class="token punctuation">.</span>right <span class="token operator">!=</span> <span class="token keyword">null</span> <span class="token operator">&amp;&amp;</span> widget<span class="token punctuation">.</span>right<span class="token operator">!</span><span class="token punctuation">.</span>isNotEmpty<span class="token punctuation">)</span> <span class="token punctuation">{</span>
      toolbarWidgets<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span><span class="token function">Positioned</span><span class="token punctuation">(</span>
        <span class="token literal-property property">right</span><span class="token operator">:</span> <span class="token number">8</span><span class="token punctuation">,</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Row</span><span class="token punctuation">(</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> widget<span class="token punctuation">.</span>right<span class="token operator">!</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">if</span> <span class="token punctuation">(</span>toolbarWidgets<span class="token punctuation">.</span>isNotEmpty<span class="token punctuation">)</span> <span class="token punctuation">{</span>
      widgets<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span><span class="token function">SizedBox</span><span class="token punctuation">(</span>
        <span class="token literal-property property">height</span><span class="token operator">:</span> widget<span class="token punctuation">.</span>toolbarHeight <span class="token operator">??</span> kToolbarHeight<span class="token punctuation">,</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Stack</span><span class="token punctuation">(</span>alignment<span class="token operator">:</span> Alignment<span class="token punctuation">.</span>center<span class="token punctuation">,</span> <span class="token literal-property property">children</span><span class="token operator">:</span> toolbarWidgets<span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
    <span class="token keyword">if</span> <span class="token punctuation">(</span>widget<span class="token punctuation">.</span>child <span class="token operator">!=</span> <span class="token keyword">null</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
      widgets<span class="token punctuation">.</span><span class="token function">add</span><span class="token punctuation">(</span>widget<span class="token punctuation">.</span>child<span class="token operator">!</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">return</span> <span class="token function">SafeArea</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
          <span class="token literal-property property">decoration</span><span class="token operator">:</span> widget<span class="token punctuation">.</span>decoration<span class="token punctuation">,</span>
          <span class="token literal-property property">height</span><span class="token operator">:</span> widget<span class="token punctuation">.</span>preferredSize<span class="token punctuation">.</span>height<span class="token punctuation">,</span>
          <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
            <span class="token literal-property property">children</span><span class="token operator">:</span> widgets<span class="token punctuation">,</span>
          <span class="token punctuation">)</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_PreferredAppBarSize</span> <span class="token keyword">extends</span> <span class="token class-name">Size</span> <span class="token punctuation">{</span>
  <span class="token function">_PreferredAppBarSize</span><span class="token punctuation">(</span><span class="token keyword">this</span><span class="token punctuation">.</span>toolbarHeight<span class="token punctuation">,</span> <span class="token keyword">this</span><span class="token punctuation">.</span>childHeight<span class="token punctuation">,</span> <span class="token keyword">this</span><span class="token punctuation">.</span>bottomHeight<span class="token punctuation">)</span>
      <span class="token operator">:</span> <span class="token keyword">super</span><span class="token punctuation">.</span><span class="token function">fromHeight</span><span class="token punctuation">(</span><span class="token punctuation">(</span>toolbarHeight <span class="token operator">??</span> kToolbarHeight<span class="token punctuation">)</span> <span class="token operator">+</span>
      <span class="token punctuation">(</span>childHeight <span class="token operator">??</span> <span class="token number">0</span><span class="token punctuation">)</span> <span class="token operator">+</span>
      <span class="token punctuation">(</span>bottomHeight <span class="token operator">??</span> <span class="token number">0</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  final double<span class="token operator">?</span> toolbarHeight<span class="token punctuation">;</span>
  final double<span class="token operator">?</span> childHeight<span class="token punctuation">;</span>
  final double<span class="token operator">?</span> bottomHeight<span class="token punctuation">;</span>
<span class="token punctuation">}</span>

</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/app-bar"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><table tabindex="0"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>style</td><td>按钮样式</td><td>StateStyle</td><td></td></tr><tr><td>title</td><td>标题</td><td>Widget</td><td></td></tr><tr><td>back</td><td>是否显示返回按钮</td><td>bool</td><td>true</td></tr><tr><td>backIcon</td><td>返回按钮图标</td><td>Widget</td><td>Icon(Icons.arrow_back)</td></tr><tr><td>backText</td><td>返回按钮文字</td><td>Widget</td><td></td></tr><tr><td>onBack</td><td>返回按钮点击事件</td><td>Function(BuildContext context)</td><td></td></tr><tr><td>left</td><td>左侧按钮</td><td>List&lt;Widget&gt;</td><td></td></tr><tr><td>right</td><td>右侧按钮</td><td>List&lt;Widget&gt;</td><td></td></tr><tr><td>decoration</td><td>背景装饰</td><td>BoxDecoration</td><td></td></tr><tr><td>bottom</td><td>底部组件</td><td>Widget</td><td></td></tr><tr><td>bottomHeight</td><td>底部组件高度</td><td>double</td><td>0</td></tr><tr><td>toolbarHeight</td><td>工具栏组件高度</td><td>double</td><td>0</td></tr><tr><td>child</td><td>子组件</td><td>Widget</td><td></td></tr></tbody></table>`,5)]))}const h=a(o,[["render",e]]);export{d as __pageData,h as default};
