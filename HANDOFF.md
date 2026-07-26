# HANDOFF

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
