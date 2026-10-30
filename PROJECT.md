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
| Architecture release | `agent-sync-v1.2.4` |

## 已確認決策

1. 本機 NTFS 是唯一可執行及修改的專案工作區。
2. GitHub 是跨電腦正式版本與交接依據；只有 local HEAD 等於 remote HEAD 才能視為同步完成。
3. `PROJECT.md`、`HANDOFF.md`、`AGENTS.md`、`CLAUDE.md` 是專案接力的 canonical files。
4. Google Drive 用於發布 `core_rule.md`、同步 Obsidian 與保存核准資料；不作為 Git working tree，也不同步 `.git` 或暫存檔。
5. 公開靜態 HTML 預設由 `main/docs` 的 `docs/index.html` 透過 GitHub Pages 發布；Cloudflare Pages、Netlify、Google Sites 依文件規則分工。

## 開新專案 Skill（2026-10-30）

- 共用 `000_Agent/skills/new-project/SKILL.md` 以「開新專案」提供入口：收齊專案名稱、目標與期限、GitHub 倉庫名稱後，執行 `project-init-sync`，再將精確本機資料夾登錄 Codex App 左側專案清單。
- 架構 release `agent-sync-v1.2.4` 已推送並建立同名 tag；chezmoi 部署 hook 已加入 Codex／OpenCode Skill 入口。 `sync-health.ps1 -Agent All` 於本機驗證為 PASS。
- 2026-10-30 將 Skill 的三項輸入、十階段執行與驗證清單寫入 Obsidian `知識庫/20261030_開新專案Skill執行流程.md`；黑板圖正式版本及生成規格存於 `docs/images/new-project-skill/`，Vault 使用相同雜湊的展示副本。

## 跨 Agent 每週知識重整（2026-10-27）

- 共用工作規格：`automation/weekly-knowledge-review/WORKFLOW.md`，Claude、Codex、Gemini 共用同一份任務契約，不各自維護提示詞。
- 唯一正式觸發器：Windows Task Scheduler `SecondBrain-WeeklyKnowledgeReview`，每週日 20:00（Asia/Taipei），目前執行者為 Codex。
- 目前只啟用 `preview`：排程器唯讀複製 `Clippings/`、`創作庫/`、`知識庫/`、`每日筆記/` 的 Markdown 到 Git 忽略的本機快照，再由 Agent 分析；不寫入 Vault。
- 本機快照與執行結果保存在 `automation/weekly-knowledge-review/runs/`，可能含私人內容，禁止提交 GitHub。
- 2026-10-27 手動試跑完成：96 篇快照，結果為 `PREVIEW_COMPLETE`，試跑前後 Vault 檔案雜湊差異為 0。
- 切換 Agent 時只更換執行 adapter；新 Agent 必須先通過命令列、唯讀輸入與停止條件驗證，才可加入 `validated_agents`。Gemini CLI 目前未安裝。
- 自動寫入尚未啟用；須先確認舊 Claude 知識整理任務不會重複觸發，並通過寫入、讀回與重跑冪等性驗證。

## LLM Wiki 與 Obsidian 知識治理（2026-10-28）

- 已確認專案與知識層的分工：`PROJECT.md` 保存穩定專案事實、`HANDOFF.md` 保存最新交接、GitHub 保存正式版本；Obsidian `Projects/` 保存詳細歷程，`知識庫/` 保存跨專案可重用知識，`創作庫/` 保存經確認的輸出成果。
- Obsidian 新增並讀回兩篇知識頁：`知識庫/20261028_AI Agent專案與Obsidian知識庫分工.md`、`知識庫/20261028_AI Agent知識治理與跨平台工作流.md`；`知識庫/index.md` 更新為 18 篇，`log.md` 已記錄本次操作。
- 已用《餐巾紙的背後》的四步驟、六種問題與 SQVID 簡化框架產生原創手繪圖解；正式 Vault 圖片位於 `創作庫/AI Agent/20261028_AI Agent專案與Obsidian知識庫分工_餐巾紙圖解.png`，並由知識頁嵌入。
- 2026-10-27 即時手動預覽 run `20261027T214953` 完成 96 篇快照，結果為 `PREVIEW_COMPLETE`，live Vault 與 manifest 雜湊差異為 0。正式排程非週日 20:00 直接觸發會被安全閘門拒絕；臨時演練應使用 `-ManualPreview`。
- Google Workspace 遷移知識已以「治理建議」整理，包含盤點、身分與權限、單一權威、試點、驗收、AI 索引順序及避免平台鎖定；不代表目前遷移進度或已核准政策。

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
