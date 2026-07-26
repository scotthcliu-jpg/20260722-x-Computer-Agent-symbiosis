# HTML 網頁佈建規則圖卡

這張圖卡將 Scott 的公開 HTML 發布決策標準化。正式 PNG 以本資料夾與 GitHub `main` 為唯一版本來源；Obsidian 僅保存索引與決策紀錄。

| 檔案 | 用途 | 更新時機 |
|---|---|---|
| `01-html-deployment-rules.png` | 公開靜態 HTML、Cloudflare Pages、Netlify 與 Google Sites 的四種發佈路由。 | 全域 HTML 發布規則或平台分工改變。 |

## 圖卡規則

1. 公開靜態 HTML：`GitHub repo → main/docs → GitHub Pages → 分享網址`，首頁固定為 `docs/index.html`。
2. 流量或功能需求升級：優先使用 Cloudflare Pages。
3. 表單、私有原始碼公開展示或特殊重導：使用 Netlify。
4. Google Sites：作為慈濟／Google Workspace 的導覽首頁，嵌入或連結已部署 HTML。

## 再生成規格

- 生成工具：Codex 內建 GPT Image 2。
- 版型：直式 4:5、深靛藍底、暖白圓角資訊卡、青綠／藍／橘／紫四分流、繁體中文大字。
- 文字原則：以少字、清楚箭頭呈現「預設 GitHub Pages、例外 Cloudflare／Netlify、入口 Google Sites」。
- 更新原則：先以 `C:\Users\user\Documents\Codex\2026Claude\core_rule.md` 的最新規則為準；產生新檔後，同步更新本 README、專案交接與 GitHub。
