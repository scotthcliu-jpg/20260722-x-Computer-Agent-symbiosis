# 20260722-x-Computer-Agent-symbiosis

## 2026-07-28 主 Session 權威補充

- 今日正式收工由本 Session 統一執行；其他 Session 僅回傳交接摘要、重要 Q&A、驗證與待辦。
- 大量資料採三層分工：Google Drive 保存原始資料、local NTFS Workspace 保存本次分析子集、GitHub 保存程式、資料清冊、雜湊與正式成果。
- 本次新增的可學習決策見 [資料治理與主 Session 收工補充](docs/2026-07-28-architecture-data-governance-addendum.md)；既有架構 Q&A 保留為歷史主文件。

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
| Architecture release | `agent-sync-v1.2.3` |

## 已確認決策

1. 本機 NTFS 是唯一可執行及修改的專案工作區。
2. GitHub 是跨電腦正式版本與交接依據；只有 local HEAD 等於 remote HEAD 才能視為同步完成。
3. `PROJECT.md`、`HANDOFF.md`、`AGENTS.md`、`CLAUDE.md` 是專案接力的 canonical files。
4. Google Drive 用於發布 `core_rule.md`、同步 Obsidian 與保存核准資料；不作為 Git working tree，也不同步 `.git` 或暫存檔。
5. 公開靜態 HTML 預設由 `main/docs` 的 `docs/index.html` 透過 GitHub Pages 發布；Cloudflare Pages、Netlify、Google Sites 依文件規則分工。

## 跨 Agent 每週知識重整（2026-10-27）

- 共用工作規格：`automation/weekly-knowledge-review/WORKFLOW.md`，Claude、Codex、Gemini 共用同一份任務契約，不各自維護提示詞。
- 唯一正式觸發器：Windows Task Scheduler `SecondBrain-WeeklyKnowledgeReview`，每週日 20:00（Asia/Taipei），目前執行者為 Codex。
- 目前只啟用 `preview`：排程器唯讀複製 `Clippings/`、`創作庫/`、`知識庫/`、`每日筆記/` 的 Markdown 到 Git 忽略的本機快照，再由 Agent 分析；不寫入 Vault。
- 本機快照與執行結果保存在 `automation/weekly-knowledge-review/runs/`，可能含私人內容，禁止提交 GitHub。
- 2026-10-27 手動試跑完成：96 篇快照，結果為 `PREVIEW_COMPLETE`，試跑前後 Vault 檔案雜湊差異為 0。
- 切換 Agent 時只更換執行 adapter；新 Agent 必須先通過命令列、唯讀輸入與停止條件驗證，才可加入 `validated_agents`。Gemini CLI 目前未安裝。
- 自動寫入尚未啟用；須先確認舊 Claude 知識整理任務不會重複觸發，並通過寫入、讀回與重跑冪等性驗證。

## 2026-07-26 成果

- 完成 HTML 網頁佈建規則圖卡與再生成規格：`docs/images/html-deployment-rules/`。
- 完成 agent-sync v1.2.0 圖卡與再生成規格：`docs/images/agent-sync-v1.2.0/`。
- 新增整合版「四個 AI Agent 短、中、長期記憶架構」圖卡與 README：`docs/images/four-agent-memory-architecture/`。
- 所有圖卡正式檔案與再生成規格以本專案及 GitHub `main` 為唯一版本來源；Obsidian 僅保存決策索引。

## 下一里程碑

1. 2026-11-01 20:00 後檢查首次正式排程結果與 Windows Task Scheduler 狀態；此工作僅在指定使用者登入時執行，錯過時不補跑。
2. 驗證 Claude／Gemini adapter 時一次只啟用一個執行者，舊執行者不得保留第二個正式觸發器。
3. 自動寫入另列為後續階段；完成舊任務排除與冪等性驗證前維持 `preview`。
4. 依公開指南在第二台 Windows 電腦完成一次跨 Agent 接力驗證。
