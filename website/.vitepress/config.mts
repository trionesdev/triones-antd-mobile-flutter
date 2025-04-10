import {defineConfig} from 'vitepress'
import Prism from 'prismjs';
import * as fs from "fs";
import * as path from "node:path";

const base = '/triones-antd-mobile-flutter/';
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
            {text: '开始', link: '/guide/index'},
            {text: '组件', link: '/components/overview'}
        ],

        sidebar: {
            '/components/': [
                {text: '组件总览', link: '/components/overview'},
                {
                    text: '通用',
                    items: [
                        {text: 'Button 按钮', link: '/components/button'}
                    ]
                },
                {
                    text: '布局',
                    items: [
                        {text: 'Scaffold 脚手架', link: '/components/scaffold'},
                        {text: 'Divider 分割线', link: '/components/divider'},
                        {text: 'Grid 栅格', link: '/components/grid'},
                        {text: 'Space 间距', link: '/components/space'},
                    ]
                },
                {
                    text: '导航',
                    items: [
                        {text: 'AppBar 导航栏', link: '/components/app-bar'},
                        {text: 'TabBar 标签栏', link: '/components/tab-bar'},
                        {text: 'Tabs 标签页', link: '/components/tabs'},
                        {text: 'Breadcrumb 面包屑', link: '/components/breadcrumb'},
                    ]
                },
                {
                    text: '信息展示',
                    items: [
                        {text: 'Avatar 头像', link: '/components/avatar'},
                        {text: 'Image 图片', link: '/components/image'},
                        {text: 'List 列表', link: '/components/list'},
                        {text: 'Tag 标签', link: '/components/tag'},
                        {text: 'Timeline 时间轴', link: '/components/timeline'},
                    ]
                },
                {
                    text: '数据录入',
                    items: [
                        {text: 'Cascader 级联选择', link: '/components/cascader'},
                        {text: 'Checkbox 复选框', link: '/components/checkbox'},
                        {text: 'Form  表单', link: '/components/form'},
                        {text: 'Input  输入框', link: '/components/input'},
                        {text: 'Picker  选择器', link: '/components/picker'},
                        {text: 'CalendarPicker  日历选择器', link: '/components/calendar-picker'},
                        {text: 'CalendarDatetimePicker  日历时间选择器', link: '/components/calendar-datetime-picker'},
                        {text: 'Radio  单选框', link: '/components/radio'},
                        {text: 'Rate  评分', link: '/components/rate'},
                        {text: 'Switch  开关', link: '/components/switch'},
                        {text: 'InputNumber  数字输入框', link: '/components/input-number'},
                        {text: 'TextArea  文本域', link: '/components/text-area'},
                        {text: 'ImagesWall  图片墙', link: '/components/images-wall'},
                    ]
                },
                {
                    text: '反馈',
                    items: [
                        {text: 'ActionSheet  操作表', link: '/components/action-sheet'},
                        {text: 'Empty  空状态', link: '/components/empty'},
                        {text: 'Toast 轻提示', link: '/components/toast'},
                    ]
                }
            ],
            '/guide/': [
                {text: '指南', link: '/guide/index'},
            ]
        },

        socialLinks: [
            {icon: 'github', link: 'https://github.com/trionesdev/triones-antd-mobile-flutter'}
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
                let src = "";
                let previewUrl = "";
                const lang = token.info.trim()
                const regexPreview = /preview=\s*(\S+)/; // 匹配 "preview:" 后的非空字符
                const matchPreview = lang.match(regexPreview);
                if (matchPreview) {
                    previewUrl = `${base}web/index.html#${matchPreview[1]}`;
                }
                const regexSrc = /src=\s*(\S+)/; // 匹配 "preview:" 后的非空字符
                const matchSrc = lang.match(regexSrc);
                if (matchSrc) {
                    src = matchSrc[1]
                }
                let srcContent = "";
                if (src) {
                    const fileExists = fs.existsSync(path.resolve(src));
                    if (fileExists) {
                        srcContent = fs.readFileSync(path.resolve(src), 'utf8');
                    }
                }

                //md.utils.escapeHtml(token.content)
                const html = Prism.highlight(srcContent ?? token.content, Prism.languages.javascript, 'javascript')
                return `<div class="triones-code">
            <div class="triones-code-block">
            <pre><code>${html}</code></pre>
            </div>
            <div class="triones-code-preview">
            <iframe src="${previewUrl}"/>
            </div>
        </div>`

            };
        }
    }
})
