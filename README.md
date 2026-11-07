# Skills

A personal fork of [mattpocock/skills](https://github.com/mattpocock/skills). I edit Matt's skills to suit how I work, and keep skills of my own alongside them. It is for my own use: no releases, no plugin.

## Layout

- `skills/engineering/`: Matt's skills for code work.
- `skills/productivity/`: Matt's skills for non-code workflow.
- `skills/non-matt/`: my own skills.

The [Reference](#reference) section below lists every skill.

Skills split on one axis: who can invoke them. **User-invoked** skills are reachable only when I type them (e.g. `/grill-me`); their job is to orchestrate. **Model-invoked** skills can be invoked by me or reached for automatically by the agent when the task fits; they hold the reusable discipline. A user-invoked skill may invoke model-invoked skills, but never another user-invoked one.

## Why these skills exist

They fix four common failure modes of coding agents.

1. **The agent didn't do what I want.** Misalignment is the most common failure in software development, and it is the same with agents. The fix is a grilling session, where the agent asks detailed questions before building: [`/grill-me`](./skills/productivity/grill-me/SKILL.md) for non-code uses, [`/grill-with-docs`](./skills/engineering/grill-with-docs/SKILL.md) for code. Use them every time before a change.
2. **The agent is too verbose.** Dropped into a project, an agent has to guess the jargon, so it uses 20 words where 1 will do. The fix is a shared language in `GLOSSARY.md`, plus ADRs for hard-to-explain decisions, both built up inside `/grill-with-docs`. Naming becomes consistent, the codebase is easier to navigate, and the agent spends fewer tokens thinking. Example: "a problem with the materialization cascade" instead of "a problem when a lesson inside a section of a course is made real (given a spot in the file system)".
3. **The code doesn't work.** Without feedback on how its code runs, the agent flies blind. The fix is the usual feedback loops (static types, browser access, automated tests). [`/tdd`](./skills/engineering/tdd/SKILL.md) enforces red-green-refactor, and [`/diagnosing-bugs`](./skills/engineering/diagnosing-bugs/SKILL.md) wraps debugging in a disciplined, gated loop.
4. **We built a ball of mud.** Agents speed up coding, so they also speed up entropy. The fix is to care about code design every day, in favour of deep modules (a lot of functionality behind a simple interface). [`/to-spec`](./skills/engineering/to-spec/SKILL.md) asks which modules a change touches before writing the spec, and [`/improve-codebase-architecture`](./skills/engineering/improve-codebase-architecture/SKILL.md) surveys a codebase for deepening opportunities. It is a survey, not a rescue: it won't untangle an old codebase by itself.

## Reference

### Engineering

Skills I use daily for code work.

**User-invoked**

- **[ask-matt](./skills/engineering/ask-matt/SKILL.md)**: Ask which skill or flow fits your situation. A router over the user-invoked skills in this repo.
- **[grill-with-docs](./skills/engineering/grill-with-docs/SKILL.md)**: Grilling session that also builds your project's domain model, sharpening terminology and updating `GLOSSARY.md` and ADRs inline.
- **[triage](./skills/engineering/triage/SKILL.md)**: Move issues through a state machine of triage roles.
- **[improve-codebase-architecture](./skills/engineering/improve-codebase-architecture/SKILL.md)**: Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick.
- **[setup-matt-pocock-skills](./skills/engineering/setup-matt-pocock-skills/SKILL.md)**: Configure this repo for the engineering skills (issue tracker, triage labels, domain doc layout). Run once per repo before using the other engineering skills.
- **[to-spec](./skills/engineering/to-spec/SKILL.md)**: Turn the current conversation into a spec and publish it to the issue tracker. No interview, just synthesizes what you've already discussed.
- **[to-tickets](./skills/engineering/to-tickets/SKILL.md)**: Break any plan, spec, or conversation into a set of tracer-bullet tickets, each declaring its blocking edges, written as text in a local file, or as native blocking links on a real tracker.
- **[implement](./skills/engineering/implement/SKILL.md)**: Build the work described by a spec or set of tickets, driving `/tdd` at pre-agreed seams and closing out with `/code-review` before committing.
- **[implement-spec](./skills/engineering/implement-spec/SKILL.md)**: Implement a whole spec on one integration branch. Works the tickets as a task graph, running implementer subagents across the ready frontier for maximum concurrency, then closes out with `/code-review`.
- **[wayfinder](./skills/engineering/wayfinder/SKILL.md)**: Plan a huge chunk of work, more than one agent session can hold, as a shared map of decision tickets on the issue tracker, and resolve them one at a time until the way to the destination is clear.
- **[retro](./skills/engineering/retro/SKILL.md)**: Suggest improvements to the coding agent's environment (navigation, automated checks, coding standards, steering files, tooling) after a session, most severe first.

**Model-invoked**

- **[prototype](./skills/engineering/prototype/SKILL.md)**: Build a throwaway prototype to answer a design question, either a single shareable HTML file for state/logic questions, or several radically different UI variations toggleable from one route.
- **[diagnosing-bugs](./skills/engineering/diagnosing-bugs/SKILL.md)**: Disciplined diagnosis loop for hard bugs and performance regressions: build a feedback loop that goes red on this bug → minimise → hypothesise → instrument → fix → regression-test.
- **[research](./skills/engineering/research/SKILL.md)**: Investigate a question against high-trust primary sources and capture the findings as a cited Markdown file in the repo, run as a background agent.
- **[tdd](./skills/engineering/tdd/SKILL.md)**: Test-driven development with a red-green-refactor loop. Builds features or fixes bugs one vertical slice at a time.
- **[domain-modeling](./skills/engineering/domain-modeling/SKILL.md)**: Actively build and sharpen a project's domain model: challenge terms against the glossary, stress-test with edge-case scenarios, and update `GLOSSARY.md` and ADRs inline.
- **[codebase-design](./skills/engineering/codebase-design/SKILL.md)**: Shared discipline and vocabulary for designing deep modules: a lot of behaviour behind a small interface, placed at a clean seam, testable through that interface.
- **[code-review](./skills/engineering/code-review/SKILL.md)**: Two-axis review of the diff since a fixed point: **Standards** (does it follow the repo's coding standards, plus a Fowler smell baseline?) and **Spec** (does it faithfully implement the originating issue/spec?), run as parallel sub-agents so neither pollutes the other.
- **[pr](./skills/engineering/pr/SKILL.md)**: The shape a pull request body should take: a summary as the smallest visual that makes the change clear, before/after evidence that it works, and a merge-danger call (one-way or two-way door, plus blast radius).
- **[wizard](./skills/engineering/wizard/SKILL.md)**: Generate an interactive bash wizard that walks a human through steps only they can perform: provisioning infrastructure, setting up credentials or CI secrets, walking an unfamiliar third-party dashboard, or running a one-off migration or cutover.

### Productivity

General workflow tools, not code-specific.

**User-invoked**

- **[grill-me](./skills/productivity/grill-me/SKILL.md)**: Get relentlessly interviewed about a plan or design until every branch of the design tree is resolved.
- **[handoff](./skills/productivity/handoff/SKILL.md)**: Compact the current conversation into a handoff document so another agent can continue the work.
- **[teach](./skills/productivity/teach/SKILL.md)**: Teach the user a new skill or concept over multiple sessions, using the current directory as a stateful teaching workspace.
- **[to-questionnaire](./skills/productivity/to-questionnaire/SKILL.md)**: Turn a decision you can't answer alone into a Markdown questionnaire for the one person who can, filled in async, or together over a meeting. It grills you about the send (who it's for, what you need back), not the subject.
- **[wait-what](./skills/productivity/wait-what/SKILL.md)**: Fire this the moment a message doesn't land. The agent re-pitches it with the context you're missing, in plain English, using your `GLOSSARY.md` vocabulary.

**Model-invoked**

- **[grilling](./skills/productivity/grilling/SKILL.md)**: Interview the user relentlessly about a plan, decision, or idea until every branch of the design tree is resolved. The reusable interview primitive behind `grill-me`, `grill-with-docs`, `triage`, `wayfinder` and `improve-codebase-architecture`.
- **[writing-for-agents](./skills/productivity/writing-for-agents/SKILL.md)**: Writing documents for agents: skills, AGENTS.md/CLAUDE.md, and any doc an agent reaches by a pointer.

### Non-Matt

My own skills. Upstream sync ignores them.

- **[are-you-sure](./skills/non-matt/are-you-sure/SKILL.md)**: Challenge a proposed software-engineering or technical-project solution before adopting it. User-invoked.
- **[ste](./skills/non-matt/ste/SKILL.md)**: Report results by the ASD-STE100 (Simplified Technical English) principles, in Chinese. Stays active until stopped.
- **[refine](./skills/non-matt/refine/SKILL.md)**: Review a diff, commit, or named area for quality, performance, and reuse, then apply targeted behavior-preserving cleanup.
- **[reclaim-code-entropy](./skills/non-matt/reclaim-code-entropy/SKILL.md)**: Find, rank, and safely remove accidental codebase complexity, with evidence of real consumers before any deletion.

## Upstream

The `upstream` remote points at Matt's repo. Updates are read and absorbed by hand or by a project skill, not merged or cherry-picked. Only `engineering/` and `productivity/` track upstream.

## License

MIT, see [LICENSE](./LICENSE). The original copyright is Matt Pocock's.
