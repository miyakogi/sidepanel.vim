# SidePanel.vim

A vim plugin to manage "sidebar type" plugins in a singl window.
This plugin currently supports
[NERDTree](https://github.com/scrooloose/nerdtree),
[TagBar](https://github.com/majutsushi/tagbar),
[Gundo](https://github.com/sjl/gundo.vim),
and [VimFiler](https://github.com/Shougo/vimfiler.vim) by default.

## Installation

### Install plugin
If you are a NeoBundle user, add the following line in your vimrc.

```vim
NeoBundle 'miyakogi/sidepanel.vim'
```

Then reload .vimrc and execute `:NeoBundleInstall`.

### Activate plugin

Add the following lines in your `.vimrc`.

```vim
" Set position (left or right) if neccesary (default: "left").
let g:sidepanel_pos = "left"
" Set width if neccesary (default: 32)
let g:sidepanel_width = 26

" Activate plugins in SidePanel
let g:sidepanel_config = {}
let g:sidepanel_config['nerdtree'] = {}
let g:sidepanel_config['tagbar'] = {}
let g:sidepanel_config['gundo'] = {}
let g:sidepanel_config['vimfiler'] = {}
```

## Usage

`:SidePanel` shows list of available plugins. When you select a plugin and press enter, the plugin will replace the plugin list.

`:SidePanel nerdtree` opens NERDTree. If another sidebar is exists, it will be replaced.

`:SidePanelPosToggle` toggles position of the sidebar, left to right, or right to left.

`:SidePanelWidth [N]` changes width of the sidebar to `[N]`.

`:SidePanelClose` closes sidebar.
