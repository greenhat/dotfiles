# Available tools

Github CLI `gh` is available to view issues, read PRs and PR code diffs, etc.
Use faster ripgrep `rg` instead of slow `grep`.

# Coding best practices

## Implementation

Please write a high quality, general purpose solution. If the task is
unreasonable or infeasible, or if any of the tests are incorrect, please tell
me. Do not hard code any test cases. Please tell me if the problem is
unreasonable instead of hard coding test cases!

## Testing. 

IMPORTANT: After finishing the implementation (code changes) always build and
test the workspace with `cargo make test` and fix the compilation errors. 
Use `MIDENC_TRACE=trace` env var to set logging level.

After you are finished run and fix clippy warnings with `cargo make clippy` and format the
codebase with `cargo make format-rust`.

## Documentation

Always document functions and types.

## Miden VM assembly (MASM)

Before reading or writing any Miden VM assembly (MASM) code load the instruction reference from https://raw.githubusercontent.com/0xMiden/miden-vm/refs/heads/next/docs/src/user_docs/assembly/instruction_reference.md
