# Coding best practices

## Core Principles

- Find root causes. No temporary fixes. 
- Elegance: Changes must be concise and maintainable, while minimizing impact on the codebase.
- Minimal Impact: Changes should only touch what's necessary. 

## Testing. 

IMPORTANT: After finishing the implementation (code changes) always build and
test the workspace with `cargo make test` and fix the errors. 

Use `UPDATE_EXPECT=1` env var when running the tests to update .wat, .hir, .masm expected files in tests.

After you are finished run and fix clippy warnings with `cargo make clippy` and format the
codebase with `cargo make format-rust`.

## Documentation

Always document modules, functions and types. 
Don't explain the implementation.
Add code comments to tricky parts of the code.

# git commit rules

Never commit `review.md` file. 
