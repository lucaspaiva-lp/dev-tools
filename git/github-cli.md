# GitHub CLI (gh) & Useful Workflow Commands Cheat Sheet

## Authentication & Configuration

gh auth login
-> Authenticate GitHub CLI with your account (supports SSH or HTTPS).

gh auth status
-> Check which GitHub account is logged in, the protocol used (SSH/HTTPS), and connection status.

gh config set -h github.com git_protocol ssh
-> Configure Git operations to use SSH (instead of HTTPS) for this host.

---

## Repository Creation & Linking

gh repo create <repo_name> --private --source. --push
-> Create a new GitHub repository named <repo_name>, set visibility to private (use --public for public), use the current folder as source, and push existing local commits.

gh repo create <repo_name> --public --add-readme
-> Create a new public GitHub repository, optionally add a README file.

---

## Repository Information & Status

gh repo view
-> Show details about the current repository: name, description, visibility, default branch, and remote URL.

gh repo view --json name,visibility,owner
-> Output repository information in JSON format; useful to see visibility, owner, and name precisely.

gh repo view --web
-> Open the current repository in your default web browser.

---

## Local Repository Workflow (Useful Commands)

mkdir <folder_name>
-> Create a new local folder for your project.

cd <folder_name>
-> Change into your project folder.

echo "# title" >> README.md
-> Create a README file with a title for your project (useful as first file to commit).

git init
-> Initialize a local Git repository in the current folder.

git add.
-> Stage all files in the current folder for commit.

git commit -m "Initial commit"
-> Commit staged files with a descriptive message.

---

## Notes / Tips

- Use `--source.` when creating a repository from an **existing local folder**.
- Use `--push` to immediately push local commits to the new GitHub repository.
- Visibility can be controlled with `--private` or `--public`.
- `gh auth status` is useful to ensure your CLI can interact with GitHub correctly, especially before creating or pushing repos.

# GitHub CLI Installation and Configuration (Simplified)

## Step 1: Install GitHub CLI

Open your terminal and run:

`sudo pacman -S github-cli`

- Confirms installation → type Y and press Enter.
- This installs the gh command.

## Step 2: Authenticate GitHub CLI

**Run:**

`gh auth login`

**Follow the prompts:**

- Where do you use GitHub? → select GitHub.com
- What is your preferred protocol for Git operations? → choose SSH (if you already have your SSH key)
- Upload your SSH public key to GitHub? → select Skip (if your key is already added)
- How would you like to authenticate GitHub CLI? → choose Login with a web browser
- A URL will appear → open it in your browser, log in, and authorize CLI

**When complete, you should see:**

✓ Configured git protocol
✓ Logged in as `<your username>`

## Step 3: Verify setup

Check that gh is working and authenticated:

`gh auth status`

You should see something like:

**github.com**
✓ Logged in to GitHub as `<username>` (`<visibility>`)
✓ Git operations configured to use SSH protocol.

# GitHub CLI Workflow: Create Local Folder, Commit, and Push to GitHub

## Step 1: Create a Local Folder for Your Project

`mkdir name_folder`
`cd name_folder`

## Step 2: Create a README or Initial File

`echo "# title" >> README.md`

## Step 3: Initialize Git (if not already initialized)

`git init`

## Step 4: Stage Your Files

`git add.`

## Step 5: Commit Your Changes

`git commit -m "Initial commit"`

## Step 6: Create GitHub Repository and Push

`gh repo create name_folder --private --source. --push`

> Replace --private with --public if you want the repository to be public.
> --source. uses the current folder as the repository source.
> --push uploads your commits to GitHub immediately.
