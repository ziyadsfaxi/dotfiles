#!/bin/bash
# Usage: gwd [branch-name]
# If no branch is provided, it tries to use the current tmux session name.

BRANCH=${1:-$(tmux display-message -p '#S')}
REPO_NAME=$(basename $(git rev-parse --show-toplevel 2>/dev/null || echo "unknown"))
# Reverse the cleaning logic to find the directory
CLEAN_BRANCH=${BRANCH//\//-}
TARGET_DIR="../${REPO_NAME}-worktrees/${CLEAN_BRANCH}"

echo "Preparing to destruct worktree and session for: $BRANCH"

# 1. Safety Check: Check for uncommitted changes
if [ -d "$TARGET_DIR" ]; then
	cd "$TARGET_DIR" || exit
	if [[ -n $(git status --porcelain) ]]; then
		echo "ABORTING: You have uncommitted changes in $TARGET_DIR."
		echo "Please commit or stash them before deleting."
		exit 1
	fi
	cd - >/dev/null
fi

# 2. Remove the Git Worktree
if git worktree list | grep -q "$TARGET_DIR"; then
	echo "Removing worktree..."
	git worktree remove "$TARGET_DIR"
fi

# 3. Kill the Tmux Session
if tmux has-session -t "$BRANCH" 2>/dev/null; then
	echo "Killing tmux session..."
	tmux kill-session -t "$BRANCH"
fi

# 4. Delete the Branch (Optional - remove the '#' below if you want this)
# git branch -d "$BRANCH"

echo "Cleanup complete."
