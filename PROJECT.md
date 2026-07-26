# 20260722-x-Computer-Agent-symbiosis

## 專案定位

建立並維護跨電腦、跨 AI Agent 的協作架構，讓 Codex、Claude、ChatGPT、Antigravity 與 OpenCode 能以本機 NTFS、GitHub、Obsidian 與 Google Drive 的明確分工安全接力。

## 正式位置與版本

| 項目 | 確認內容 |
|---|---|
| Execution NTFS | `C:\Users\user\Documents\Codex\2026Claude\100_Todo\projects\active\20260722-x-Computer-Agent-symbiosis` |
| Version Git root | 同 Execution NTFS；independent repo：yes |
| GitHub | `https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis.git` |
| Branch | `main` |
| Knowledge／legacy source | Google Drive 僅供知識與舊資料參考，不可作為執行、Git 或提交位置 |
| Architecture release | `agent-sync-v1.2.0` |

## 已確認決策

1. 本機 NTFS 是唯一可執行及修改的專案工作區。
2. GitHub 是跨電腦正式版本與交接依據；只有 local HEAD 等於 remote HEAD 才能視為同步完成。
3. `PROJECT.md`、`HANDOFF.md`、`AGENTS.md`、`CLAUDE.md` 是專案接力的 canonical files。
4. Google Drive 用於發布 `core_rule.md`、同步 Obsidian 與保存核准資料；不作為 Git working tree，也不同步 `.git` 或暫存檔。
5. 公開靜態 HTML 預設由 `main/docs` 的 `docs/index.html` 透過 GitHub Pages 發布；Cloudflare Pages、Netlify、Google Sites 依文件規則分工。

## 2026-07-26 成果

- 完成 HTML 網頁佈建規則圖卡與再生成規格：`docs/images/html-deployment-rules/`。
- 完成 agent-sync v1.2.0 圖卡與再生成規格：`docs/images/agent-sync-v1.2.0/`。
- 新增整合版「四個 AI Agent 短、中、長期記憶架構」圖卡與 README：`docs/images/four-agent-memory-architecture/`。
- 所有圖卡正式檔案與再生成規格以本專案及 GitHub `main` 為唯一版本來源；Obsidian 僅保存決策索引。

## 下一里程碑

1. 依公開指南在第二台 Windows 電腦完成一次跨 Agent 接力驗證。
2. 完成實際公開 HTML 時，依佈建規則選擇 GitHub Pages、Cloudflare Pages、Netlify 或 Google Sites。
3. 只有指定的 Migration Owner 可修改跨專案共用 Skills、scripts、manifest 與 release。
