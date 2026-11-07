This is a personal fork of [mattpocock/skills](https://github.com/mattpocock/skills). It is for my own use: no releases, no plugin, no marketplace. `upstream` is the remote for Matt's repo.

Skills are organized into bucket folders under `skills/`:

- `engineering/`: Matt's skills for daily code work. Edited in place when I need to change one.
- `productivity/`: Matt's skills for daily non-code workflow tools. Edited in place when I need to change one.
- `non-matt/`: my own skills. Upstream sync ignores this folder.

The root `README.md` is the only skill index: its Reference section lists every skill with a one-line description, with the skill name linked to its `SKILL.md`. Bucket folders have no `README.md`. `engineering/` and `productivity/` group entries into **User-invoked** and **Model-invoked**; `non-matt/` uses a flat list.

Every `SKILL.md` is either user-invoked (`disable-model-invocation: true`, reachable only by the human) or model-invoked (model- or user-reachable). See [.agents/invocation.md](./.agents/invocation.md).

[`ask-matt`](./skills/engineering/ask-matt/SKILL.md) is the router that maps every user-reachable skill in `engineering/` and `productivity/` and how they relate. Whenever you add, rename, remove, or change how one of those skills fits the flows, re-read `ask-matt`'s `SKILL.md` and update it so the map stays accurate: a new skill it never mentions, or a stale one it still routes to, is a router that lies.

Skills are written in English. Do not translate them: upstream sync compares my version against Matt's, and a translation makes every line differ.

Never read, write, delete, or move anything under `~/.agents/skills` or `~/.claude/skills`. `scripts/link-skills.sh` writes there, so only the user runs it.

No em-dashes anywhere in this repo's prose (`SKILL.md` files, docs, `README.md`, ADRs, code comments). Where a sentence reaches for one, rewrite it instead with a comma, colon, period, parentheses, or a conjunction, whichever the sentence actually wants; never do a blind character substitution.

Every skill that dispatches a subagent says to start it with a fresh context window. Some harnesses (Codex, for one) fork the parent conversation by default, and a fork inherits the parent's context, which is what the subagent was meant to escape.

## Agent skills

### Triage labels

Canonical names, unchanged. See `docs/agents/triage-labels.md`.
