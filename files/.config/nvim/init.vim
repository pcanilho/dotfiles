"###############################################################################
"# Neovim Configuration (Cam Spiers) ###########################################
"###############################################################################
"
" This Neovim config is tailored towards PHP and JavaScript/TypeScript work
" it uses the vim-plug plugin manager and requires the following tools:
"
" | Tool                    | Description                                    |
" | ----------------------- | ----------------------                         |
" | Neovim                  | Untested in Vim                                |
" | vim-plug                | Plugin Manger                                  |
" | Yarn                    | Required by Plugins                            |
" | Git                     | Required by Plugins                            |
" | python3 support         | Required by Plugins                            |
" | font with devicons      | Devicons in statusline                         |
" | Fuzzy Finder (FZF)      | Search                                         |
" | ripgrep                 | Search                                         |
" | bat                     | Search Previews                                |
" | tmux                    | Open Projects                                  |
" | tmuxinator              | Open Projects                                  |
" | tmuxinator-fzf-start.sh | Open Projects                                  |
" | timer                   | Pomodoro timer (https://github.com/rlue/timer) |
" | lazygit                 | Git terminal interfact                         |
" | lazydocker              | Docker terminal interface                      |
"
"###############################################################################
"# Plugins #####################################################################
"###############################################################################

" Start Vim plug and set the plugin directory
call plug#begin(stdpath('config') . '/plugged')

"###############################################################################
"# Vim Defaults Plugins ########################################################
"###############################################################################

" Sensible defaults
Plug 'tpope/vim-sensible'
" Standard terminal integration improvements, mouse, cursor etc
Plug 'wincent/terminus'

"###############################################################################
"# Visual Plugins ##############################################################
"###############################################################################

" Status line
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Startup screen
Plug 'mhinz/vim-startify'
" Makes tmux use airline colors
Plug 'edkolev/tmuxline.vim'
" Show git info in sidebar
Plug 'mhinz/vim-signify'
" Dev icons
Plug 'ryanoasis/vim-devicons'
" Nicer scrolling
Plug 'psliwka/vim-smoothie'
" Show indentation
Plug 'nathanaelkane/vim-indent-guides'
" Themes
Plug 'chriskempson/base16-vim'
" Makes determining active window easier
Plug 'blueyed/vim-diminactive'

"###############################################################################
"# Navigation/Search Plugins ###################################################
"###############################################################################

" Replacement for netrw
Plug 'justinmk/vim-dirvish' 
" Support for displaying git statuses in dirvish
Plug 'kristijanhusak/vim-dirvish-git'
" Projections for dirvish
Plug 'fsharpasharp/vim-dirvinist'
" Fuzzy file finding, relies on FZF being installed via brew
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
" Allows the use of Rg options in Rg + FZF searching
Plug 'jesseleite/vim-agriculture'
" Helps root switching
Plug 'airblade/vim-rooter'
" Cyclic navigation bindings for filetypes and file patterns
Plug 'tpope/vim-projectionist'
" Integrates with projectionist to add 'Ftype' type commands
Plug 'c-brenn/fuzzy-projectionist.vim'
" Common pane navigation for Vim and tmux together
Plug 'christoomey/vim-tmux-navigator'
" Jump to interesting places with a Git or Mercurial repo
Plug 'wincent/vcs-jump'
" Search context improvements
Plug 'wincent/loupe'
" Improves the quickfix list
Plug 'romainl/vim-qf'

"###############################################################################
"# Editor/Motion Plugins #######################################################
"###############################################################################

" CoC Plugins
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}

" Better commenting
Plug 'tomtom/tcomment_vim'
" Surround motions
Plug 'tpope/vim-surround'
" Adds ability to adjust alignment in visual mode
Plug 'godlygeek/tabular'
" Motions for inside camel case
Plug 'bkad/CamelCaseMotion'
" Allows repeating of various custom commands
Plug 'tpope/vim-repeat'
" Allows for easy repeat of last used macro
Plug 'wincent/replay'
" Split and join programming lines
Plug 'AndrewRadev/splitjoin.vim'
" Nice docblock generator
Plug 'kkoomen/vim-doge'
" Better search motions (s and S, z and Z)
Plug 'justinmk/vim-sneak'
" Highlighting
Plug 'romainl/vim-cool'

"###############################################################################
"# Code Formatting Plugins #####################################################
"###############################################################################

" Import tabs etc from editorconfig
Plug 'editorconfig/editorconfig-vim'
" Pretter for COC
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}

"###############################################################################
"# Tool Plugins ################################################################
"###############################################################################

" Peak at registers
Plug 'junegunn/vim-peekaboo'
" Measure startuptime
Plug 'dstein64/vim-startuptime'
" Adds composer command support
Plug 'noahfrederick/vim-composer'
" Docker compose tools
Plug 'skanehira/docker-compose.vim'
" Personal wiki
Plug 'vimwiki/vimwiki'
" PHP Debugging
Plug 'vim-vdebug/vdebug', { 'on': [] }
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Merge tool for git
Plug 'samoshkin/vim-mergetool'
" Slack integration
Plug 'prashantjois/vim-slack'
" Live Latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Allow the use of Nvim from Brave/Chrome
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" UNIX tools
Plug 'tpope/vim-eunuch'
" Used as a replacement for vim-slime. Provides repl interaction with gx
Plug 'kassio/neoterm'
" Git tools
Plug 'tpope/vim-fugitive'
" GitLab support
Plug 'shumphrey/fugitive-gitlab.vim'
" DB tools
Plug 'tpope/vim-dadbod'
" [ and ] mappings, in particular for quickfix, and spell nospell
Plug 'tpope/vim-unimpaired'
" Tool for seeing git messages in a line, and visual context
Plug 'rhysd/git-messenger.vim'
" Spelling errors to quickfix list
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-spellcheck'
" When creating new files in directories that don't exist, it just works
Plug 'duggiefresh/vim-easydir'
" Tools for working with marks
Plug 'kshenoy/vim-signature'

"###############################################################################
"# Syntax Plugins ##############################################################
"###############################################################################

Plug 'bfontaine/Brewfile.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'jwalton512/vim-blade'
Plug 'leafgarland/typescript-vim'
Plug 'lilyball/vim-swift'
Plug 'peitalin/vim-jsx-typescript'
Plug 'phalkunz/vim-ss'
Plug 'StanAngeloff/php.vim'
Plug 'tmux-plugins/vim-tmux'

call plug#end()

"###############################################################################
"# General Settings ############################################################
"###############################################################################

" Import local config for private config, e.g. keys, tokens
silent! source ~/.config/nvim/local.vim
" Default file encoding
set encoding=UTF-8
" Enable undo persistence across sessions
set undofile
" Split defaults
set splitbelow splitright
" Don't change dirs automatically, using rooter for that
set noautochdir
" System clipboard
set clipboard=unnamed
" Ignore patterns
set wildignore+=.git/,.DS_Store
" No sound
set noerrorbells
set timeoutlen=500
" Set up a dictionary
set dictionary=/usr/share/dict/words
" Make buffers hidden then abandoned
set hidden

"###############################################################################
"# Searching ###################################################################
"###############################################################################

set ignorecase
set smartcase
" Displays incremental replacement without actually replacing content
set inccommand=split

"###############################################################################
"# Editing #####################################################################
"###############################################################################

set tabstop=4
set shiftwidth=4
set expandtab

"###############################################################################
"# Visual Settings #############################################################
"###############################################################################

" Add bulk color past 120
let &colorcolumn=join(range(121,999),",")
" Spell checking
set spelllang=en
" Turn spelling on for markdown files
autocmd FileType markdown setlocal spell
" Don't redraw while performing a macro
set lazyredraw
" Don't display visual bell
set novisualbell
" Show matching braces
set showmatch
" Enable current line indicator
set cursorline
" Show line numbers
set number relativenumber
" Set the colorscheme
let base16colorspace=256
colorscheme base16-chalk
let g:airline_theme='base16_chalk'
" Enables 24bit colors
set termguicolors
" Make comments italic
highlight Comment cterm=italic gui=italic

"###############################################################################
"# Search Mappings #############################################################
"###############################################################################

"###############################################################################
"# Preview without Rg options | Daily Driver ###################################
"###############################################################################

" Open ripgrep
nnoremap <silent> <Leader>f :Rg<CR>
" Open global grep
nnoremap <silent> <Leader>g :Rgg<CR>
" Open ripgrep for cursor word
nnoremap <silent> <Leader>c :Rg <C-R><C-W><CR>

"###############################################################################
"# No Preview with Rg options | Specialized ####################################
"###############################################################################

" Open ripgrep agriculture
nmap <Leader>/ <Plug>RgRawSearch
" Open ripgrep agriculture for visual selection
vmap <Leader>/ <Plug>RgRawVisualSelection
" Open ripgrep agriculture for cursor word
nmap <Leader>* <Plug>RgRawWordUnderCursor

"###############################################################################
"# Mappings ####################################################################
"###############################################################################

" Only window
nnoremap <silent> <Leader>o :only<CR>
" Next buffer
nnoremap <silent> <Tab> :bnext<CR>
" Previous buffer
nnoremap <silent> <S-Tab> :bprevious<CR>
" Create vsplit
nnoremap <silent> <Leader>\| :vsplit<CR>
" Create hsplit
nnoremap <silent> <Leader>- :split<CR>
" Save file
nnoremap <silent> <Leader>w :write<CR>
" Open startify with leader s
nnoremap <silent> <Leader>s :Startify<CR>
" Open fuzzy files with leader \
nnoremap <silent> <Leader>\ :Files<CR>
" Open fuzzy lines with leader l
nnoremap <silent> <Leader>l :Lines<CR>
" Open fuzzy buffers with leader b
nnoremap <silent> <Leader>b :Buffers<CR>
" Close all by current window
nnoremap <silent> <Leader>o <C-w>o<CR>
" Close the current buffer
nnoremap <silent> <Leader>x :bdelete<CR>
" Close all buffers
nnoremap <silent> <Leader>z :%bdelete<CR>
" Alternate file navigation
nnoremap <silent> <Leader>a :A<CR>
" Alternate file navigation vertical split
nnoremap <silent> <Leader>v :AV<CR>
" Cycle line number modes
nnoremap <silent> <Leader>r :call CycleLineNumbering()<CR>
" Toggle virtualedit
nnoremap <silent> <Leader>v :call ToggleVirtualEdit()<CR>
" Open project
nnoremap <silent> <Leader>] :call OpenTerm('tmuxinator-fzf-start.sh', 0.15, 'vertical')<CR>
" Switch session
nnoremap <silent> <Leader>[ :call OpenTerm('tmux-fzf-switch.sh', 0.15, 'vertical')<CR>
" Kill session
nnoremap <silent> <Leader>} :call OpenTerm('tmux-fzf-kill.sh', 0.15, 'vertical')<CR>
" Open lazygit
nnoremap <silent> <Leader>' :call OpenTerm('lazygit', 0.8)<CR>
" Open lazydocker
nnoremap <silent> <Leader>; :call OpenTerm('lazydocker', 0.8)<CR>
" Open harvest
nnoremap <silent> <Leader>h :call OpenTerm('hstarti', 0.1)<CR>
" Toggle pomodoro
nnoremap <silent> <Leader>p :call TogglePomodoro()<CR>
" Register Vdebug only need to call this when you need to change the roots
nnoremap <silent> <Leader>~ :call RegisterVdebug()<CR>
" Calls the custom start function that requests path map to be defined if not already run
nnoremap <silent> <F5> :call StartVdebug()<CR>
" Get outline
nnoremap <silent> <Leader>co :<C-u>CocList outline<CR>
" Get symbols
nnoremap <silent> <Leader>cs :<C-u>CocList -I symbols<CR>
" Get errors
nnoremap <silent> <Leader>cl :<C-u>CocList locationlist<CR>
" Get available commands
nnoremap <silent> <Leader>cc :<C-u>CocList commands<CR>
" Restart server
nnoremap <silent> <Leader>cR :<C-u>CocRestart<CR>
" Rename
nmap <leader>rn <Plug>(coc-rename)
" Go to definition
nmap gd <Plug>(coc-definition)
" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" Go to references
nmap <silent> gr <Plug>(coc-references)
" Go to type
nmap <silent> gy <Plug>(coc-type-definition)
" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" Get hint
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>
" Use gx{text-object} in normal mode
nmap gx <Plug>(neoterm-repl-send)
" Send selected contents in visual mode.
xmap gx <Plug>(neoterm-repl-send)
" Git commit messages
nmap <silent> gm <Plug>(git-messenger)
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Remap arrows to resize
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Run :VcsJump diff
nnoremap <Leader>+ :VcsJump diff<CR>

"###############################################################################
"# FZF/Ripgrep Configuration ###################################################
"###############################################################################

" Use agriculture as a global no hidden search
let g:agriculture#rg_options = '--no-ignore --hidden'

" Some ripgrep searching defaults
function! GetRipgrepCommand(ignore)
  return 'rg' .
    \ ' --hidden' .
    \ ' --color ansi' .
    \ ' --column' .
    \ ' --line-number' .
    \ ' --no-heading' .
    \ ' --smart-case' .
    \ ' ' . (a:ignore == 1 ? '--ignore' : '--no-ignore')
endfunction

" Adds prompt
function! GetPreviewFlags(prompt)
  return ' --prompt="' . a:prompt . '> "'
endfunction

" Ensure that only the 4th column delimited by : is filtered by FZF
function! GetGrepPreviewFlags(prompt)
  return GetPreviewFlags(a:prompt) . ' --delimiter : --nth 4..'
endfunction

" Configures ripgrep with FZF
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   GetRipgrepCommand(1) . ' ' . shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': GetGrepPreviewFlags('Grep')}), <bang>0)

command! -bang -nargs=* Rgg
  \ call fzf#vim#grep(
  \   GetRipgrepCommand(0) . ' ' . shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': GetGrepPreviewFlags('Global Grep')}), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': GetPreviewFlags('Files')}), <bang>0)

" Don't use status line in FZF
augroup FzfConfig
  autocmd!
  autocmd! FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" Use ripgrep for FZF
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --iglob "!.DS_Store" --iglob "!.git"'

" Default FZF options with bindings to match layout and select all + none
let $FZF_DEFAULT_OPTS = '--layout=default' .
  \ ' --info inline' .
  \ ' --bind ctrl-a:select-all,ctrl-d:deselect-all,tab:toggle+up,shift-tab:toggle+down'

" Default location for FZF
let g:fzf_layout = { 'down': '~40%' }

" Populate the arglist with files from searches etc
function! s:populate_arg_list(lines)
  execute 'args ' . join(map(a:lines, {_, val -> fnameescape(val)}), ' ') 
endfunction

" On ctrl-l populate the arg list with the current selection, useful for :cfdo
let g:fzf_action = { 'ctrl-l': function('s:populate_arg_list') }

"###############################################################################
"# Coc Configuration ###########################################################
"###############################################################################

" Sets up comand for prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Remove messages from in-completion menus
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

"###############################################################################
"# Plugin Configurations #######################################################
"###############################################################################

" Go into popup when gm is triggered
let g:git_messenger_always_into_popup = 1
" Better background color
hi link gitmessengerPopupNormal CursorLine
" Don't use default mappings
let g:git_messenger_no_default_mappings = 1
" Handle focus lost and gained events
let g:diminactive_enable_focus = 1
" Use color column to help with active/inactive
let g:diminactive_use_colorcolumn = 1
" 3-way merge
let g:mergetool_layout = 'bmr'
let g:mergetool_prefer_revision = 'local'
" Config vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
" Don't start markdown preview automatically, use :MarkdownPreview
let g:mkdp_auto_start = 0
" Configures tmux line, use :TmuxlineSnapshot ~/.tmux/theme.conf to save
let g:tmuxline_preset = {
  \'a'    : '#[bold]#S',
  \'b'    : '#(whoami)',
  \'win'  : '#W',
  \'cwin' : '#W',
  \'y'    : ['%R', '%a', '%d/%m/%y'],
  \'z'    : '#[bold]#(battstat {p} | tr -d " ")'}
" Don't show powerline separators in tmuxline
let g:tmuxline_powerline_separators = 0
" Use docker files and git
let g:rooter_patterns = ['docker-compose.yml', '.git/']
" Change silently
let g:rooter_silent_chdir = 1
" Sets up within word motions to use ,
let g:camelcasemotion_key = ','
" Changes startify to have a different heading and only dirs
let g:startify_lists = [ { 'type': 'dir', 'header': ['   Recent Files'] } ]
" Don't change directories
let g:startify_change_to_dir = 0
" Configure indentation guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 1
" Configure Airline Theme
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Configure colors for dirvish highligh groups
let g:dirvish_git_modified = 'guifg=#ddb26f ctermfg=3'
let g:dirvish_git_added = 'guifg=#acc267 ctermfg=2'
let g:dirvish_git_unmerged = 'guifg=#fb9fb1 ctermfg=1'
silent execute 'hi default DirvishGitModified '.g:dirvish_git_modified
silent execute 'hi default DirvishGitStaged '.g:dirvish_git_added
silent execute 'hi default DirvishGitRenamed '.g:dirvish_git_modified
silent execute 'hi default DirvishGitUnmerged '.g:dirvish_git_unmerged
silent execute 'hi default DirvishGitIgnored guifg=NONE guibg=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=NONE'
silent execute 'hi default DirvishGitUntracked guifg=NONE guibg=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=NONE'
silent execute 'hi default link DirvishGitUntrackedDir DirvishPathTail'

"###############################################################################
"# Custom Functions ############################################################
"###############################################################################

" Cycle through relativenumber + number, number (only), and no numbering.
function! CycleLineNumbering() abort
  execute {
    \ '00': 'set relativenumber   | set number',
    \ '01': 'set norelativenumber | set number',
    \ '10': 'set norelativenumber | set nonumber',
    \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
endfunction

" Toggle virtualedit
function! ToggleVirtualEdit() abort
  set virtualedit=(if &virtualedit == "all" ? "" : "all")
endfunction

" Pomodoro timer, example: "25 5 25 5" will run a timer for 25mins, ding then
" 5mins, ding, then 25mins ding, then 5mins, ding
function! TogglePomodoro()
  call inputsave()
  let time = input("Units> ")
  call inputrestore()
  normal :<ESC>
  if time == ""
    silent execute "!vim-timer stop"
  else
    call system("nohup vim-timer " . time . " &")
  endif
endfunction

" Custom start function that requests path maps to be registed if they haven't
" been already
let g:register_vdebug = 0
function! StartVdebug()
  if g:register_vdebug == 0
    call RegisterVdebug() | let g:register_vdebug = 1
  endif
  python3 debugger.run()
endfunction

" Vdebug needs to be able to load files and understand how the file in the docker
function! RegisterVdebug()
  call plug#load('vdebug')
  call inputsave()
  let server_root = input("Server Path> ", '/var/www/html/')
  let local_root = input("Local Path> ", getcwd())
  call inputrestore()
  normal :<ESC>
  let g:vdebug_options.path_maps[server_root] = local_root
endfunction

"###############################################################################
"# Terminal Handling ###########################################################
"###############################################################################

" Sets default location that neoterm opens
let g:neoterm_default_mod = 'botright'

" Quit term buffer with ESC
augroup TermHandling
  autocmd!
  " Turn off line numbers, listchars, auto enter insert mode and map esc to
  " exit insert mode
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber
    \ | startinsert
    \ | tnoremap <Esc> <c-\><c-n>
  autocmd! FileType fzf tnoremap <buffer> <Esc> <c-c>
augroup END

" Wrapper for opening terms with auto close, optional argument for size
" percentag
function! OpenTerm(cmd, ...)
  let percentage = get(a:, 1, 0.5)
  let orientation = get(a:, 2, 'horizontal')
  if orientation == 'horizontal'
    new | execute 'resize ' . string(&lines * percentage)
  else
    vnew | execute 'vertical resize ' . string(&columns * percentage)
  endif
  call termopen(a:cmd, {'on_exit': {j, c, e -> execute('if c == 0 | close | endif')}})
endfunction
