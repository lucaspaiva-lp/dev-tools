
# Semantic Versioning (SemVer) Guide

Semantic Versioning (SemVer) defines a standardized way to number versions of software to communicate changes and stability.

### MAJOR.MINOR.PATCH

- **MAJOR** → Breaking changes or incompatible API changes  
- **MINOR** → New features, backwards-compatible  
- **PATCH** → Bug fixes, small changes, backwards-compatible  

### Pre-1.0 Versions

For v0.x.y (before 1.0.0), the API is considered experimental. Each MINOR version bump (v0.1.0 → v0.2.0) can include new features, even if they are breaking internally. PATCH versions (v0.1.1 → v0.1.2) are for small fixes. Jumping straight from v0.x to v1.0.0 signals that the API is stable and ready for public use.

**Pre-release labels indicate development stage and stability:**

- Each **MINOR** version bump (v0.1.0 → v0.2.0) can include new features, **even if they are breaking internally**.  
- **PATCH** versions (v0.1.1 → v0.1.2) are for small fixes.  
- Jumping straight from v0.x to **v1.0.0** signals that the API is **stable and ready for public use**.  


**Pre-release Stages:**

| Stage | Meaning | Usage Example |
|-------|---------|---------------|
| **Alpha** | Very early version, mostly for internal testing. May have incomplete features and breaking changes. | v0.1.0-alpha.1 |
| **Beta** | Features mostly implemented, API is more stable, but bugs may exist. Suitable for limited external testing. | v0.1.0-beta.1 |
| **RC (Release Candidate)** | Version is almost final. Intended for final testing before stable release. Minimal or no breaking changes expected. | v0.1.0-rc.1 |

**Key Points for v0.x.y:**

- **MINOR** → Add significant new features, even breaking internally.  
- **PATCH** → Fix bugs or small issues without changing behavior.  
- **Pre-release labels** → Signal stability and intended audience (internal, external, almost stable).  
- No strict rule to skip versions—keep versioning meaningful and clear.  

**Examples for API_Web Project:**

| Version | Description |
|---------|-------------|
| v0.1.0-alpha.1 | First prototype, experimental, internal testing |
| v0.1.0-beta.1  | Core endpoints implemented, limited external testing |
| v0.1.0-rc.1    | Almost stable, ready for wider pre-release testing |
| v0.1.0         | Initial pre-release functional version |
| v0.2.0         | Added new features, tests passing, still experimental |
| v0.3.0         | Improvements, bug fixes, interface changes |
| v1.0.0         | Stable release, minimal breaking changes expected |

**Notes on Pre-releases:**

- Pre-release versions can be labeled with **alpha**, **beta**, or **rc** to indicate stability and intended audience.  
- Alpha: very early, mostly internal.  
- Beta: mostly complete, limited external testing.  
- RC: almost stable, final testing before 1.0.0.  
- For **v0.x.y**, MINOR increments can include breaking internal changes; PATCH increments are for bug fixes only.  
- Jumping straight to **v1.0.0** signals readiness for stable public use.  

This guide ensures clear versioning for API_Web, communicates stability expectations, and aligns with Semantic Versioning (SemVer) principles.
