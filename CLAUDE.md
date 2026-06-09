# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 架构原则

- DRY（不要重复自己）— 通过抽取共享工具和模块，消除重复逻辑。
- 关注点分离 — 每个模块应只负责一个独立的职责。
- 单一职责原则（SRP）— 每个类/模块/函数/文件应当只有一个变更的理由。
- 清晰的抽象与契约 — 通过小而稳定的接口暴露意图，隐藏实现细节。
- 低耦合、高内聚 — 让模块保持自包含，最小化跨模块依赖。
- 可扩展性与无状态 — 将组件设计为可水平扩展，优先采用无状态服务。
- 可观测性与可测试性 — 内建日志、指标、链路追踪，并确保组件可进行单元/集成测试。
- KISS（保持简单）— 让解决方案尽可能简单。
- YAGNI（你不会需要它）— 避免投机性的复杂度或过度设计。
- **TDD（测试驱动开发）** — 先写测试；只有测试通过，实现代码才算完成。

## 测试
- 运行测试：如果 `run_tests` 工具可用则使用它，否则使用 `flutter test`。
- 单元测试：使用 `package:test` 进行单元测试。
- Widget 测试：使用 `package:flutter_test` 进行 Widget 测试。
- 集成测试：使用 `package:integration_test` 进行集成测试。
- 断言：优先使用 `package:checks` 进行更具表达力和可读性的断言，而非默认的 `matchers`。