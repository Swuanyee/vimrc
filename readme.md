# My Vim Configuration

This repository contains my Vim configuration for development with support for Python, JavaScript, C, Kotlin, and Swift. It includes settings for syntax highlighting, linting, and language server protocol (LSP) integration using `coc.nvim`.

## Installation Steps

### 1. Install Vim

#### Ubuntu
```sh
sudo apt update
sudo apt install vim
```

#### macOS
```sh
brew install vim
```

#### Windows
Download and install Vim from the [official website](https://www.vim.org/download.php).

### 2. Install `vim-plug`

`vim-plug` is a minimalist Vim plugin manager.

#### Unix/Linux/macOS
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Windows (PowerShell)
```powershell
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    '~\vimfiles\autoload\plug.vim'
  )
)
```

### 3. Install Node.js and npm

`coc.nvim` requires Node.js and npm.

#### Ubuntu
```sh
sudo apt install nodejs npm
```

#### macOS
```sh
brew install node
```

#### Windows
Download and install Node.js from the [official website](https://nodejs.org/).

### 4. Clone the Repository

Clone this repository to your local machine:

```sh
git clone https://github.com/yourusername/your-repo-name.git ~/.vim
```

### 5. Install Plugins

Open Vim and run the following command to install the plugins:

```vim
:PlugInstall
```

### 6. Install `coc.nvim` Extensions

Open Vim and run the following command to install the necessary `coc.nvim` extensions:

```vim
:CocInstall coc-clangd coc-kotlin coc-sourcekit
```

### 7. Additional Setup for Language Servers

- **Python**: Ensure `autopep8` is installed.
  ```sh
  pip install autopep8
  ```

- **JavaScript/TypeScript**: Ensure `eslint` and `prettier` are installed.
  ```sh
  npm install -g eslint prettier
  ```

- **C/C++**: Ensure `clangd` is installed.
  - Ubuntu:
    ```sh
    sudo apt install clangd
    ```
  - macOS:
    ```sh
    brew install llvm
    ```
  - Windows:
    Download and install LLVM from the [official website](https://releases.llvm.org/).

- **Kotlin**: Ensure the `kotlin-language-server` is installed.
  Download the latest release from the [GitHub releases page](https://github.com/fwcd/kotlin-language-server/releases) and follow the installation instructions.

- **Swift**: Ensure `sourcekit-lsp` is installed.
  - macOS:
    Install Xcode or the Swift toolchain from [Swift.org](https://swift.org/download/).

### Summary

This configuration sets up Vim for multi-language development with support for Python, JavaScript, C, Kotlin, and Swift. It includes syntax highlighting, linting, and LSP integration using `coc.nvim` and `vim-plug`.
