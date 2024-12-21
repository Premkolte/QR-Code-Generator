#!/bin/bash

# Define base branch
BASE_BRANCH="main"

# Loop to create additional branches, commits, and pull requests (e.g., PRs 51-100)
for i in {51..100}; do
  # Create a new branch
  BRANCH_NAME="feature-branch-$i"
  git checkout -b $BRANCH_NAME $BASE_BRANCH

  # Make a dummy change (e.g., create a file)
  echo "This is branch $BRANCH_NAME" > file-$i.txt
  git add file-$i.txt

  # Commit the changes
  git commit -m "Add file for $BRANCH_NAME"

  # Push the branch
  git push origin $BRANCH_NAME

  # Create a pull request
  gh pr create --title "PR #$i: Add file for $BRANCH_NAME" \
               --body "This pull request adds file-$i.txt to the repository." \
               --base $BASE_BRANCH \
               --head $BRANCH_NAME
done

# Return to the base branch
git checkout $BASE_BRANCH