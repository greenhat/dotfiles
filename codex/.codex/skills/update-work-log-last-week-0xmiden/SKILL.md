---
name: update-work-log-last-week-0xmiden
description: Use when asked to update `/Users/green/Documents/miden/work_log.md` from the last 7 full UTC days of GitHub activity in the `0xMiden` org for `greenhat`, grouped into landed PRs, opened PRs, and opened issues, plus a `This week:` section from `Next` items in `0xMiden` project 7.
---

# Update 0xMiden Work Log

Use this skill when the user wants last week's `0xMiden` GitHub activity appended to `/Users/green/Documents/miden/work_log.md`, plus a `This week:` section generated from the open PRs/issues in `0xMiden` project `7` that currently have status `Next`.

## Workflow

1. Read the last roughly 200 lines of `/Users/green/Documents/miden/work_log.md` to match the existing formatting, spacing, bullet style, and link style.
2. Define "last week" as the last 7 full UTC days using the half-open range `[from, to)`:
   - `to`: today at `00:00:00Z`
   - `from`: 7 days before `to` at `00:00:00Z`
   Use exact `YYYY-MM-DD` dates for the GitHub search qualifiers.
3. Collect authored activity in `org:0xMiden` with `gh api search/issues`, paginating as needed. Ignore comments, reviews, and other noise.
   - Prefer explicit query-string routes like `gh api 'search/issues?q=...'`; this is more reliable than `gh api search/issues -f q=...` in this environment.
   - Landed PRs: `org:0xMiden is:pr author:greenhat merged:FROM..TO sort:merged-asc`
   - Opened PRs: `org:0xMiden is:pr author:greenhat created:FROM..TO sort:created-asc`
   - Opened issues: `org:0xMiden is:issue author:greenhat created:FROM..TO sort:created-asc`
4. Exclude any PR from "Opened PRs" if it already appears in "Landed PRs".
5. Collect `This week:` items from `https://github.com/orgs/0xMiden/projects/7/views/1`.
   - The intent is to include open PRs and issues whose project status is `Next`. Do not intersect this list with the last-week authored activity; the project is the source of truth for `This week:`.
   - Use `gh project item-list 7 --owner 0xMiden --query 'status:Next is:open' --format json` as the primary retrieval path.
   - `gh project` requires a token with the `read:project` scope. If access fails with a missing-scope error, refresh auth with `gh auth refresh -s read:project`.
   - Keep only items backed by GitHub issues or pull requests. Exclude draft items, notes, and any closed content that slips through the query.
   - Preserve the project order when available, since it carries planning priority.
6. Append a new section to the end of `work_log.md` in this shape while preserving the surrounding spacing conventions:

```md
Last week:
Landed PRs:
- <title> [#<number>](<url>)

Opened PRs:
- <title> [#<number>](<url>)

Opened issues:
- <title> [#<number>](<url>)

This week:
- <title> [#<number>](<url>)
```

## Output Rules

- Keep the group headers even when a group is empty.
- Do not include commented-on items, review activity, or commit-only summaries.
- Keep the `This week:` header even when there are no matching `Next` items.
- `This week:` should contain only open PR/issue items from project `7` with status `Next`; it may include items opened before the last-week window.
- Match the file's existing markdown style instead of introducing a new format.
