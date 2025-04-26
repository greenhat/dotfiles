First, read the task description from the file `task.md` in the current
directory. Understand the goal described in that task. 
Next, Read the code changes in the current branch (ignore `.wat`,`.hir`,
`.masm`, `.lock` files). Run `git parent-branch` to print the
name of the parent branch.
Now, review these code changes based on the following criteria:
1. Task Fulfillment: Do the changes correctly and completely address the
   requirements described in `task.md`?
2. Correctness: Are there potential bugs, logical errors, or edge cases missed?
3. Style: Does the code changes adhere to the style this crate is written in? Error
   handling in particular.
4. Readability: How easily comprehensible is the resulted code? Any need for splitting
   the functions to make them more comprehensible? 
5. Documentation: Modules, functions, types and structs should be documented.
   If the code is doing a non-obvious thing, it should be explained in the
comment. There should be no comments in the code explaining obvious things.
6. Naming: Are new names descriptive and unambiguous? 

Provide detailed feedback, referencing the task context and specific code lines
from the diff. Only include what you suggest to change/fix, skip the positive feedback
where everything is fine. Your review will be passed as the feedback to the
coding AI agent that made the code changes. Save it in the file `review.md`.
