# DISCOVERY-FOCUS

### 1. Product Scope & Mission

- Build a PC-first rhythm-action game where jump rope becomes a high-expression performance sport, balancing approachable first-touch play with deep mastery.
- Deliver a loop of venue/song/challenge selection, performance execution (timing, stamina, combo flow), scoring, progression, customization, and mastery replay.
- Preserve player trust through fair scoring, credible progression, and synchronized co-op outcomes.
- Support an uplifting growth fantasy from local courts to world-stage showcases.

### 2. Target Users

- **Beginners to rhythm-action games**: want immediate control clarity, encouragement, and low-friction onboarding.
- **Intermediate mastery players**: want visible session-over-session skill growth, better routing, and measurable improvement.
- **Expert optimization/expressive players**: want high skill ceiling, trick grammar depth, and leaderboard-grade precision.
- **Co-op/social competitors**: want synchronized two-player performance, fair authority, and trustworthy async rivalry.

### 3. In Scope / Out of Scope

- **In scope**
  - Solo and co-op gameplay ideas that strengthen timing feel, expression, progression, and reactive environments.
  - Story Tour, Freestyle Studio, Time Trials, Co-op Sync, and Rival Arena-aligned feature ideas.
  - Ideas compatible with modular-monolith v1 architecture and event-sourced authoritative scoring/progression.
  - Safety/privacy-by-default ideas for UGC and age-mixed participation.
- **Out of scope**
  - Ideas that require replacing Godot 4 deterministic simulation core or abandoning rollback/prediction co-op.
  - Ideas that assume client-authoritative scoring/progression or trust-based competitive submissions.
  - Ideas that depend on listen-server/P2P as primary Co-op Sync model.
  - Ideas that require early microservice-first architecture for v1.
  - Ideas that require mandatory first-party account creation at first launch.
  - Ideas that weaken protected branch/CI/CODEOWNERS governance for gameplay-critical changes.
  - Ideas that bypass launch-gating security/privacy/UGC compliance baseline.

### 4. Technical Constraints

- Engine/runtime baseline: Godot 4.x, deterministic fixed-timestep simulation for gameplay-critical systems.
- Co-op networking baseline: hosted authoritative client-server primary; rollback/prediction for responsiveness; authority remains server-side.
- State integrity baseline: event-sourced canonical server ledger for scoring/progression with signed offline journals/manifests and season/version trust-tiered projections.
- Architecture baseline: v1 ships as modular monolith with explicit module boundaries and extraction seams.
- Identity baseline: platform-linked canonical online identity with guest fallback; portability focused on progression/customization/settings and online metadata.
- Governance baseline: trunk-based protected main, mandatory PR + required checks + CODEOWNERS review for gameplay-critical paths.
- Compliance baseline: privacy-by-default for minors/uncertain age, consent/parental workflows where required, UGC moderation/reporting, rights/retention operations, auditable security controls.
- Agent governance baseline: high-blast-radius gameplay/architecture/trust changes require ADR escalation before implementation.

### 5. Priority Problems

- Maintain “instant satisfying control” while preserving strict timing consistency across hardware variance and long sessions.
- Expand expressive depth (tricks, routing, style identity) without overwhelming beginners or degrading readability.
- Make Co-op Sync feel immediate under real-world latency while preserving fairness and shared combo integrity.
- Preserve leaderboard and progression trust across offline play, reconnect uploads, co-op attribution, and seasonal resets.
- Reduce onboarding friction while increasing guest-to-linked conversion and continuity of progression across devices.
- Operationalize UGC safety/privacy compliance (especially minors and regional rights) without killing creative participation.
- Keep delivery velocity high while preventing design drift/regressions in gameplay-critical areas under mixed human+agent contribution.

### 6. Strategic Pillars

- **Crisp Rhythm Integrity**: every idea must strengthen timing clarity, deterministic correctness, and player-perceived responsiveness.
- **Expression With Mastery Curve**: ideas should increase creative play and optimization depth while keeping first-touch approachability.
- **Trustworthy Competition & Progression**: ideas must reinforce fair authority, anti-cheat posture, and credible seasonal/progression outcomes.
- **Safe, Sustainable Delivery**: ideas must fit modular v1 constraints, governance gates, and launch-grade privacy/security operations.

### 7. Success Metrics

- [ ] Timing stability: input judgment variance at or below deterministic target under stressed rendering scenarios.
- [ ] Determinism parity: high replay state-hash parity across reference PC configurations.
- [ ] Co-op sync quality: low hard-desync incidence and fairness delta within multiplayer thresholds.
- [ ] Progression/leaderboard integrity: low fraud-confirmed incidents and high idempotent ingest correctness.
- [ ] Onboarding/identity continuity: guest-to-linked conversion and portable progression success meet target bands.
- [ ] Compliance readiness: critical gate coverage for age defaults, rights workflows, UGC reporting, and audit logging stays at required thresholds.
- [ ] Delivery health: low post-merge red-main and low rework/revert rate on agent-authored changes.

### 8. Signal Sources

- Telemetry dashboards: timing variance, determinism parity, co-op desync/correction, and latency fairness trends.
- Backend integrity logs: event rejection rates, duplicate/idempotency behavior, offline upload completion, fraud/abuse flags.
- CI/engineering ops: mainline failure rate, PR cycle time, flaky-check incidence, revert/rework metrics.
- Identity/support analytics: guest-link conversion funnels, sync/restore reliability, identity-related ticket volume.
- Trust & safety operations: UGC report volumes, moderation SLA adherence, minor-account default enforcement checks.
- Seasonal competition analytics: leaderboard anomaly detection, trust-tier distribution, dispute and correction rates.

### 9. Definition of a Useful Idea

A discovery idea is useful when it satisfies all of the following:

- It solves one of the Priority Problems with a clear player or operational benefit.
- It reinforces at least one Strategic Pillar without violating any Technical Constraints.
- It is implementable within v1 architecture/governance/compliance boundaries (no contradiction with locked ADR decisions).
- It includes a measurable outcome mapped to existing success metrics/signals.
- It does not reduce fairness, authority integrity, safety/privacy posture, or core timing feel.
- It can be scoped as a testable increment (feature flag, mode-limited rollout, or milestone slice) rather than a speculative platform rewrite.