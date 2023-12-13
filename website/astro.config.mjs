import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: "rise_ui",
      defaultLocale: "root",
      locales: {
        root: {
          label: "English",
          lang: "en",
        },
        "zh-cn": {
          label: "简体中文",
          lang: "zh-CN",
        },
      },
      social: {
        github: "https://github.com/leanflutter/rise_ui",
      },
      sidebar: [
        {
          label: "Guides",
          translations: { "zh-CN": "指南" },
          items: [
            {
              label: "Getting Started",
              link: "/guides/getting-started/",
              translations: { "zh-CN": "入门" },
            },
          ],
        },
        {
          label: "Widgets",
          items: [
            { label: "ActionIcon", link: "/widgets/action-icon/" },
            { label: "Button", link: "/widgets/button/" },
            { label: "Kbd", link: "/widgets/kbd/" },
          ],
        },
      ],
    }),
  ],
});
