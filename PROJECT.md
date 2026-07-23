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
| 架構 release | `agent-sync-v1.1.0` |

**建立日期**：2026-07-14  
**最後更新**：2026-07-22
**GitHub Repo**：[scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis](https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis)（public）
**狀態**：公開指南已發布 — 跨電腦／跨 AI Agent 四層架構、四個核心 Skills 與部署 SOP 已完成，進入實機接力驗證階段

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
