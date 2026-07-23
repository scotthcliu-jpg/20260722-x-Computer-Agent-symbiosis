# AGENTS.md

## 執行位置閘門（優先規則）

- 唯一可編輯與執行的專案路徑：`C:\Users\user\Documents\Codex\2026Claude\100_Todo\projects\active\20260722-x-Computer-Agent-symbiosis`。
- Version Git root：`C:\Users\user\Documents\Codex\2026Claude\100_Todo\projects\active\20260722-x-Computer-Agent-symbiosis`；remote：`https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis.git`；branch：`main`。
- Google Drive 專案路徑只作為 Knowledge／legacy source；禁止在 G 槽編輯、測試、建立 Git repo 或 commit。
- 「開工／接續」一律使用 `project-startup`；舊 `project-kickoff` 已刪除。
- `handoff_ready` 不是 `yes`、工作樹不乾淨或 local HEAD 不等於 remote HEAD 時，必須停止並回報 `blocked`。

## 啟動順序

1. 先讀 `PROJECT.md`，取得專案目標、背景、路徑、GitHub repo、重要決策。
2. 再讀 `HANDOFF.md`，確認上次停在哪裡、下一步要做什麼。
3. 執行前先檢查目前資料夾與 Git 狀態，避免在錯誤專案操作。

## 工作規則

- 使用繁體中文，先給重點結論，再補必要細節。
- 只新增或修改任務需要的檔案；不要覆蓋既有交接文件。
- `PROJECT.md` 放穩定專案事實，不放代理操作規則。
- `HANDOFF.md` 放最新交接，不放長篇推理。
- 重要修正、坑點、決策理由應在收工時寫入 Obsidian 第二大腦。
- 涉及刪除、重命名、大量搬移、公開發布前，必須先確認範圍。

## 收工要求

除非 Scott 明確限制範圍，收工時一定執行：

1. 更新 `PROJECT.md`。
2. 更新 `HANDOFF.md`。
3. commit 並 push 到 GitHub。
4. 將詳細紀錄寫入 Obsidian 第二大腦。
