# Coding best practices

## Testing. 

IMPORTANT: After finishing the implementation (code changes) always build and
test the workspace with `cargo make test` and fix the compilation errors. 

Set `RUST_MIN_STACK = 16777216` env var if there is a stack overflow error in the VM.

Use `MIDENC_TRACE=trace` env var to set logging level (enable only when running individual test, it's too slow) to debug issues in the compilation pipeline.

Use `UPDATE_EXPECT=1` env var when running the tests to update .wat, .hir, .masm expected files in tests.

After you are finished run and fix clippy warnings with `cargo make clippy` and format the
codebase with `cargo make format-rust`.

## Documentation

Always document functions and types. Don't explain the implementation.
Add code comments to tricky parts of the code.

# Available tools

Github CLI `gh` is available to view issues, read PRs and PR code diffs, etc.
Use faster ripgrep `rg` instead of slow `grep`.

# git commit rules

Never commit `review.md` file. 
Before each commit run and fix clippy warnings with `cargo make clippy` and format the
codebase with `cargo make format-rust`.
