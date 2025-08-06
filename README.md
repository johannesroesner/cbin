# cbin: Custom Binaries for macOS

**cbin** is a small library of custom tools I personally use on my macOS setup.

---

## Tools in cbin

### 1. **`init-repo.sh`**: Create a Remote GitHub Repo via Terminal

This script automates the creation of a remote GitHub repository directly from your terminal.

#### **Purpose**

- Quickly initialize a new GitHub repository based on a local folder.

#### **Pre-requisites**

- GitHub CLI must be authenticated via SSH.

#### **Parameters**

1. **GitHub repo name**: The name you wish to give your GitHub repository.
2. **Public flag** (`true/false`): Whether the repository should be public (`true`) or private (`false`).
3. **First commit message**: The commit message for the initial commit.

#### **Usage Example**

```bash
./init-repo.sh test-repo-name true "Initial commit"
```

### 2. **`zsh-ide-wrapper.sh`**: Customize Terminal Behavior inside IDEs via Flag

For example JetBrains Fleet IDE currently only allows you to specify which binary will open as the terminal inside the
terminal tab.
This
script helps `zsh`
to "know" where the terminal is being called from, whether it's from Fleet or a regular terminal session.

#### **Purpose**

- Customize `zsh` behavior to handle terminal environments differently depending on whether it's opened from an IDE or
  elsewhere.
