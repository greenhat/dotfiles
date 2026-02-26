Do a code review for the PR I'm about to submit. 

Read the code changes in the current branch (ignore `.wat`,`.hir`, `.masm`, `.lock` files). Run `git parent-branch` to print the name of the parent branch. The changes might not yet be committed.

Now, review these code changes based on the following criteria:
- Look at the big picture (system design, architecture). Do you see a better way to implement this?
- Correctness: Are there potential bugs, logical errors, or edge cases missed? For a code change, also find and analyze the full code of the function/class.
- Suggestions: Do you have any suggestions on how to improve the code?

Provide detailed feedback, referencing the task context and specific code lines from the diff. Only include what you suggest to change/fix, skip the positive feedback where everything is fine. 
Use numbered list and write it to a file `review.md` (append if there is one).
