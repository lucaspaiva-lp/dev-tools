# **Git Quick Guide**

---

### **File States**

- **Modified:** Changes made in the working directory.
- **Staged (index):** Files added to the staging area (`git add`).
- **Committed:** Changes recorded in the local repository (`git commit`).

---

## **Help**

- **General:** `git help`
- **Specific command:** `git help <command>`
- **Example:** `git help add`, `git help commit`

---

## **Configuration**

Git configuration files are stored in:

- Linux/macOS: `~/.gitconfig`
- Windows: `C:\Users\<user>\.gitconfig`

### Set user name

git config --global user.name "Your Name"

### Set email

git config --global user.email you@example.com

### Set default editor

git config --global core.editor vim

### Set merge tool

git config --global merge.tool vimdiff

### Set global ignore file

git config --global core.excludesfile ~/.gitignore

### List all configurations

git config --list

Ignoring Files

    Global: ignored in all repositories (core.excludesfile)

    Per repository: .gitignore file inside the project

Local Repository
Create and Inspect

git init # initialize repository
git status # check file status

### Add Files

git add file.txt # add specific file
git add directory/ # add directory
git add . # add all changes
git add -f file.txt # force add ignored file

### Commit

git commit file.txt -m "commit message" # commit a specific file
git commit -m "commit message" # commit all staged files

### Remove Files

git rm file.txt
git rm -r directory/

### Inspecting Changes (Diff)

git diff # working directory vs index
git diff --staged # staged changes
git diff HEAD # working directory vs last commit
git diff commit1 commit2 # diff between commits
git diff branch1..branch2 # diff between branches

### History

git log # full history
git log -p -2 # last 2 commits with diff
git log --stat # summary of changes
git log --pretty=oneline # one-line per commit
git log --pretty=format:"%h - %an, %ar : %s"
git log -- file.txt # history of a file
git log --diff-filter=M -- file.txt # modifications only
git blame -L 12,22 file.txt # author per line
git log --author=username # commits by author

Undoing Changes

### Discard local (unstaged) changes

git checkout -- file.txt

### Unstage file

git reset HEAD file.txt

### Restore staged or working tree (modern)

git restore file.txt
git restore --staged file.txt

### Remote Repository

git remote -v
git remote add origin git@github.com:user/repo.git
git remote show origin
git remote rename origin new-name
git remote rm name

### Push / Pull / Fetch

git push -u origin main # first push
git push # subsequent pushes
git pull # fetch + merge
git fetch # fetch only
git clone git@github.com:user/repo.git

### Tags

git tag v1.1
git tag -a v1.1 -m "message"
git tag -s v1.1 -m "message"
git tag -a v1.2 `<commit-hash>`
git push origin v1.2
git push origin --tags

### Branches

    main/master: main branch

    HEAD: current pointer

git branch
git branch -v
git branch --merged
git branch --no-merged

git branch feature-123
git checkout feature-123
git checkout -b feature-456

git checkout main
git merge feature-123

git branch -d feature-123

git push origin feature-123
git checkout -b feature-123 origin/feature-123
git push origin :feature-123

### Modern Alternatives

git switch branch-name
git switch -c new-branch

### Rebase

git checkout experiment
git rebase main
git rebase -i HEAD~3
git commit --amend -m "New message"
git rebase --continue

### Stash

git stash
git stash list
git stash apply
git stash apply stash@{2}
git stash branch my-branch

### Cherry-pick

git cherry-pick `<commit-hash>`

Apply a specific commit onto the current branch.
Reflog (Recovery Tool)

git reflog
git reset --hard HEAD@{1}

Used to recover from bad rebases, resets, or lost commits.
Bisect (Commit Debugging)

git bisect start
git bisect bad
git bisect good `<tag-or-commit>`
git bisect reset

### Commit Best Practices

    One logical change per commit

    Use present tense: add, fix, remove

    Message format:`<type>`: `<short description>`

#### Example:

feat: add appointment validation

Tip: This guide is a concise but complete reference covering the Git operations most commonly used in academic, personal, and professional projects.
