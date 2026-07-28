---
title: 2026-07-28 Agent 資料治理與主 Session 收工補充
status: active
---

# Agent 資料治理與主 Session 收工補充

本文件是既有架構 Q&A 的 2026-07-28 補充；不取代既有歷史問答。

## Q1：大量原始資料應放 Google Drive 還是 Agent Workspace？

採三層分工，不是二選一：

- **Google Drive（Knowledge）**：保存大量原始 PDF、掃描檔、影音、合約與共用 Excel，保留權限、團隊共用與來源版本。
- **本機 Workspace（Execution）**：只放本次需要分析的資料子集，供 OCR、轉檔、表格處理與批次分析使用。
- **GitHub（Version）**：保存程式、資料清冊、來源路徑、雜湊值、分析結果與必要的小型快照；不作大型二進位資料庫。

建議在專案中設置 `data/source/` 作為本機分析副本，並加入 `.gitignore`；以 `data/manifest.csv` 或 `data/README.md` 記錄 Drive 來源、同步日期、篩選條件與雜湊。

## Q2：「已忽略資料夾」是否等於 `temp/`？Workspace 內檔案會自動版控嗎？

兩者不同，而且檔案不會自動版控。

| 路徑 | 用途 | Git 行為 |
|---|---|---|
| `data/source/` | 可在本機保留、供分析的原始資料副本 | `.gitignore` 忽略，不提交 |
| `data/derived/` | 清理或分析的中間成果 | 視重現需求選擇提交或忽略 |
| `temp/` | 可隨時刪除的下載、OCR、轉檔暫存 | 忽略，不提交 |
| `docs/`、`reports/`、`scripts/` | 正式報告、程式與設定 | 應納入版控 |

檔案必須未被忽略、明確 `git add -- <指定檔案>`、commit 並 push，才會進入 GitHub。v1.2.0 收工只暫存指定檔案，禁止 `git add .`，因此不會把 `data/source/` 或 `temp/` 意外提交。

## Q3：同一專案同日多個 Session 都要正式收工嗎？

不用。正式收工是專案狀態結案，應由能看到完整工作區、所有 Session 摘要與 Git 狀態的主 Session 執行一次。其他 Session 應回傳完成事項、commit、驗證、待辦與重要 Q&A，避免重複改寫 `HANDOFF.md`、產生無意義 commit 或分散 Q&A。
