alias uw='ssh -Y e224wang@linux.student.cs.uwaterloo.ca'
alias holoclean='ssh e224wang@holoclean.cs.uwaterloo.ca'
alias g17='g++-11 -std=c++17 -g -Wall -Wextra -pedantic -fsanitize=undefined,address'
alias g20='g++-11 -std=c++20 -g -Wall -Wextra -pedantic -fsanitize=undefined,address'
alias ghc='ghc -Wall -fforce-recomp'
alias bat='batcat --style=numbers,changes --theme=gruvbox-dark'
alias bt='batcat --style=numbers,changes --theme=gruvbox-dark'
alias cr='cabal run'
alias v='vi'
alias javac='javac -Xlint:-options -source 1.3 -target 1.3'
alias python='python3'
alias jupyter-notebook="~/.local/bin/jupyter-notebook --no-browser"
alias nas='nasm -O1 -f elf -g -F dwarf'
alias lda='ld -m elf_i386 -o main'
alias gst='git status'
alias gaa='git add --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias ggpush='git push -u origin $(git branch --show-current)'
alias ggpull='git pull'
alias glog='git log --pretty=format:"%h - %ad - %s" --date=iso'
export PATH=$PATH:~/.local/bin

nasmld() {
    if [ ${#} -ne 1 ]; then
        echo "Usage: nasmld [file.s]" >&2
        return 1
    fi
    stem="${1%.*}"
    nasm -O1 -f elf -g -F dwarf ${1}
    ld -m elf_i386 -o ${stem} "${stem}.o"
}

marmo() {
    if [ ${#} -ne 1 ]; then
        echo "Usage: marmo [assn_number]" >&2
        return 1
    fi
    log="a${1}.log"
    git log --branches --remotes --tags --pretty=short --abbrev-commit --graph > ${log}
    git archive --format=zip --add-file ${log} --output ~/winhome/Downloads/cs444.zip HEAD
    rm ${log}
}

touw() {
    if [ ${#} -ne 2 ]; then
        echo "Usage: touw [local] [ssh]" >&2
        return 1
    fi
    scp -r "$1" "e224wang@linux.student.cs.uwaterloo.ca:~/$2" 
}

fromuw() {
    if [ ${#} -lt 1 ]; then
        echo "Usage: fromuw [ssh] [local|./]" >&2
        return 1
    fi
    scp -r "e224wang@linux.student.cs.uwaterloo.ca:$1" "./$2" 
}

fromhc() {
    if [ ${#} -ne 1 ]; then
        echo "Usage: fromhc ssh:~/[path]" >&2
        return 1
    fi
    scp -r "e224wang@holoclean.cs.uwaterloo.ca:~/$1" ./ 
}

haoc() {
    ghc sol.hs
    if [ ${?} -ne 1 ]; then
        ./sol
    fi
}

pvc() {
    inkscape-figures watch
    latexmk -pdf -pvc "${1}"
}

typ() {
    stem="${1%.*}"
    mkdir -p output
    typst watch --open zathura "${1}" "output/${stem}.pdf"
}

todl() {
    cp ${@} ~/winhome/Downloads
}

mvtodl() {
    mv ${@} ~/winhome/Downloads
}

tosc() {
    cp "./output/${1}.pdf" ~/school/
}

matplot() {
    if [ ${#} -ne 1 ]; then
        echo "Usage: matplot [csv_file]" >&2
        return 1
    fi
    cp ${1} "/home/ptkyr/.local/lib/python3.10/site-packages/matplotlib/mpl-data/sample_data/" 
}

split() {
    tmux new-session \; split-window -v -l 8 \; attach 
}

alias pmake='premake4 gmake; make'
