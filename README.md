# Dotfiles

These are my personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

You need to have GNU Stow installed. You can usually install it with your system's package manager.

- **For Debian/Ubuntu:** `sudo apt-get install stow`
- **For Arch Linux:** `sudo pacman -S stow`
- **For macOS (using Homebrew):** `brew install stow`

## Installation

1.  **Clone the repository** into your home directory.

    ```bash
    git clone https://github.com/rathod-sahaab/dotfiles ~/dotfiles
    ```

2.  **Navigate to your home directory**. The `stow` command needs to be run from the directory where the symlinks should be created.

    ```bash
    cd ~
    ```

3.  **Back up existing configs**: If you already have configuration files in the locations where `stow` will create symlinks (e.g., `~/.config`, `~/.gitignore`), they will cause a conflict. Back up or remove them first.

4.  **Run stow**: Execute the following command to create the symlinks.

    ```bash
    stow -S dotfiles
    ```

    This command tells `stow` to create symlinks for all the files and directories within the `dotfiles` directory into the current directory (`~`).

## How It Works

This setup uses `stow` to manage the entire `~/dotfiles` directory as a single "package". The `stow dotfiles` command, when run from `~`, symlinks the contents of `~/dotfiles` into `~`.

For example:
- `~/dotfiles/.config` is symlinked to `~/.config`
- `~/dotfiles/.prettierrc` is symlinked to `~/.prettierrc`

### Ignoring Files

The `.stow-local-ignore` file in this repository tells `stow` to ignore certain files and directories, such as the `.git` directory and this `README.md`, so they don't get symlinked into your home directory.

## Usage

### Adding New Files

To add new dotfiles, simply create them in this repository with the same path they would have in your home directory. Then, run `stow -R dotfiles` from your home directory to link the new files. The `-R` (`--restow`) flag will re-run stow and link any new files without affecting existing links.

### Removing Files (Unstowing)

To remove all the symlinks created by `stow`, run the following command from your home directory:

```bash
stow -D dotfiles
```
