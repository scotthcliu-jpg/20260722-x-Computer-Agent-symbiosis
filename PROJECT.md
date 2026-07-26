# 20260722-x-Computer-Agent-symbiosis

## 架構定位（2026-07-23）

| 角色 | 正式位置 |
|---|---|
| Execution 本機 NTFS | `C:\Users\user\Documents\Codex\2026Claude\100_Todo\projects\active\20260722-x-Computer-Agent-symbiosis` |
| Version Git root | `C:\Users\user\Documents\Codex\2026Claude\100_Todo\projects\active\20260722-x-Computer-Agent-symbiosis` |
| Version GitHub | `https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis.git` |
| 預設 branch | `main` |
| 獨立 repo | `yes` |
| Knowledge／legacy source | `G:\我的雲端硬碟\2026Claude\100_Todo\projects\active\20260714Antigravity-symbiosys`（唯讀，不作為 Agent workspace） |
| 架構 release | `agent-sync-v1.2.0` |

**建立日期**：2026-07-14  
**最後更新**：2026-07-24
**GitHub Repo**：[scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis](https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis)（public）
**狀態**：公開指南與 2026-07-22 至 2026-07-24 對話 Q&A 已發布；後續以實機接力結果持續優化 AI Agent 工作環境

---

## 專案概述

本專案旨在驗證與發布「Codex x Claude x ChatGPT x Antigravity x OpenCode Symbiosis SOP」，確認多工具 AI 大腦如何共享規則、記憶、技能與 Git 接力工作流。原始本機工作資料夾仍保留名稱 `20260714Antigravity-symbiosys`，GitHub 公開 repo 已於 2026-07-22 更名為 `20260722-x-Computer-Agent-symbiosis`。

---

## 主要利害關係人

| 角色 | 姓名 | 單位 | 備註 |
|:--|:--|:--|:--|
| 專案發起人 / 用戶 | Scott | 慈濟基金會副執行長 | AI 分身主人 |
| AI 協作助手 | Antigravity | Google DeepMind | 當前對話執行大腦 |

---

## 執行流程與合規現況

### Step 1：確認與初始化規則入口（✅ 已完成）
- 讀取專案母體根目錄之 `AGENTS.md`。
- 本對話已成功加載全域與專案規則。

### Step 2：建立並配置專案記憶系統（✅ 已完成）
- 在專案根目錄下建立 `000_Agent/memory/` 目錄。
- 初始化 `000_Agent/memory/MEMORY.md` 檔案，作為本專案的本地記憶載體。

### Step 3：沙箱與讀寫測試（✅ 已完成）
- 驗證本對話中 Antigravity 具備該工作區的讀寫權限。

### Step 4：核心規則同步檢查（✅ 已完成）
- 執行 `powershell -NoProfile -File 000_Agent/scripts/sync_core_rules.ps1`，確認 `CLAUDE.md` 與 `AGENTS.md` 規則一致且已是最新狀態。

### Step 5：GitHub 自動備份 SOP（✅ 已完成）
- 執行 `new_project_github_setup.ps1` 建立初始私有倉庫；2026-07-22 更名並公開為 [scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis](https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis)。
- 產生本專案專屬備份腳本 `000_Agent/scripts/sync_20260714Antigravity_symbiosys_to_github.ps1`。
- 在全域 `000_Agent/scripts/sync-map.conf` 註冊本專案路徑。
- 順利執行首度備份，成功將 `README.md` 推送至 GitHub。

### Step 6：執行健康檢查（✅ 已完成）
- 執行 `000_Agent/scripts/sync-health.ps1`，所有 symbolic links、junctions 及關鍵檔案的存取檢驗均通過（[OK]）。

---

## 工作紀錄

### 2026-07-26
- 將公開 HTML 發布決策標準化為全域規則：公開靜態 HTML 預設 `main/docs` → GitHub Pages；需求升級採 Cloudflare Pages；表單、私有原始碼公開展示或特殊重導採 Netlify；Google Sites 作導覽入口。
- 建立 `docs/images/html-deployment-rules/01-html-deployment-rules.png` 與再生成規格，作為正式可版本化圖卡。

### 2026-07-26
- 建立 `docs/images/agent-sync-v1.2.0/`，納入三張繁體中文新手圖卡：架構時間軸、四份 canonical files 定位、專案圖卡同步流程。
- 同資料夾新增 `README.md`，記錄每張圖的用途、更新時機、`gpt-image-2` 再生成規格與新主機還原原則。
- 確立圖卡版本來源：GitHub／本機專案保存正式 PNG 與規格；Google Drive 不建立第二個可編輯圖片庫；Obsidian 僅保存索引與改版決策。

### 2026-07-24
- 將 2026-07-22 至 2026-07-24 的完整架構討論整理為 33 組白話 Q&A，納入 `docs/20260722-20260724-跨電腦跨AI-Agents架構對話Q&A.md`。
- Q&A 涵蓋 Workspace、SSOT、Google Drive／Obsidian／GitHub 分工、四個 Skills、HEAD／hash／HANDOFF、Claude 遷移與 `agent-sync-v1.1.0`。
- 確立後續改善方式：完整指南保存正式制度，Q&A 保存實務問題與判斷，再由單一 Migration Owner 發布架構升版。

### 2026-07-22
- 新增跨電腦、跨 AI Agent 共生架構完整指南。
- GitHub repo 更名為 `20260722-x-Computer-Agent-symbiosis` 並改為 public。

### 2026-07-14
- 啟動 Session，偵測到專案為空且無 `000_Agent/memory/`。
- 使用 `AskUserQuestion` 引導確認，並獲得使用者授權啟用記憶系統。
- 順利初始化專案 `MEMORY.md`。
- 處理 Windows 本機 credentials 衝突（清除無效的 `GITHUB_TOKEN` 環境變數，使其回退至 keyring 憑證），成功透過 `gh` 建立私有 repo。
- 執行首度同步備份並推送至 Github。
- 跑完 `sync_core_rules.ps1` 與 `sync-health.ps1` 驗證大腦共生環境健康度，均回報 [OK]。
- 建立並寫入專案 master doc `PROJECT.md`。
