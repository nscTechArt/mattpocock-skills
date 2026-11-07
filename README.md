# Skills

[English](./README-en.md) | 中文

这是 [mattpocock/skills](https://github.com/mattpocock/skills) 的 fork：按自己的工作方式修改 Matt 的 skill，并加入另外维护的 skill。仅供个人使用，不发布版本，不做插件。

## 安装

把仓库地址交给 Agent，让它自行安装。例如对 Claude Code 说：

> 把 https://github.com/nscTechArt/mattpocock-skills 里的 skill 安装到 `~/.claude/skills`。

可以在提示里补充这些信息，让结果更确定：

- **安装位置**：默认装到全局目录（Claude Code 是 `~/.claude/skills`）。其他 Agent 请换成对应的全局目录。
- **安装方式**：默认复制。仓库更新后，让 Agent 重新安装一次即可。
- **安装范围**：全部，或只装指定的 skill。

仓库里每个含 `SKILL.md` 的目录就是一个 skill。`engineering/`、`productivity/`、`non-matt/` 只是分组，安装时去掉这一层，每个 skill 单独放在安装位置的第一层。

## 目录结构

- `skills/engineering/`：Matt 的 skill，用于代码工作。
- `skills/productivity/`：Matt 的 skill，用于非代码的日常工作流。
- `skills/non-matt/`：个人维护的 skill，不来自 Matt 的仓库。

所有 skill 见下方的[Skill 列表](#skill-列表)。

skill 按调用方式分为两类：

- **手动调用**：只有用户亲自输入名称（例如 `/grill-me`）才会触发，负责编排流程。
- **可自动调用**：用户可以调用，Agent 也可以在任务合适时自行调用，承载可复用的做事规范。

手动调用的 skill 可以调用可自动调用的 skill，但不能调用另一个手动调用的 skill。

## Skill 列表

### 工程类（engineering）

用于代码工作的 skill。

**手动调用**

- **[ask-matt](./skills/engineering/ask-matt/SKILL.md)**：不确定该用哪个 skill 或流程时，先问它，它会根据你的情况指出本仓库中合适的手动调用 skill。
- **[grill-with-docs](./skills/engineering/grill-with-docs/SKILL.md)**：反复追问，同时构建项目的领域模型：厘清术语，并随时更新 `GLOSSARY.md` 和 ADR。
- **[triage](./skills/engineering/triage/SKILL.md)**：按一套分诊状态推进 issue。
- **[improve-codebase-architecture](./skills/engineering/improve-codebase-architecture/SKILL.md)**：扫描代码库中适合深化的模块，以可视化 HTML 报告呈现，再针对选中的一项逐步追问。
- **[setup-matt-pocock-skills](./skills/engineering/setup-matt-pocock-skills/SKILL.md)**：为仓库配置工程类 skill（issue tracker、分诊标签、领域文档布局）。每个仓库在使用其他工程类 skill 之前运行一次。
- **[to-spec](./skills/engineering/to-spec/SKILL.md)**：把当前对话整理成 spec 并发布到 issue tracker。不再提问，只综合已经讨论过的内容。
- **[to-tickets](./skills/engineering/to-tickets/SKILL.md)**：把计划、spec 或对话拆成一组可以端到端交付的最小 ticket，每个 ticket 声明自己的阻塞关系。阻塞关系可以写成本地文件里的文字，也可以用 tracker 原生的阻塞链接。
- **[implement](./skills/engineering/implement/SKILL.md)**：实现 spec 或一组 ticket 所描述的工作：在事先约定的测试接缝上用 `/tdd` 推进，提交前用 `/code-review` 收尾。
- **[wayfinder](./skills/engineering/wayfinder/SKILL.md)**：规划一个单次 Agent 会话容纳不下的大型工作：在 issue tracker 上建立一张共享的决策 ticket 地图，逐个解决，直到通往目标的路径清晰。
- **[retro](./skills/engineering/retro/SKILL.md)**：会话结束后，针对编码 Agent 的工作环境（导航、自动检查、编码规范、指令文件、工具）提出改进建议，按严重程度从高到低排列。

**可自动调用**

- **[prototype](./skills/engineering/prototype/SKILL.md)**：做一个一次性原型来回答设计问题：状态或逻辑问题用单个可分享的 HTML 文件，界面问题用多个差异很大的方案，在同一路由下切换。
- **[diagnosing-bugs](./skills/engineering/diagnosing-bugs/SKILL.md)**：诊断难查的缺陷和性能退化，流程有纪律、分关卡：先建立一个能稳定复现该缺陷的反馈回路，再依次最小化、提假设、加埋点、修复、补回归测试。
- **[research](./skills/engineering/research/SKILL.md)**：对照高可信度的一手来源调查一个问题，把结论写成仓库里带引用的 Markdown 文件，由后台 Agent 执行。
- **[tdd](./skills/engineering/tdd/SKILL.md)**：测试驱动开发，按红、绿、重构的循环，每次完成一个垂直切片，用来开发功能或修复缺陷。
- **[domain-modeling](./skills/engineering/domain-modeling/SKILL.md)**：主动构建并打磨项目的领域模型：对照术语表质疑用词，用边界场景做压力测试，并随时更新 `GLOSSARY.md` 和 ADR。
- **[codebase-design](./skills/engineering/codebase-design/SKILL.md)**：设计深模块的共用规范和术语：小接口背后有大量行为，放在干净的接缝上，并能通过该接口测试。
- **[code-review](./skills/engineering/code-review/SKILL.md)**：评审某个固定点以来的 diff，分两个维度：**规范**（是否遵循仓库的编码规范，外加 Fowler 的代码坏味道清单）和 **Spec**（是否忠实实现了最初的 issue 或 spec）。两个维度由并行的子 Agent 各自完成，互不干扰。

### 效率类（productivity）

通用的工作流工具，不限于代码。

**手动调用**

- **[grill-me](./skills/productivity/grill-me/SKILL.md)**：就某个计划或设计被反复追问，直到设计树的每个分支都有结论。
- **[handoff](./skills/productivity/handoff/SKILL.md)**：把当前对话压缩成交接文档，让另一个 Agent 接着做。
- **[teach](./skills/productivity/teach/SKILL.md)**：分多次会话，向用户讲授一项新技能或新概念，并把当前目录作为保存进度的教学工作区。
- **[wait-what](./skills/productivity/wait-what/SKILL.md)**：没看懂某条消息时立刻使用。Agent 会补充你缺少的背景，用通俗的语言和你的 `GLOSSARY.md` 术语重新讲一遍。

**可自动调用**

- **[grilling](./skills/productivity/grilling/SKILL.md)**：就某个计划、决策或想法反复追问用户，直到设计树的每个分支都有结论。它是 `grill-me`、`grill-with-docs`、`triage`、`wayfinder` 和 `improve-codebase-architecture` 共用的追问方法。
- **[writing-for-agents](./skills/productivity/writing-for-agents/SKILL.md)**：写给 Agent 看的文档：skill、AGENTS.md、CLAUDE.md，以及 Agent 通过指引才会读到的其他文档。

### 个人类（non-matt）

个人维护的 skill，不来自 Matt 的仓库。上游同步会忽略它们。

- **[are-you-sure](./skills/non-matt/are-you-sure/SKILL.md)**：采纳软件工程或技术项目的方案之前，先对它提出质疑。手动调用。
- **[ste](./skills/non-matt/ste/SKILL.md)**：按 ASD-STE100（简化技术英语）的原则，用中文汇报结果。启用后持续生效，直到用户停止。
- **[refine](./skills/non-matt/refine/SKILL.md)**：从质量、性能和复用三个角度评审 diff、提交或指定区域，然后做有针对性的、不改变行为的清理。
- **[reclaim-code-entropy](./skills/non-matt/reclaim-code-entropy/SKILL.md)**：找出、排序并安全移除无意中产生的代码复杂度。删除前必须有证据证明确实没有使用者。

## 上游

`upstream` 远程指向 Matt 的仓库。更新由人工或某个项目 skill 阅读并吸收，不做 merge 或 cherry-pick。只有 `engineering/` 和 `productivity/` 跟踪上游。

## 许可证

MIT，见 [LICENSE](./LICENSE)。原始版权归 Matt Pocock 所有。
