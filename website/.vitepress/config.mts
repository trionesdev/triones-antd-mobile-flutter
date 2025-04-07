import { defineConfig } from 'vitepress'
import Prism from 'prismjs';

const base ='/triones-antd-mobile-flutter/';
// const base ='/';
const RE = /{([\d,-]+)}/
// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: base,
  title: "TrionesDev Antd Flutter",
  description: "Triones Antd Flutter Development website",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: '开始', link: '/guide/index' },
      { text: '组件', link: '/components/overview' }
    ],

    sidebar: {
      '/components/':[
        { text: '组件总览', link: '/components/overview' },
        {
          text: '通用',
          items:[
            { text: 'Button 按钮', link: '/components/button' }
          ]
        },
        {
          text:'布局',
          items:[
              { text: 'Divider 分割线', link: '/components/divider' },
              { text: 'Grid 栅格', link: '/components/grid' },
              { text: 'Space 间距', link: '/components/space' },
          ]
        },
        {
          text:'导航',
          items:[
            { text: 'AppBar 导航栏', link: '/components/app-bar' },
            { text: 'TabBar 标签栏', link: '/components/tab-bar' },
            { text: 'Tabs 标签页', link: '/components/tabs' },
            { text: 'Breadcrumb 面包屑', link: '/components/breadcrumb' },
          ]
        },
        {
            text:'信息展示',
            items:[
                {text:'Avatar 头像',link:'/components/avatar'}
                ]
        },
        {
          text:'数据录入',
          items:[
            { text: 'Cascader 级联选择', link: '/components/cascader' },
            { text: 'Checkbox 复选框', link: '/components/checkbox' },
            { text: 'Form  表单', link: '/components/form' },
          ]
        }
      ],
      '/guide/':[
        { text: '指南', link: '/guide/index' },
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/trionesdev/triones-antd-mobile-flutter' }
    ],
    footer: {
      message: 'Released under the <a href="https://github.com/vuejs/vitepress/blob/main/LICENSE">MIT License</a>.',
      copyright: 'Copyright © 2015-present <a href="https://www.trionesdev.com">TrionesDev</a>'
    }
  },
  markdown: {
    config: (md) => {
      // console.log(md)
      md.renderer.rules.fence = (tokens, idx, options, env, self) => {
        const token = tokens[idx];

        let url="";
        const lang = token.info.trim()
        const regex = /preview:\s*(\S+)/; // 匹配 "preview:" 后的非空字符
        const match = lang.match(regex);
        if (match){
          url=`${base}web/index.html#${match[1]}`;
        }

        //md.utils.escapeHtml(token.content)
        const html = Prism.highlight(token.content, Prism.languages.javascript, 'javascript')
        return `<div class="triones-code">
            <div class="triones-code-block">
            <pre><code>${html}</code></pre>
            </div>
            <div class="triones-code-preview">
            <iframe src="${url}"/>
            </div>
        </div>`

      };
    }
  }
})
