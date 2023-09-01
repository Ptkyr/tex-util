# Ubuntu WSL2 Setup

Based on this [fantastic blog post](https://castel.dev/post/lecture-notes-1/). Rest in peace, king.

1. Install `zathura` and `latexmk`
```
sudo apt-get install zathura latexmk
```
Configure things in [`~/.config/zathura/zathurarc`](https://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html) and `~/.latexmkrc` respectively. In particular, you might want the latter to have
```
$emulate_aux = 1;
$out_dir = 'output';
$aux_dir = 'aux';
$pdf_previewer = 'zathura';
```
for `latexmk` to spit its garbage into a folder. Also, a useful alias is
```
pvc() {
    latexmk -pdf -pvc -interaction=nonstopmode "${1}"
}
```
to set up continuous compilation.

2. Install [`texlive-full` without the beef](https://gist.github.com/wkrea/b91e3d14f35d741cf6b05e57dfad8faf)
```
sudo apt install `sudo apt --assume-no install texlive-full | \
        awk '/The following additional packages will be installed/{f=1;next} /Suggested packages/{f=0} f' | \
                tr ' ' '\n' | grep -vP 'doc$' | grep -vP 'texlive-lang' | grep -vP 'latex-cjk' | tr '\n' ' '`
```
Note that any custom package `.sty` files should go in `~/texmf/tex/latex/local/`.

3. Install [vim-plug](https://github.com/junegunn/vim-plug#unix)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

4. Set up [UltiSnips et al.](https://github.com/gillescastel/latex-snippets) in `~/.vimrc`
```
" Top of file
call plug#begin()

" <Whatever, probably nothing>

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" <Whatever, probably nothing>

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

<Rest of .vimrc>
```
5. Copy `tex.snippets` to `~/.vim/(bundle/vim-snippets/)?Ultisnips`

6. Install [`VcXsrv`](https://sourceforge.net/projects/vcxsrv/) and in `xlaunch.exe` check "Disable access control." Save this and throw it into `shell:startup`. May also need to let `VcXsrv` through Windows Firewall.

7. Throw 
```
export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
```
into `~/.bashrc` to enable X-forwarding (i.e. get `zathura` to work).

8. Off to the races? General workflow is:
* Run `pvc x.tex`
* Open another terminal window
* Edit `x.tex` in the new window
