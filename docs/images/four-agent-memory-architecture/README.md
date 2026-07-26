# 四個 AI Agent 的短、中、長期記憶架構圖卡

| 檔案 | 用途 |
|---|---|
| `02-four-agent-memory-architecture.png` | 整合版圖卡：四個 Agent 的短、中、長期記憶；Codex 私有長期記憶；Google Drive 的發布與同步角色。 |

## 圖卡事實

- 短期記憶：本次聊天與已載入指令；四個工具的聊天歷史不互通。
- 中期記憶：專案接力檔與工作樹，包括 `AGENTS.md`、`CLAUDE.md`、`PROJECT.md`、`HANDOFF.md`。
- 長期記憶：`core_rule.md`、chezmoi、GitHub 與 Obsidian，提供跨電腦可驗證的知識與版本。
- `C:\Users\user\.codex\memories` 是 Codex 私有長期記憶，保存偏好、可重用經驗、`MEMORY.md` 索引與 rollout summaries 任務證據。其他 Agent 可以讀取，但不會自動載入，且不作為共用寫入區。
- Google Drive 用於發布全域 `core_rule.md`、同步 Obsidian 知識庫，以及發布核准的共用規則或 Skills 副本；它不是程式執行區、不是 GitHub 正式版本庫，也不應同步 `.git` 與暫存檔。
- 共用原則：共享正式檔案，不共用聊天歷史或私有記憶庫。

## 再生成規格

- 工具：Codex 內建 GPT Image 2。
- 版型：橫式 16:9、暖白底、深藍／青綠／藍／琥珀／珊瑚色資訊卡、繁體中文大字。
- 替換規則：第一版圖卡已作廢；本資料夾只保留本整合版。
