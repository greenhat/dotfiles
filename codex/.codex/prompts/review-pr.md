Do a code review for the PR I'm about to submit. 

Read the code changes in the current branch (ignore `.wat`,`.hir`, `.masm`, `.lock` files). Run `git parent-branch` to print the name of the parent branch.

Now, review these code changes based on the following criteria:
- Correctness: Are there potential bugs, logical errors, or edge cases missed? For a code change, also find and analyze the full code of the function/class.
- Style: Does the code changes adhere to the style this crate is written in? Error handling in particular.
- Readability: How easily comprehensible is the resulted code? Any need for splitting the functions to make them more comprehensible? 
- Maintainability: Do you see any ways to improve the maintainability of the new/changed code?
- Documentation: Modules, functions, types and structs should be documented. Need to add code comments to tricky, non-obvious parts of the code?
- Naming: Are new names descriptive and unambiguous? 
- Clean up: Any `dbg!` (including commented out) in the new code besides tests? Any commented out code that looks like it was forgotten and should be removed?
- Any `TODO:` left in the new code?
- Suggestions: Do you have any suggestions on how to improve the code?

Provide detailed feedback, referencing the task context and specific code lines from the diff. Only include what you suggest to change/fix, skip the positive feedback where everything is fine. 
Use numbered list.
