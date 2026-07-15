### 1. Product Scope & Mission

- Deliver a PC-first rhythm-action game where jump rope becomes a mastery sport built on timing precision, expressive movement, and reactive environments.
- Preserve the player promise: immediate control feel, deep mastery, personal style expression, and uplifting progression from neighborhood courts to world-stage showcases.
- Focus discovery on ideas that strengthen the core loop: choose challenge, perform routine, score via timing/tricks/transitions, earn progression, and replay with refined strategy.

### 2. Target Users

- Rhythm-action newcomers who need fast onboarding and encouragement rather than punishment (inferred).
- Mastery-driven players who optimize timing, combos, and routing for leaderboard performance (inferred).
- Creative expression players who value style identity, routine creation, and performance spectacle (inferred).
- Small-group co-op players seeking synchronized two-player routines with fair, credible outcomes (inferred).

### 3. In Scope / Out of Scope

**In Scope**
- Solo and co-op gameplay ideas across Story Tour, Freestyle Studio, Time Trials, Co-op Sync, and Rival Arena.
- Ideas that improve timing feel, combo/trick expression, progression clarity, and replayability.
- Features compatible with platform-linked identity at MVP plus guest fallback.
- Features compatible with server-authoritative scoring/progression and season-scoped leaderboard trust tiers.

**Out of Scope**
- Primary multiplayer models based on listen-server or pure P2P.
- Client-authoritative competitive scoring/progression models.
- Mandatory first-party account creation at MVP.
- Early microservice/service-split architecture as a default for v1.
- Ideas that require bypassing protected-main PR gates, required CI checks, or CODEOWNERS review for gameplay-critical changes.
- Features that launch without child-safety/privacy baseline controls for UGC, consent/age handling, and data-rights workflows.

### 4. Technical Constraints

- Engine/runtime: Godot 4.x standard with deterministic fixed-timestep simulation core for gameplay-critical systems.
- Co-op networking: hosted authoritative client-server for canonical shared state; rollback/prediction used for responsiveness with controlled fallback paths.
- State authority: event-sourced, server-authoritative canonical ledger; offline play uses signed local journals/manifests for deferred validation.
- Architecture style: modular monolith for v1 with explicit module boundaries and extraction seams; no assumption of immediate domain service extraction.
- Identity model: platform-linked canonical online identity at MVP; guest allowed but non-portable until linked.
- Governance: trunk-based protected `main`, mandatory PR path, required CI gates, and human approval for gameplay-critical paths.
- Compliance baseline: launch-gating privacy/security controls including minors defaults, UGC moderation/reporting, regional rights handling, retention/deletion operations, and auditable security events.
- Decision governance: agent autonomy is limited to low-blast-radius changes; protected domains require ADR escalation before implementation.

### 5. Priority Problems

- How to keep first-session onboarding friction low while still moving players toward linked identity and portable progression.
- How to maintain competitive trust (fair scoring, anti-cheat posture, replayable evidence) without harming perceived responsiveness in rhythm play.
- How to deliver co-op synchronization quality under real-world latency while avoiding visible desync and preserving shared combo integrity.
- How to scale discovery and delivery velocity without gameplay-regression drift in timing/scoring/progression-critical code paths.
- How to make Freestyle/UGC expression safe and compliant for mixed-age audiences without collapsing creative participation.
- How to preserve architectural simplicity for v1 while preventing boundary erosion that would block later extraction of hotspot domains.

### 6. Strategic Pillars

- **Rhythm Integrity First:** ideas must protect crisp timing judgment, deterministic-feeling simulation outcomes, and trustworthy scoring.
- **Expression With Mastery Depth:** ideas must increase creative routine identity and optimization headroom without sacrificing readability.
- **Trustworthy Competition and Co-op:** ideas must preserve fairness, anti-cheat boundaries, and authoritative consistency for shared/async modes.
- **Accessible Growth Loop:** ideas must strengthen approachable onboarding, visible progression, and repeat-run motivation.

### 7. Success Metrics

<!-- TODO: fill in this section -->

### 8. Signal Sources

<!-- TODO: fill in this section -->

### 9. Definition of a Useful Idea

An idea is worth creating as a pm-idea issue only if it meets all criteria below:

- It clearly improves at least one core player outcome (timing feel, expressive play, progression clarity, co-op sync quality, or rivalry trust) and does not degrade another protected pillar.
- It is implementable within locked constraints (Godot deterministic core, authoritative server/state model, modular-monolith boundaries, MVP identity model, compliance baseline, and CI/governance gates).
- It includes a concrete validation path (prototype/test/telemetry signal) that can falsify the idea quickly (inferred).
- It does not depend on rejected directions (P2P/listen-server primary authority, client-authoritative ranked outcomes, mandatory first-party auth at MVP, early service-split by default).
- It has clear blast-radius and ownership expectations; if it touches protected gameplay/architecture/trust domains, it explicitly requires ADR escalation before implementation.
- It is specific enough to scope and sequence (problem, target mode/surface, expected player impact, constraints) rather than a broad theme statement (inferred).