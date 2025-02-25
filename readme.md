# My Vim Configuration

This repository contains my Vim configuration optimized for development with **Python, JavaScript, C, Kotlin, and Swift**. It includes settings for syntax highlighting, linting, and **Language Server Protocol (LSP)** integration using `coc.nvim`.

## Installation Guide

### 1. Install Vim

#### Ubuntu/Linux
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

`vim-plug` is a lightweight Vim plugin manager.

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

`coc.nvim` requires **Node.js and npm**.

#### Ubuntu/Linux
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

Clone this repository into your local Vim configuration directory:

```sh
git clone https://github.com/yourusername/your-repo-name.git ~/vim
```

Then, create a symbolic link for `.vimrc`:
```sh
ln -s ~/vim/vimrc ~/.vimrc
```

### 5. Install Plugins

Open Vim and run the following command to install all required plugins:
```vim
:PlugInstall
```

### 6. Install `coc.nvim` Extensions

To enable language server support, install the necessary `coc.nvim` extensions:
```vim
:CocInstall coc-clangd coc-kotlin coc-sourcekit coc-python coc-tsserver
```

### 7. Set Up Language Servers

Ensure you have the required language servers installed for full functionality.

#### **Python**
- Install `autopep8` for formatting:
  ```sh
  pip install autopep8
  ```
- Install the Python language server:
  ```sh
  pip install python-lsp-server
  ```

#### **JavaScript/TypeScript**
- Install `eslint` and `prettier` globally:
  ```sh
  npm install -g eslint prettier
  ```

#### **C/C++**
- Install `clangd` for code navigation and completion:
  - **Ubuntu/Linux**:
    ```sh
    sudo apt install clangd
    ```
  - **macOS**:
    ```sh
    brew install llvm
    ```
  - **Windows**:
    Download and install LLVM from the [official LLVM releases](https://releases.llvm.org/).

#### **Kotlin**
- Install `kotlin-language-server`:
  - Download the latest release from the [GitHub releases page](https://github.com/fwcd/kotlin-language-server/releases).
  - Follow the installation instructions provided.

#### **Swift**
- Install `sourcekit-lsp`:
  - **macOS**: Install Xcode or the Swift toolchain from [Swift.org](https://swift.org/download/).

### 8. Verify Installation

After installation, restart Vim and verify that everything is working properly:

- Open Vim and run:
  ```vim
  :CocList extensions
  ```
  This should list all installed `coc.nvim` extensions.

- To check if LSP servers are active:
  ```vim
  :CocCommand workspace.showOutput
  ```

### Summary

Configures **Vim for multi-language development** (Python, JavaScript, C, Kotlin, Swift).  
Includes **syntax highlighting, linting, and auto-formatting**.  
Uses `coc.nvim` for **LSP support and autocompletion**.  
Leverages `vim-plug` to **manage plugins efficiently**.  

---

### Need Help?
If you run into issues, check the Vim help system:
```vim
:help
```
Or, visit the [Vim documentation](https://vimhelp.org/).
