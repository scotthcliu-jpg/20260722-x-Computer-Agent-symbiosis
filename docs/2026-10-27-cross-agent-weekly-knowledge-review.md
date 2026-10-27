# 每週知識重整：跨 Agent 共用排程

狀態：**第 3 階段部署中**。本文件記錄跨 Agent 排程設計；[共用執行指令](../automation/weekly-knowledge-review/WORKFLOW.md) 是工作內容的唯一版本，[設定檔](../automation/weekly-knowledge-review/config.json) 選用 Codex 與 `preview`。是否已安裝觸發器以 `Check-Runner.ps1` 的即時結果為準。版本庫不保存私人筆記、憑證、執行快照或紀錄。

## 單一排程的設計

- **時間**：每週日 20:00，`Asia/Taipei`。
- **觸發者**：只保留一個 Windows Task Scheduler 工作 `SecondBrain-WeeklyKnowledgeReview`。指定主機需開機並登入，且 Obsidian Vault 與所選 Agent 可用。
- **執行者**：每次只選一個 Agent。切換 Claude、Codex 或 Gemini 時，更改執行者設定並完成同一份任務契約的試跑，不新增第二個正式觸發器。
- **權威**：本專案版本化的 `WORKFLOW.md` 決定工作內容；Obsidian 保存來源、知識頁與週報。各 Agent 的原生排程僅是可選入口，不各自維護不同提示詞。
- **失敗**：執行者、Vault、權限或來源不可用時，記錄本機失敗檔並嘗試 Windows 訊息通知；不自動改由另一 Agent 寫入。

## 共用任務契約

1. 對照上次成功週報，盤點 `Clippings/`、`創作庫/`、`知識庫/` 的變動；使用原始內容與紀錄日期判斷，不能只靠同步修改時間。
2. 讀取新增 Clippings，按主題提煉知識頁，逐項連回來源，區分已核實事實、歷史資料、草稿與待查推論。
3. 閱讀創作庫新增或修改的筆記，只把值得長期保留的概念補入相關知識頁。
4. 檢查缺少的連結、孤兒頁面、重複檔與知識缺口；可疑項目列入週報，不自動刪除或搬移。
5. 更新既有 `知識庫/index.md` 與 `log.md`，保留原檔 ID／路徑；寫前確認唯一目標，寫後讀回。若同名副本尚未釐清，停止這兩項寫入並報告。
6. 每週只產生一份 `每日筆記/YYYYMMDD_知識重整週報.md`，記錄來源、變更、驗證、未完成事項與下週建議；同一週重跑時先檢查已有週報，避免重複建立。

Evernote 歷史庫的批次消化是**另一條工作佇列**，先經人工試點確認來源與分類，再逐批加入；不得把 4,000 多篇匯入筆記當成本週新增。私人健康、家庭與其他敏感資料不進一般每週自動提煉；須遵守各自專案的交接與存放規則。

## 分階段啟用條件

| 階段 | 工作 | 完成標準 |
| --- | --- | --- |
| 0：盤點 | 確認三個 Agent 的命令列、Vault 存取及現有排程狀態 | 能指出唯一正式觸發者；找出缺失的執行者能力 |
| 1：唯讀試跑 | 用同一任務契約盤點來源並產出預覽，不寫 Vault | 來源範圍、日期、敏感分類及預期產物經人工核對 |
| 2：受控寫入 | 先處理 `index.md`／`log.md` 同名副本，再手動完成一次寫入與讀回 | 無新同名副本；週報、索引與知識頁互相一致 |
| 3A：單一預覽排程 | 安裝一個週日 20:00 觸發器，每次只複製四個指定資料夾的 Markdown 到 Git 忽略的本機快照，Agent 以唯讀沙盒產出預覽 | 首次排程執行可核對；Vault 無寫入 |
| 3B：自動寫入 | 確認舊 Claude 任務已停用，且所選 Agent 的寫入、讀回、重跑冪等性均通過實測後，另行開啟 | 一週只產生一份週報，索引與紀錄不產生副本 |
| 4：切換演練 | 改用另一 Agent 執行同一契約 | 相同來源、輸出與停止條件通過；舊執行者不再觸發 |

`Check-Runner.ps1` 唯讀檢查設定、命令、Vault 與 Windows 工作狀態；`Install-WeeklyKnowledgeReview.ps1` 建立單一觸發器；`Run-WeeklyKnowledgeReview.ps1` 是其啟動器。單把 `activation` 改成 `active` 不代表排程已安裝。執行快照與 CLI 結果保存在 Git 忽略的 `automation/weekly-knowledge-review/runs/`，含可能敏感的筆記內容，只留本機。

本機安裝前先執行 `Run-WeeklyKnowledgeReview.ps1 -Preflight`，需要人工演練時用 `-ManualPreview`；正式觸發器只呼叫沒有參數的啟動器。它在 Vault 不可讀、專案工作樹不乾淨或本機與遠端 commit 不一致時會停止。任務採「僅登入時執行」，若該週日 20:00 主機未開機或使用者未登入，該次不補跑。切換 Claude／Gemini 屬第 4 階段：完成各自非互動與唯讀驗證前，`validated_agents` 不得加入該 Agent。

## 2026-10-27 已驗證狀態

- 共用架構 `agent-sync-v1.2.3` 的 `sync-health -Agent All` 通過；本專案 `main` 與遠端一致。
- 本機可找到 Codex CLI 與 Claude CLI；Gemini CLI 尚未在 `PATH` 找到。Codex CLI 列有 Obsidian MCP；Claude CLI 的 MCP 健康查詢未完成，不視為已驗證。
- `Check-Runner.ps1` 已以三種執行者做唯讀檢查：Codex／Claude 命令可找到，Gemini 命令找不到，G 槽 Vault 可讀。PowerShell 5.1 的中文路徑由 UTF-8 設定檔讀取。
- Windows Task Scheduler 目前查到 `Claude-SyncHealth-Weekly`，這是同步架構健檢，不是知識重整。Claude 的 `weekly-knowledge-review` 指令檔存在，但其現行啟用狀態尚未確認。2026-10-27 打開 Claude Desktop，當前登入畫面顯示 Free 方案；官方說明把新版 Cowork 排程列為付費方案功能，不能將舊指令檔當成可運行的排程證據。
- Codex CLI 的 `approval=never` 會拒絕 Obsidian MCP；`--approve-for-me` 曾成功唯讀，但目前尚未驗證自動寫入。因此 3A 使用本機快照、`--ignore-user-config` 與 `--approve-for-me`；本機實測其沙盒為 `read-only`，且只讀快照，不開放 MCP，也不寫入 Vault。
- 2026-10-27 已把 `index.md`／`log.md` 與三組知識頁的 11 份副本移至 Vault `Archive/知識庫重複版本_20261027/`，無括號主檔及人工試跑週報均已讀回；索引 16 筆均存在。
- Scott 健康記錄專案 `handoff_ready: no`，私人健康整併不屬本排程的自動寫入範圍。

## 平台依據

- [Codex 非互動模式](https://developers.openai.com/codex/non-interactive-mode)與[排程任務](https://developers.openai.com/codex/automations)：CLI 可由腳本呼叫；Codex 的本機排程須符合本機檔案與應用程式可用條件。
- [Claude Code 非互動模式](https://code.claude.com/docs/en/headless)與[Claude Cowork 排程](https://support.claude.com/en/articles/13854387-schedule-recurring-tasks-in-claude-cowork)：CLI 可由腳本呼叫；新版 Cowork 排程主要在遠端執行，不能直接假設可讀本機 Vault。
- [Gemini CLI headless 模式](https://geminicli.com/docs/cli/tutorials/automation/)與[Gemini Apps 排程](https://support.google.com/gemini/answer/16316416?hl=en)：CLI 可供腳本呼叫；Gemini Apps 原生排程需另外驗證是否能存取同一來源。
