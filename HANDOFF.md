# HANDOFF

## 目前做到哪

已完成 HTML 網頁佈建規則圖卡、全域發布決策與本專案文件更新；2026-07-26 已移除錯指「朝聖之路」的 `.netlify/state.json`，本架構專案不再保留 Netlify site link。

## 目前狀態

- 目標 repo 工作樹與 GitHub 在本次開工時完全同步；架構 release、核心規則與 Skills hash 均正確。
- 全域 `sync-health` 目前因另一個南京行程檔案存在未提交修改而回報 FAIL；該異動未被本次處理或納入本專案。

## 接手狀態

- handoff_ready: yes
- session start commit: `54811ee18a431b3721210ffcc74f512f2c37fc11`
- expected Git root: `C:\Users\user\Documents\Codex\2026Claude\100_Todo\projects\active\20260722-x-Computer-Agent-symbiosis`
- expected branch: `main`
- expected remote: `https://github.com/scotthcliu-jpg/20260722-x-Computer-Agent-symbiosis.git`
- last sync verification: `2026-07-26 +08:00`；HTML 發布規則圖卡 commit `70d6eec481d7831266d518051860b3a104eb11cf` 已確認 local HEAD = GitHub remote HEAD；全域規則 commit 為 `1e74318`。
- last updater: `Codex @ TZNB1169`
- next Agent rule: GitHub remote HEAD 驗證完成後，可依 `docs/images/agent-sync-v1.2.0/README.md` 使用或更新圖卡；全域 `sync-health` 的南京行程未提交修改仍須由其擁有人處理。

## 本次完成

1. 新增 HTML 發布標準：公開靜態 HTML 預設 GitHub Pages；Cloudflare Pages、Netlify 與 Google Sites 各有明確例外定位。
2. 更新全域 `core_rule.md`，並同步至全域 `AGENTS.md`／`CLAUDE.md` 的核心規則區塊。
3. 新增 `docs/images/html-deployment-rules/01-html-deployment-rules.png` 與 README，保存 GPT Image 2 再生成規格。
4. README 與 PROJECT 新增圖卡入口和決策紀錄。

## 下一步

1. 架構規則升版時，依 `docs/images/agent-sync-v1.2.0/README.md` 與 `docs/images/html-deployment-rules/README.md` 同步更新受影響圖卡。
2. 重新執行 `sync-health -Agent Codex`，待南京行程未提交修改完成歸屬處理後恢復 PASS。

## 注意事項

- 舊本機來源資料夾仍名為 `20260714Antigravity-symbiosys`，這是 legacy path，不代表 GitHub repo 仍使用舊名稱。
- 不要在不同 Agent 或電腦上同時修改 `main`。
- 禁止自動 rebase、merge、force push 或 destructive reset。
- `handoff_ready: yes` 不取代開工時的 GitHub remote HEAD 驗證。
- 不可擅自提交或還原南京行程的未提交修改；它屬於另一個工作內容。

## 同步狀態

| 角色 | 狀態 |
|---|---|
| Execution 本機 NTFS | HTML 發布規則圖卡、再生成規格與專案文件已完成 |
| Version GitHub | commit `70d6eec` 已 push，且已驗證 local HEAD = remote HEAD |
| Knowledge Google Drive | 全域 `core_rule.md` 的正式本機來源已更新並推送；Google Drive 同步由桌面同步機制處理 |
| Obsidian | 此次未直接修改 Google Drive vault；正式 PNG 與規則來源已由 GitHub／全域規則 repo 保存 |

## 最後更新

- 時間：2026-07-26 +08:00
- 更新者：Codex @ TZNB1169
