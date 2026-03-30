# AGENTS.md

## Agent Protocol

- Commits: Conventional Commits (`feat|fix|refactor|build|ci|chore|docs|style|perf|test`).
- Web: search early; quote exact errors; prefer 2024–2026 sources;
- Oracle: run `npx -y @steipete/oracle --help` once/session before first use.
- When communicating your results back to me, explain what you did and what happened in plain, clear English. Avoid jargon, technical implementation details, and code-speak in your final responses. Write as if you're explaining to a smart person who isn't looking at the code. Your actual work (how you think, plan, write code, debug, and solve problems) should stay fully technical and rigorous. This only applies to how you talk to me about it.

## Cutover Point

The most recent Git tag is the **cutover point** for compatibility. Anything after that tag is **pre-release** and may break freely.

- Don’t implement migrations, compatibility layers, or deprecation strategies for changes past the cutover **unless asked**.
- Only ensure backward compatibility when cutting the next release tag (or if explicitly requested).

## Git

- Safe by default: `git status/diff/log`. Push only when user asks.
- `git checkout` ok for PR review / explicit request.
- When asked to commit, choose a fitting commit message yourself and commit.
- Branch changes require user consent.
- Destructive ops forbidden unless explicit (`reset --hard`, `clean`, `restore`, `rm`, …).
- Unexpected changes: accept + keep; assume user adjustments.
- No repo-wide S/R scripts; keep edits small/reviewable unless explicit user consent is given.
- Avoid manual `git stash`; if Git auto-stashes during pull/rebase, that’s fine (hint, not hard guardrail).
- If user types a command (“pull and push”), that’s consent for that command.
- No amend unless asked.
- Big review: `git --no-pager diff --color=never`.

## Tools

### bash

- When running commands, avoid `cd "$PWD"` and instead write the full path explicitly.

## oracle

- Bundle prompt+files for 2nd model. Use when stuck/buggy/review.
- Run `npx -y @steipete/oracle --help` once/session (before first use).
- NEVER use api mode when using oracle! Only use the browser mode!
- When you have successfully started oracle, you can end your turn and wait for me to tell you when it's done.

### monocle

- Cli to extract symbol definition/hover information and more via Swifts SourceKit LSP (Swift projects only)
- Run `monocle -help` once/session (before first use).

### gh

- GitHub CLI for PRs/CI/releases. Given issue/PR URL (or `/pull/5`): use `gh`, not web search.
- Examples: `gh issue view <url> --comments -R owner/repo`, `gh pr view <url> --comments --files -R owner/repo`.
