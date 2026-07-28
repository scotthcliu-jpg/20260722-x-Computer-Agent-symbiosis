# HANDOFF

> **2026-07-28 權威交接區塊：**本區塊優先於下方保留的歷史內容。

## 主 Session 正式收工中

- handoff_ready: `no`
- session start commit: `fad202cd304325c0d43d9ef46afc89d9defc08d8`
- expected Git root: `C:\Users\user\Documents\Codex\2026Claude\100_Todo\projects\active\20260722-x-Computer-Agent-symbiosis`
- expected branch: `main`
- expected remote: `https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis.git`
- main Session 已收齊今日的圖卡、四 Agent 記憶架構、HTML 發布標準化與資料治理交接摘要。
- 本次新增 Q&A 補充：`docs/2026-07-28-architecture-data-governance-addendum.md`。
- 下一位 Agent 必須先執行 `project-startup`；本次最終 commit 推送與 remote 驗證完成前不得開始寫入。

## 下一步

1. 如需實作大量資料分析，依 Q&A 建立受忽略的 `data/source/` 與可追溯 manifest。
2. 其他架構變更僅由該 release 的 Migration Owner 處理。

## 層級狀態

| Layer | 狀態 |
|---|---|
| Execution | local NTFS 專案；待本次文件 commit 後確認乾淨 |
| Version | 獨立 GitHub repo；待本次 push 與 remote HEAD 驗證 |
| Knowledge | Obsidian 專案筆記待本次收工更新 |

## 本次收工摘要

2026-07-26 主 session 已完成三組圖卡與再生成規格的整理：HTML 佈建規則、agent-sync v1.2.0，以及四個 AI Agent 的短、中、長期記憶架構。正式資產均已納入本專案。

## 目前狀態

- 專案 Git root、branch 與 remote 均符合 `PROJECT.md`。
- 收工流程已完成；`main` 的最終 local HEAD 與 GitHub remote HEAD 已再次確認相同。

## 交接資訊

- handoff_ready: yes
- session start commit: `c83ce7d50b4a5cf69dacf8c7750964d3e5b7abbe`
- expected Git root: `C:\Users\user\Documents\Codex\2026Claude\100_Todo\projects\active\20260722-x-Computer-Agent-symbiosis`
- expected branch: `main`
- expected remote: `https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis.git`
- last sync verification: `2026-07-26 20:34 +08:00`（收工完成後，final local HEAD = origin/main）
- last updater: `Codex @ TZNB1169`
- next Agent rule: 可先以 `project-startup` 進行唯讀檢查；若工作樹不乾淨、`handoff_ready` 非 yes 或 local HEAD 不等於 remote HEAD，必須停止並協調。

## 下一步

1. 若有新的公開 HTML，依 `docs/images/html-deployment-rules/README.md` 選擇並執行發布路徑。
2. 在第二台 Windows 電腦以另一個 Agent 跑一次 `project-startup` 與收工接力驗證。
3. 若跨專案共用規則有異動，先確認 Migration Owner，再發布新的架構 release。

## 注意事項

- Google Drive 是 Knowledge／legacy source，禁止在 G 槽編輯、測試、建立 Git repo 或 commit。
- 不可自動 rebase、merge、force push 或 destructive reset。
- 公開 repo 不得提交 token、session、cache、私人 Obsidian 內容或其他敏感資料。

## 同步狀態

| 層級 | 狀態 |
|---|---|
| Execution NTFS | 收工文件已更新 |
| Version GitHub | 本次 commit 已推送，final local HEAD = remote HEAD |
| Knowledge Google Drive | 本次未變更正式資料 |
| Obsidian | 詳細收工紀錄已更新 |
