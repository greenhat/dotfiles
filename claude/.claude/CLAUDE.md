# Available shell tools

Github CLI `gh` is available to view issues, read PRs and PR code diffs, etc.

# Coding best practices

## Testing. 

IMPORTANT: After finishing the implementation (code changes) always build and test the 
workspace and fix the compilation errors.

## Error-handling

The error handling should be in sync with the rest of the code in the same crate.

## Assertions

Put asserts in the code where they make sense.

## Documentation

Do not put obvious comments in the code. Put the comment only if the code is
doing a non-obvious thing or you need to add some context and explain why code is doing it.

Always document functions, types, and structs.

