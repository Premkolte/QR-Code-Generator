#!/bin/bash

# Get all open pull request numbers
PR_NUMBERS=$(gh pr list --state open --json number -q ".[].number")

# Loop through each PR and merge
for PR in $PR_NUMBERS; do
  echo "Merging PR #$PR..."
  gh pr merge $PR --merge --admin
done