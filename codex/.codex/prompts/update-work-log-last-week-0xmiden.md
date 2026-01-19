Update my work log with last week’s GitHub activity in the `0xMiden` org (I’m `https://github.com/greenhat`).

Target file: `/Users/green/Documents/miden/work_log.md`

Steps:
1) Read the last ~200 lines of `work_log.md` to match the existing formatting (spacing between sections, bullet style, link style).
2) Define “last week” as the last 7 full days in UTC, using a half-open range `[from, to)`:
   - `to`: today at `00:00:00Z`
   - `from`: 7 days before `to` at `00:00:00Z`
   Use these as `YYYY-MM-DD` dates for GitHub search qualifiers.
3) Collect activity in `org:0xMiden` authored by `greenhat`, ignoring comments/reviews/other noise. Only include:
   - Landed PRs: PRs merged in the date range
   - Opened PRs: PRs created in the date range
   - Opened issues: issues created in the date range

   Use GitHub search (via `gh api search/issues`) and paginate if needed:
   - Landed PRs query: `org:0xMiden is:pr author:greenhat merged:FROM..TO sort:merged-asc`
   - Opened PRs query: `org:0xMiden is:pr author:greenhat created:FROM..TO sort:created-asc`
   - Opened issues query: `org:0xMiden is:issue author:greenhat created:FROM..TO sort:created-asc`

4) Append a new section to the end of `work_log.md` exactly in this shape (and matching the existing spacing conventions):

Last week:
Landed PRs:
- <title> [#<number>](<url>)

Opened PRs:
- <title> [#<number>](<url>)

Opened issues:
- <title> [#<number>](<url>)

Notes:
- Do not include “commented on”, reviews, commits summaries, or anything not in the three groups above.
- If a group is empty, keep the header and omit bullets under it (don’t invent anything).
