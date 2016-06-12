## Setup and confugure

### Step 1: create necessary soft links

```bash
ln -s <vim-cloned-dir> ~/.vim
ln -s <vim-cloned-dir> ~/.vimrc
```

### Step 2: Install plugins

```bash
vim +PlugInstall
```


### Step 3: Setup YouCompleteMe

For more information check on YouCompleteMe repo [here](https://github.com/Valloric/YouCompleteMe)


**Language Support compilation flags**

- C-family semantic support: `--clang-completer`
- C#: `--omnisharp-completer`
- GO: Install [Go](https://golang.org/doc/install) and add `--gocode-completer` when calling `./install.py`
- TypeScript: install Node.js and npm then install the TypeScript SDK with `npm install -g typescript`
- JavaScript: install Node.js and npm and tern (sudo npm install -g tern) and add --tern-completer when calling ./install.py
