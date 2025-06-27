Do a code review for the PR I'm about to submit. Think very hard.

Read the code changes in the current branch (ignore `.wat`,`.hir`,
`.masm`, `.lock` files). Run `git parent-branch` to print the
name of the parent branch.

Now, review these code changes based on the following criteria:
- Correctness: Are there potential bugs, logical errors, or edge cases missed?
- Style: Does the code changes adhere to the style this crate is written in? Error
   handling in particular.
- Readability: How easily comprehensible is the resulted code? Any need for splitting
   the functions to make them more comprehensible? 
- Documentation: Modules, functions, types and structs should be documented.
   If the code is doing a non-obvious thing, it should be explained in the
comment. There should be no comments in the code explaining obvious things.
- Naming: Are new names descriptive and unambiguous? 
- Clean up: Any `dbg!` (including commented out) in the new code besides tests? 
Any commented out code that looks like it was forgotten and should be removed?
- Any `TODO:` left in the new code?
- Suggestions: Do you have any suggestions on how to improve the code?

Provide detailed feedback, referencing the task context and specific code lines
from the diff. Only include what you suggest to change/fix, skip the positive feedback
where everything is fine. 
Think very hard.
