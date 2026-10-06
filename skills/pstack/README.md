# pstack integration

This directory vendors the standalone Agent Skills from [backnotprop/pstack](https://github.com/backnotprop/pstack), a mirror of Cursor's pstack that works across agent harnesses.

## Use through bainary-skill

pstack is optional and disabled by default:

```bash
bainary-skill learn
bainary-skill mode pstack
```

When enabled, use `skills/pstack/poteto-mode/SKILL.md` as the entry point for rigorous non-trivial work. It selects the appropriate pstack playbook and principles. Turn it off with:

```bash
bainary-skill mode normal
```

Bainary's project-learning, security, validation, and data-loss rules remain active. Do not use pstack mode for simple tasks unless its rigor is actually useful.

## Provenance

- Upstream: https://github.com/backnotprop/pstack
- Imported as plain skill files; no runtime dependency or external installer is required.
- Upstream license: `LICENSE`
