import{_ as s,c as a,o as t,ae as p}from"./chunks/framework.CJ_HZlMT.js";const d=JSON.parse('{"title":"Tabs 标签页","description":"","frontmatter":{},"headers":[],"relativePath":"components/tabs.md","filePath":"components/tabs.md"}'),o={name:"components/tabs.md"};function e(c,n,l,u,r,k){return t(),a("div",null,n[0]||(n[0]=[p(`<h1 id="tabs-标签页" tabindex="-1">Tabs 标签页 <a class="header-anchor" href="#tabs-标签页" aria-label="Permalink to &quot;Tabs 标签页&quot;">​</a></h1><h2 id="代码演示" tabindex="-1">代码演示 <a class="header-anchor" href="#代码演示" aria-label="Permalink to &quot;代码演示&quot;">​</a></h2><div class="triones-code"><div class="triones-code-block"><pre><code><span class="token keyword">import</span> <span class="token string">&#39;package:antd_flutter_example/demo_block.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:flutter/widgets.dart&#39;</span><span class="token punctuation">;</span>
<span class="token keyword">import</span> <span class="token string">&#39;package:trionesdev_antd_mobile/antd.dart&#39;</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name">TabsPage</span> <span class="token keyword">extends</span> <span class="token class-name">StatefulWidget</span> <span class="token punctuation">{</span>
  <span class="token keyword">const</span> <span class="token function">TabsPage</span><span class="token punctuation">(</span><span class="token punctuation">{</span><span class="token keyword">super</span><span class="token punctuation">.</span>key<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

  @override
  State<span class="token operator">&lt;</span>StatefulWidget<span class="token operator">&gt;</span> <span class="token function">createState</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token function">_TabsPageState</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">class</span> <span class="token class-name">_TabsPageState</span> <span class="token keyword">extends</span> <span class="token class-name">State</span><span class="token operator">&lt;</span>TabsPage<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
  List<span class="token operator">&lt;</span>AntTabItemRecord<span class="token operator">&gt;</span> _tabItems <span class="token operator">=</span> <span class="token punctuation">[</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;1&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;2&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab2&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab2 Content&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;3&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab3&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab3 Content&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
  <span class="token punctuation">]</span><span class="token punctuation">;</span>

  List<span class="token operator">&lt;</span>AntTabItemRecord<span class="token operator">&gt;</span> _tabItems2 <span class="token operator">=</span> <span class="token punctuation">[</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;1&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 1&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;2&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab2&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 2&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;3&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab3&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 3&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;4&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab4&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 4&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;5&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab5&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 5&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;6&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab6&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 6&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;7&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab7&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 7&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;8&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab8&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 8&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;9&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab9&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 9&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token function">AntTabItemRecord</span><span class="token punctuation">(</span>key<span class="token operator">:</span> <span class="token string">&quot;10&quot;</span><span class="token punctuation">,</span> <span class="token literal-property property">label</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>padding<span class="token operator">:</span> EdgeInsets<span class="token punctuation">.</span><span class="token function">symmetric</span><span class="token punctuation">(</span>horizontal<span class="token operator">:</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab10&quot;</span> <span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token literal-property property">content</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tab1 Content 10&quot;</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">,</span>

  <span class="token punctuation">]</span><span class="token punctuation">;</span>

  @override
  Widget <span class="token function">build</span><span class="token punctuation">(</span><span class="token parameter">BuildContext context</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token function">AntScaffold</span><span class="token punctuation">(</span>
      <span class="token literal-property property">appBar</span><span class="token operator">:</span> <span class="token function">AntAppBar</span><span class="token punctuation">(</span>
        <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token function">Text</span><span class="token punctuation">(</span><span class="token string">&quot;Tabs 标签页&quot;</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token literal-property property">body</span><span class="token operator">:</span> <span class="token function">SingleChildScrollView</span><span class="token punctuation">(</span>
        <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Column</span><span class="token punctuation">(</span>
          <span class="token literal-property property">children</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;基本用法&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                <span class="token literal-property property">height</span><span class="token operator">:</span> <span class="token number">200</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntTabs</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">items</span><span class="token operator">:</span> _tabItems<span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token function">DemoBlock</span><span class="token punctuation">(</span>
              <span class="token literal-property property">title</span><span class="token operator">:</span> <span class="token string">&quot;滚动展示&quot;</span><span class="token punctuation">,</span>
              <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">Container</span><span class="token punctuation">(</span>
                <span class="token literal-property property">height</span><span class="token operator">:</span> <span class="token number">200</span><span class="token punctuation">,</span>
                <span class="token literal-property property">child</span><span class="token operator">:</span> <span class="token function">AntTabs</span><span class="token punctuation">(</span>
                  <span class="token literal-property property">items</span><span class="token operator">:</span> _tabItems2<span class="token punctuation">,</span>
                  <span class="token literal-property property">stretch</span><span class="token operator">:</span> <span class="token boolean">false</span><span class="token punctuation">,</span>
                <span class="token punctuation">)</span><span class="token punctuation">,</span>
              <span class="token punctuation">)</span><span class="token punctuation">,</span>
            <span class="token punctuation">)</span>
          <span class="token punctuation">]</span><span class="token punctuation">,</span>
        <span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html#/tabs"></iframe></div></div><h2 id="api" tabindex="-1">API <a class="header-anchor" href="#api" aria-label="Permalink to &quot;API&quot;">​</a></h2><table tabindex="0"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>style</td><td>样式</td><td>StateStyle</td><td></td></tr><tr><td>decoration</td><td>背景渲染</td><td></td><td></td></tr><tr><td>styles</td><td>样式对象</td><td>AntTabStyles</td><td></td></tr><tr><td>defaultActiveKey</td><td>默认激活页</td><td></td><td></td></tr><tr><td>activeKey</td><td>激活页</td><td></td><td></td></tr><tr><td>stretch</td><td>是否拉伸</td><td>bool</td><td>true</td></tr><tr><td>tabDecoration</td><td>tab子项背景渲染</td><td>Function(AntTabItemRecord item)</td><td></td></tr><tr><td>itemRender</td><td>tab子项渲染</td><td>Function(AntTabItemRecord item)</td><td></td></tr></tbody></table><h3 id="anttabitemrecord" tabindex="-1">AntTabItemRecord <a class="header-anchor" href="#anttabitemrecord" aria-label="Permalink to &quot;AntTabItemRecord&quot;">​</a></h3><table tabindex="0"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>默认值</th></tr></thead><tbody><tr><td>key</td><td>标识</td><td>String</td><td></td></tr><tr><td>label</td><td>tab文本</td><td>Widget</td><td></td></tr><tr><td>content</td><td>页面内容</td><td>Widget</td><td></td></tr></tbody></table>`,7)]))}const y=s(o,[["render",e]]);export{d as __pageData,y as default};
