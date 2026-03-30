---
name: write-pr-desc
description: Use when asked to draft a PR description for the current branch before submission. Compares the work against `git parent-branch`, ignores generated `.wat`, `.hir`, `.masm`, and `.lock` files, and writes a brief high-level summary to `pr_desc.md`.
---

# Write PR Description

Use this skill when the user wants a concise PR description for the current branch.

## Workflow

1. Run `git parent-branch` to identify the base branch.
2. Inspect the current branch diff against that base, including uncommitted changes. Ignore `*.wat`, `*.hir`, `*.masm`, and `*.lock`.
3. Summarize the change at a high level for reviewers. Prefer the main behavioral or maintenance-relevant changes over file-by-file churn.
4. Keep the description brief. Use a short paragraph by default and switch to flat bullets only when the change has a few distinct themes.
5. Write the result to `pr_desc.md`, replacing any stale draft content.
