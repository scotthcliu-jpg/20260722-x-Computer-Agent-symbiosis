# 每週知識重整：跨 Agent 共用排程草案

狀態：**尚未啟用**。本文件記錄跨 Agent 排程設計；[共用執行指令](../automation/weekly-knowledge-review/WORKFLOW.md) 是工作內容的唯一版本，[設定檔](../automation/weekly-knowledge-review/config.json) 目前維持 `draft` 與 `preview`。這些檔案不保存私人筆記內容、憑證或執行紀錄。

## 單一排程的設計

- **時間**：每週日 20:00，`Asia/Taipei`。
- **觸發者**：只保留一個中立排程器。第一階段以指定 Windows 主機的 Task Scheduler 為候選；主機需開機，且 Obsidian Vault 與所選 Agent 可用。
- **執行者**：每次只選一個 Agent。切換 Claude、Codex 或 Gemini 時，更改執行者設定並完成同一份任務契約的試跑，不新增第二個正式觸發器。
- **權威**：本專案版本化的 `WORKFLOW.md` 決定工作內容；Obsidian 保存來源、知識頁與週報。各 Agent 的原生排程僅是可選入口，不各自維護不同提示詞。
- **失敗**：執行者、Vault、權限或來源不可用時，記錄失敗並通知，不自動改由另一 Agent 寫入。

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
| 3：單一正式排程 | 停用或確認其他同任務觸發器，啟用一個週日 20:00 觸發器 | 首次排程執行與通知可核對；不重複寫入 |
| 4：切換演練 | 改用另一 Agent 執行同一契約 | 相同來源、輸出與停止條件通過；舊執行者不再觸發 |

`automation/weekly-knowledge-review/Check-Runner.ps1` 只讀取設定並檢查已選 Agent 命令與 Vault 是否可用；它不呼叫 Agent，也不建立排程。未來的正式觸發器需另行實作與驗證，不得僅把 `activation` 改為 `active` 就宣稱已啟用。

## 2026-10-27 已驗證狀態

- 共用架構 `agent-sync-v1.2.3` 的 `sync-health -Agent All` 通過；本專案 `main` 與遠端一致。
- 本機可找到 Codex CLI 與 Claude CLI；Gemini CLI 尚未在 `PATH` 找到。Codex CLI 列有 Obsidian MCP；Claude CLI 的 MCP 健康查詢未完成，不視為已驗證。
- `Check-Runner.ps1` 已以三種執行者做唯讀檢查：Codex／Claude 命令可找到，Gemini 命令找不到，G 槽 Vault 可讀。設定仍為 `draft`，因此三種情況皆不可正式執行。PowerShell 5.1 的中文路徑需放在 UTF-8 設定檔讀取，不能直接寫進無 BOM 的 `.ps1`。
- Windows Task Scheduler 目前查到 `Claude-SyncHealth-Weekly`，這是同步架構健檢，不是知識重整。Claude 的 `weekly-knowledge-review` 指令檔存在，但其現行啟用狀態尚未確認。2026-10-27 打開 Claude Desktop，當前登入畫面顯示 Free 方案；官方說明把新版 Cowork 排程列為付費方案功能，不能將舊指令檔當成可運行的排程證據。
- Codex 目前未查到本機 automation 設定。尚未建立新的 Windows、Codex、Claude 或 Gemini 知識重整排程。
- `知識庫/index.md` 與 `log.md` 有同名副本；在釐清唯一版本前，不啟動自動寫入。
- Scott 健康記錄專案 `handoff_ready: no`，私人健康整併不屬本排程的自動寫入範圍。

## 平台依據

- [Codex 非互動模式](https://developers.openai.com/codex/non-interactive-mode)與[排程任務](https://developers.openai.com/codex/automations)：CLI 可由腳本呼叫；Codex 的本機排程須符合本機檔案與應用程式可用條件。
- [Claude Code 非互動模式](https://code.claude.com/docs/en/headless)與[Claude Cowork 排程](https://support.claude.com/en/articles/13854387-schedule-recurring-tasks-in-claude-cowork)：CLI 可由腳本呼叫；新版 Cowork 排程主要在遠端執行，不能直接假設可讀本機 Vault。
- [Gemini CLI headless 模式](https://geminicli.com/docs/cli/tutorials/automation/)與[Gemini Apps 排程](https://support.google.com/gemini/answer/16316416?hl=en)：CLI 可供腳本呼叫；Gemini Apps 原生排程需另外驗證是否能存取同一來源。
