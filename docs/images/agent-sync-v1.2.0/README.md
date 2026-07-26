# agent-sync v1.2.0 視覺教材

這三張圖卡是 `agent-sync-v1.2.0` 的新手導覽教材。正式 PNG 以本資料夾與 GitHub `main` 為唯一版本來源；Obsidian 只保存索引、用途與改版決策。

| 檔案 | 說明 | 更新時機 |
|:--|:--|:--|
| `01-agent-sync-v1.2.0-operation-timeline.png` | 初始化、開工、安全閘門、單一 Agent 工作、收工交棒與稽核流程。 | 工作生命週期或驗證規則改變。 |
| `02-agent-sync-v1.2.0-four-core-files.png` | `AGENTS.md`、`CLAUDE.md`、`PROJECT.md`、`HANDOFF.md` 的定位與開工閱讀順序。 | 四份 canonical files 的職責或內容改變。 |
| `03-project-card-sync-flow.png` | GitHub、Google Drive、Obsidian 與新主機的圖卡同步與還原分工。 | 資產保存、同步或新主機部署規則改變。 |

## 再生成規格

- 產生工具：Codex 內建 `gpt-image-2`。
- 版型：橫式 16:9、暖白底、圓角彩色資訊卡、繁體中文大字、新手導向。
- 文字原則：GitHub 是正式版本與新主機還原來源；Google Drive 不建立第二個可編輯的專案圖片庫；Obsidian 只保存索引與知識紀錄。
- 更新原則：先依本專案的 `PROJECT.md`、`HANDOFF.md` 與架構指南確認最新版規則；產出新檔後，更新本表、交接紀錄與 GitHub。生成結果不要求像素完全相同，但必須維持相同事實、結構與用途。

## 使用與交付

- 文件或簡報請直接使用本資料夾的 PNG，不要引用 Codex 的生成暫存目錄。
- 對外發布前，確認圖片不含帳號、token、內部路徑或未核准資訊。
- 新主機只需從 GitHub clone 本專案，即可還原 PNG 與這份再生成規格；接手前仍須執行 `project-startup` 驗證。
