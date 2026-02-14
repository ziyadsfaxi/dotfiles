#!/bin/bash
# Usage: gwt <branch-name> [base-branch]

BRANCH=$1
BASE_BRANCH=${2:-main} # Defaults to main if not provided
REPO_ROOT=$(git rev-parse --show-toplevel)
REPO_NAME=$(basename $(git rev-parse --show-toplevel))
# Creates a path like ../project-worktrees/feature-name
# TARGET_DIR="../${REPO_NAME}-worktrees/${BRANCH//\//-}"

# 1. Get the absolute path of the folder WHERE the worktrees live
# (This resolves the ".." part safely)
WORKTREE_BASE=$(realpath "$REPO_ROOT/..")

# 2. Construct the final path manually
TARGET_DIR="$WORKTREE_BASE/${REPO_NAME}-worktrees/${BRANCH//\//-}"

# 1. Create the worktree
if [ ! -d "$TARGET_DIR" ]; then
	echo "Creating worktree in $TARGET_DIR..."

	# Check if the branch exists locally
	if git show-ref --verify --quiet "refs/heads/$BRANCH"; then
		# Branch exists: just add the worktree
		git worktree add "$TARGET_DIR" "$BRANCH"
	else
		# Branch doesn't exist: create it (-b) from the base branch
		echo "Branch '$BRANCH' not found. Creating it from $BASE_BRANCH..."
		git worktree add -b "$BRANCH" "$TARGET_DIR" "$BASE_BRANCH"
	fi
else
	echo "Worktree directory already exists."

	# Optional: ensure git knows about this worktree if it was disconnected
	git worktree repair 2>/dev/null
fi

# 2. Create a new detached tmux session
# -d: start detached so we can send keys before switching
# -s: name the session after the branch
# -c: set the starting directory
SESSION_NAME="${BRANCH//\//-}"

# 3. Tmux Logic: Setup specialized layout
if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
	# Create session
	tmux new-session -d -s "$SESSION_NAME" -c "$TARGET_DIR"

	# Split the window vertically to create a pane on the right
	# -h: horizontal split (side-by-side)
	# -p 30: the new pane takes up 30% of the width
	tmux split-window -h -p 30 -t "$SESSION_NAME" -c "$TARGET_DIR"

	# Split that new right-hand pane horizontally
	# -v: vertical split (top-and-bottom)
	tmux split-window -v -t "$SESSION_NAME" -c "$TARGET_DIR"

	# Optional: Select the first pane (Nvim) so you start in the editor
	tmux select-pane -t "$SESSION_NAME.0"

	# tmux send-keys -t "$SESSION_NAME" "nvim ." C-m

	# Create a second window for AI tools
	tmux new-window -t "$SESSION_NAME" -c "$TARGET_DIR"

	# Check branch name and open appropriate AI tool
	if [[ "$BRANCH" == *"gemini"* ]]; then
		tmux send-keys -t "$SESSION_NAME:1" "gemini" C-m
	elif [[ "$BRANCH" == *"claude"* ]]; then
		tmux send-keys -t "$SESSION_NAME:1" "claude" C-m
	fi

	# Switch back to the first window
	tmux select-window -t "$SESSION_NAME:0"
fi

# 3. Switch to the session
if [ -z "$TMUX" ]; then
	# If we are outside tmux, attach to it
	tmux attach -t "$SESSION_NAME"
else
	# If we are already inside tmux, switch the client to the new session
	tmux switch-client -t "$SESSION_NAME"
fi
