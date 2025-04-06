import{_ as t,c as o,o as e,ae as r}from"./chunks/framework.CJ_HZlMT.js";const p=JSON.parse('{"title":"Button 按钮","description":"","frontmatter":{},"headers":[],"relativePath":"components/button.md","filePath":"components/button.md"}'),a={name:"components/button.md"};function i(l,n,s,d,u,c){return e(),o("div",null,n[0]||(n[0]=[r(`<h1 id="button-按钮" tabindex="-1">Button 按钮 <a class="header-anchor" href="#button-按钮" aria-label="Permalink to &quot;Button 按钮&quot;">​</a></h1><div class="triones-code"><div class="triones-code-block"><pre><code>import &#39;package:antd_flutter_example/demo_block.dart&#39;;
import &#39;package:flutter/material.dart&#39;;
import &#39;package:trionesdev_antd_mobile/antd.dart&#39;;

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State&lt;StatefulWidget&gt; createState() =&gt; _ButtonPageState();
}

class _ButtonPageState extends State&lt;ButtonPage&gt; {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        appBar: AntAppBar(
          title: Text(&#39;Button&#39;),
        ),
        body: ListView(children: [
          DemoBlock(
            title: &quot;普通使用&quot;,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 4.0,
              runSpacing: 4.0,
              children: [
                AntButton(
                  type: AntButtonType.primary,
                  text: &#39;Primary&#39;,
                  onPressed: () {
                    print(&#39;ElevatedButton&#39;);
                  },
                ),
                AntButton(
                  text: &#39;Default&#39;,
                  onPressed: () {
                    print(&#39;ElevatedButton&#39;);
                  },
                ),
                AntButton(
                  type: AntButtonType.text,
                  text: &#39;Text&#39;,
                  onPressed: () {
                    print(&#39;ElevatedButton&#39;);
                  },
                ),
                AntButton(
                  type: AntButtonType.link,
                  text: &#39;Link&#39;,
                  onPressed: () {
                    print(&#39;ElevatedButton&#39;);
                  },
                ),
              ],
            ),
          ),
          DemoBlock(
            title: &quot;类型&quot;,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    text: &#39;Primary&#39;,
                    color: Color(0xff000000),
                    variant: AntButtonVariant.solid,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.outlined,
                    color: Color(0xff000000),
                    text: &#39;Outlined&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.filled,
                    color: Color(0xff000000),
                    text: &#39;Filled&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.text,
                    color: Color(0xff000000),
                    text: &#39;Text&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.link,
                    color: Color(0xff000000),
                    text: &#39;Link&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                ]),
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    text: &#39;Primary&#39;,
                    variant: AntButtonVariant.solid,
                    color: Color(0xff1677FF),
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.outlined,
                    color: Color(0xff1677FF),
                    text: &#39;Outlined&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.filled,
                    color: Color(0xff1677FF),
                    text: &#39;Filled&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.text,
                    color: Color(0xff1677FF),
                    text: &#39;Text&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.link,
                    color: Color(0xff1677FF),
                    text: &#39;Link&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                ]),
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    text: &#39;Primary&#39;,
                    variant: AntButtonVariant.solid,
                    color: Color(0xffFF4D4F),
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.outlined,
                    color: Color(0xffFF4D4F),
                    text: &#39;Outlined&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.filled,
                    color: Color(0xffFF4D4F),
                    text: &#39;Filled&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.text,
                    color: Color(0xffFF4D4F),
                    text: &#39;Text&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.link,
                    color: Color(0xffFF4D4F),
                    text: &#39;Link&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                ]),
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    text: &#39;Primary&#39;,
                    variant: AntButtonVariant.solid,
                    color: Color(0xffEB2F96),
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.outlined,
                    color: Color(0xffEB2F96),
                    text: &#39;Outlined&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.filled,
                    color: Color(0xffEB2F96),
                    text: &#39;Filled&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.text,
                    color: Color(0xffEB2F96),
                    text: &#39;Text&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    variant: AntButtonVariant.link,
                    color: Color(0xffEB2F96),
                    text: &#39;Link&#39;,
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                ]),
              ],
            ),
          ),
          DemoBlock(
            title: &quot;大小&quot;,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    AntButton(
                      text: &#39;Large&#39;,
                      size: AntButtonSize.large,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      size: AntButtonSize.large,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      shape: AntButtonShape.circle,
                      size: AntButtonSize.large,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      text: &#39;Middle&#39;,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      text: &#39;Middle&#39;,
                      icon: Icon(Icons.add),
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      color: Color(0xffEB2F96),
                      shape: AntButtonShape.circle,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      text: &#39;Small&#39;,
                      size: AntButtonSize.small,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      size: AntButtonSize.small,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      size: AntButtonSize.small,
                      shape: AntButtonShape.circle,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          DemoBlock(
            title: &quot;图形&quot;,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    shape: AntButtonShape.circle,
                    icon: Icon(Icons.add),
                    onPressed: () {
                      print(&#39;ElevatedButton&#39;);
                    },
                  ),
                  AntButton(
                    shape: AntButtonShape.round,
                    icon: Icon(Icons.add),
                  )
                ]),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    AntButton(
                      text: &#39;Middle&#39;,
                      shape: AntButtonShape.circle,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      shape: AntButtonShape.round,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      shape: AntButtonShape.circle,
                      size: AntButtonSize.small,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      shape: AntButtonShape.circle,
                      size: AntButtonSize.middle,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      shape: AntButtonShape.circle,
                      size: AntButtonSize.large,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                    AntButton(
                      text: &#39;Middle&#39;,
                      icon: Icon(Icons.add),
                      shape: AntButtonShape.circle,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print(&#39;ElevatedButton&#39;);
                      },
                    ),
                  ],
                ),
              ],

            ),
          ),
          DemoBlock(title: &quot;自定义样式&quot;,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  AntButton(
                    style: StateStyle(
                      style: Style(borderColor: Colors.amber)
                    ),
                    text: &quot;Button&quot;,
                  )
                ],
              )
            ],),)
        ]));
  }
}
</code></pre></div><div class="triones-code-preview"><iframe src="/triones-antd-mobile-flutter/web/index.html/#/button"></iframe></div></div>`,2)]))}const A=t(a,[["render",i]]);export{p as __pageData,A as default};
