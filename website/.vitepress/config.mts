import { defineConfig } from 'vitepress'

// const base ='/triones-antd-mobile-flutter/';
const base ='/';
const RE = /{([\d,-]+)}/
// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: base,
  title: "TrionesDev Antd Flutter",
  description: "Triones Antd Flutter Development website",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      { text: '组件', link: '/markdown-examples' }
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
          ]
        }
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/trionesdev/triones-antd-mobile-flutter' }
    ]
  },
  markdown: {
    config: (md) => {
      md.renderer.rules.fence = (tokens, idx, options, env, self) => {
        const token = tokens[idx];
        console.log(token)
        console.log(idx)
        console.log(options)
        console.log(self)


        let url="";
        const lang = token.info.trim()
        const regex = /preview:\s*(\S+)/; // 匹配 "preview:" 后的非空字符
        const match = lang.match(regex);
        if (match){
          console.log(match[1])
          url=`${base}${match[1]}`;
        }

        return `<div class="triones-code">
            <div class="triones-code-block">
            <pre><code>${md.utils.escapeHtml(token.content)}</code></pre>
            </div>
            <div class="triones-code-preview">
            <iframe src="${url}"/>
            </div>
        </div>`

      };
    }
  }
})
