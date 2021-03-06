# ~/.bash_profile

# Truncate current working directory in prompt
# https://unix.stackexchange.com/a/266265
# get_PS1(){
#     limit=20
#     curdir="~${PWD#$HOME}"
#     if [[ "${#curdir}" -gt "$limit" ]]; then
#         right="${curdir:$((${#curdir}-$limit)):${#curdir}}"
#         PS1="...${right} \$ "
#     else
#         PS1="\w \$ "
#     fi
# }
# PROMPT_COMMAND=get_PS1
PS1="\$ "

export EDITOR='/usr/local/bin/vim'

# Inititialize fasd and its aliases
eval "$(fasd --init auto)"

# Aliases
## inspired by oh my zsh
### https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet#commands
alias cd="func() { if [ $(echo '$#') -eq 0 ]; then cd "$HOME"; else pushd $(echo '$1') > /dev/null && pwd; fi; }; func"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
# alias /="cd /"
alias ~="cd ~"
- () { cd -; }
alias 1="cd -"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"
alias 6="cd -6"
alias 7="cd -7"
alias 8="cd -8"
alias 9="cd -9"
alias md="mkdir -p"
alias rd="rmdir"

## git
### add
alias a="git add"
alias aa="func() { local files; files=$(echo '$(git status -s | fzf --nth=2.. --preview="if [ \$(git ls-files --other --exclude-standard {2..} | sed s/\ //g) ]; then; git diff --color=always --color-words --no-index -- /dev/null {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; git diff --color=always --color-words {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi" | cut -c4-)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git add $(echo '$@') --; }; func"
alias ac="git add --all && git commit"
alias aca="git add --all && git commit --amend"
alias acam="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias acamp="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force; }; func";
alias acap="git add --all && git commit --amend && git push --force"
alias acare="git add --all && git commit --amend --reedit-message=HEAD --reset-author"
alias acarep="git add --all && git commit --amend --reedit-message=HEAD --reset-author && git push --force"
alias acaru="git add --all && git commit --amend --reuse-message=HEAD --reset-author"
alias acarup="git add --all && git commit --amend --reuse-message=HEAD --reset-author && git push --force"
alias acm="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias acmp="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias acp="git add --all && git commit && git push"
alias acre="git add --all && git commit --reedit-message=HEAD --reset-author"
alias acrep="git add --all && git commit --reedit-message=HEAD --reset-author && git push"
alias acrepf="git add --all && git commit --reedit-message=HEAD --reset-author && git push --force"
alias acru="git add --all && git commit --reuse-message=HEAD --reset-author"
alias acrup="git add --all && git commit --reuse-message=HEAD --reset-author && git push"
alias acrupf="git add --all && git commit --reuse-message=HEAD --reset-author && git push --force"
alias ai="git add --interactive"
alias amend="git commit --amend --reuse-message=HEAD --reset-author"
alias amendp="git commit --amend --reuse-message=HEAD --reset-author && git push --force"
alias ap="git add --patch"
### branch
alias b="git branch"
alias bD="git branch -D" # delete branch (even if not merged)
alias ba="git branch --all"
alias bb="func() { local branch; branch=$(echo '$(git branch --color=always --verbose | fzf --ansi --bind="alt-x:execute-silent(git branch -D {1})+reload(git branch --color=always --verbose)" --preview="git diff --color=always \$(echo \$(git rev-parse --abbrev-ref HEAD)..{1}) | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" | cut -c3- | cut -d " " -f1)') && [ $(echo '$branch') ] && git checkout $(echo '$branch'); }; func"
alias bd="git branch --delete" # delete fully merged branch
### clone
alias c="func() { git clone $(echo '$1 ${1#*.*/}') && cd $(echo '${1#*.*/}'); }; func";
### commit
alias caa="git commit --amend --all"
alias caam="func() { git commit --amend --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias caamp="func() { git commit --amend --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force; }; func";
alias caap="git commit --amend --all && git push --force"
alias caare="git commit --amend --all --reedit-message=HEAD --reset-author"
alias caarep="git commit --amend --all --reedit-message=HEAD --reset-author && git push --force"
alias caaru="git commit --amend --all --reuse-message=HEAD --reset-author"
alias caarup="git commit --amend --all --reuse-message=HEAD --reset-author && git push --force"
alias cam="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias camp="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias campf="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force; }; func";
alias cap="git commit --all && git push"
alias capf="git commit --all && git push --force"
alias care="git commit --all --reedit-message=HEAD --reset-author"
alias carep="git commit --all --reedit-message=HEAD --reset-author && git push"
alias carepf="git commit --all --reedit-message=HEAD --reset-author && git push --force"
alias caru="git commit --all --reuse-message=HEAD --reset-author"
alias carup="git commit --all --reuse-message=HEAD --reset-author && git push"
alias carupf="git commit --all --reuse-message=HEAD --reset-author && git push --force"
alias cc="func() { local commit; commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- $@') }; func"
alias cm="func() { git commit --message \"$(echo '${*:-Changed files: $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")}')\"; }; func";
alias cmp="func() { git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias cmpf="func() { git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force; }; func";
alias cre="git commit --reedit-message=HEAD --reset-author"
alias crep="git commit --reedit-message=HEAD --reset-author && git push"
alias crepf="git commit --reedit-message=HEAD --reset-author && git push --force"
alias cru="git commit --reuse-message=HEAD --reset-author"
alias crup="git commit --reuse-message=HEAD --reset-author && git push"
alias crupf="git commit --reuse-message=HEAD --reset-author && git push --force"
### clean
alias cf="git clean -f"
alias cfd="git clean -fd"
alias cff="func() {local untracked; untracked=$(echo '$(git clean -dfn | sed s/^Would\ remove\ // | fzf)') && [ $(echo '$untracked') ] && echo $(echo '$untracked') | tr '\n' '\0' | xargs -0 git clean -df; }; func";
alias cn="git clean -n"
alias cnd="git clean -nd"
### checkout
alias co="git checkout"
alias cob="git checkout -b"
alias cof="func() { local files; files=$(echo '$(git diff HEAD --diff-filter=M --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git checkout HEAD --; }; func"
alias coh="func() { git checkout $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias com="git checkout master"
### diff
alias d="git diff --word-diff=color"
alias dc="git difftool -yt code --extcmd 'code --wait --diff'"
alias dcs="git difftool -yt code --extcmd 'code --wait --diff' --cached" # --staged is a synonym of --cached
alias dd="func() { local commit; commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && dt $(echo '$commit -- $@') }; func"
alias dh="func() { git diff --word-diff=color $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias dl="git diff --word-diff=color"
alias dn="git difftool -yt nvim --extcmd 'nvim -d +file'"
alias dns="git difftool -yt nvim --extcmd 'nvim -d +file' --cached" # --staged is a synonym of --cached
alias ds="git diff --word-diff=color --cached" # --staged is a synonym of --cached
alias dt="git difftool -yt vimdiff" # difftool is dt to match mergetool (mt)
alias dts="git difftool -yt vimdiff --cached" # --staged is a synonym of --cached
alias du="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias dus="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --cached" # --staged is a synonym of --cached
alias dw="git diff --word-diff=color"
## alias dp="git difftool -yt pycharm --extcmd 'pycharm diff $LOCAL $REMOTE'"
## alias dps="git difftool -yt pycharm --extcmd 'pycharm diff'"
### hub
alias h='hub'
alias hb="hub browse"
alias hc="hub create"
alias hd="hub delete"
alias hf="hub fork"
alias hg="hub gist"
alias hi="hub issue"
alias ho="hub compare"
alias hp="hub pr"
alias hr="hub release"
alias hs="hub ci-status"
alias hs="hub sync"
alias hu="hub pull-request"
### ignore (put in .gitignore)
alias i="func() { echo $(echo 'echo $@ | tr " " "\n" >> $(git rev-parse --show-toplevel)/.gitignore'); }; func";
alias ii="func() { local files; files=$(echo '$(git ls-files --others --exclude-standard | fzf)') && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -I file bash -c 'echo "file" >> \$(git rev-parse --show-toplevel)/.gitignore'; }; func";
### grep
alias gg="func() { local commit_file; commit_file=$(echo '$(git grep -l ${1:-^} $(git rev-list --all --abbrev-commit) -- ${@:2} | fzf --bind="alt-enter:execute-silent(git checkout {1} -- {2})+down" --delimiter=: --no-multi --nth=2.. --preview="git diff HEAD --color=always {1} {2} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$commit_file') ] && echo -n $(echo '$commit_file') | tr ':' '\0' | xargs -0 git checkout; }; func"
### log
alias l="git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D'"
alias ld="git log --format='%C(cyan)%ad %Creset%s %Cred%D %Cgreen%cn %Cblue%h' --date=short"
alias ll="func() { local commit; commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" -S $1 -- ${@:2} | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- ${@:2}') }; func"
alias lp="git log -p --word-diff=color"
alias lr="git log --format='%C(cyan)%>(12,trunc)%ar %Creset%<(80,trunc)%s %Cblue%h %Cgreen%<(17,trunc)%cn %Cred%D'"
### merge
alias mc="git mergetool -t code --extcmd 'code --wait'"
alias mcs="git mergetool -t code --extcmd 'code --wait' --cached"
alias mm="func() { local file; file=$(echo '$(git diff --diff-filter=U --name-only --relative | fzf --bind="alt-o:execute-silent(git checkout --ours {} && git add {})+reload(git diff --diff-filter=U --name-only --relative),alt-t:execute-silent(git checkout --theirs {} && git add {})+reload(git diff --diff-filter=U --name-only --relative)" --preview="git log --color=always --color-words --format=\"%n%C(cyan)%>(12,trunc)%ar %Cred%D %Creset%s %Cgreen%cn %Cblue%h\" --merge --patch -- {} | sed 1d | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR +Gvdiff! -- $(echo '$file'); }; func";
alias mn="git mergetool -t nvim --extcmd 'nvim -d +file'"
alias mns="git mergetool -t nvim --extcmd 'nvim -d +file' --cached"
alias mt="git mergetool -t vimdiff" # mv is taken
alias mts="git mergetool -t vimdiff --cached"
alias mu="git mergetool -t nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias mus="git mergetool -t nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --cached"
## alias mp="git mergetool -t pycharm --extcmd 'pycharm merge'"
## alias mps="git mergetool -t pycharm --extcmd 'pycharm merge'"
### push
alias p="git push"
alias pf="git push --force"
alias pom="git push origin master"
### rebase
alias rba="git rebase --abort"
alias rbc="git rebase --continue"
alias rbq="git rebase --quit"
alias rbs="git rebase --skip"
### remote
alias ra="git remote add"
alias rau="git remote add upstream"
alias rv="git remote -v"
### reset
alias r="git reset"
alias rh="func() { git reset $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhh="func() { git reset --hard $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhs="func() { git reset --soft $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rr="func() { local files; files=$(echo '$(git diff --cached --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git reset HEAD --; }; func"
alias rs="git reset --soft" # resets by default to HEAD
### stash
alias sa="git stash apply"
alias sb="git stash branch"
alias sc="git stash clear"
alias sd="git stash drop"
alias sl="git stash list"
alias sp="git stash push"
alias ss="func() { local stash; stash=$(echo '$(git stash list --format="%gd %s" | fzf --bind="alt-enter:execute-silent(git stash pop {1})+reload(git stash list --format=%gd\ %s),alt-x:execute-silent(git stash drop {1})+reload(git stash list --format=%gd\ %s)" --no-multi --preview="git stash show --color=always {1} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="60%" --with-nth=3.. | cut -d " " -f1)') && [ $(echo '$stash') ] && git stash pop $(echo '$stash') }; func"
alias su="git stash push && git pull"
alias sub="git stash push && git pull && git stash branch"
alias sup="git stash push && git pull && git stash pop"
### status
alias s="git status"
### update (git pull)
alias u="git pull"
alias uo="git pull origin"
alias uom="git pull origin master"
alias ur="git pull --rebase"
alias uru="git pull --rebase upstream"
alias urum="git pull --rebase upstream master"

## installation and environment management
### brew
alias bi="brew install"
alias bl="brew list"
alias br="git branch --remotes"
alias bs="brew search"
### conda
alias ca="conda activate"
alias cda="conda deactivate"
alias ce="conda env"
alias cec="conda env create -yc conda-forge -n"
alias cee="conda env export > environment.yaml"
alias cel="conda env list"
alias cer="conda env remove"
alias cern="conda env remove -n"
alias cerp="conda env remove -p"
alias ceu="conda env update"
alias ci="conda install -yc conda-forge"
alias ciz="conda init zsh"
alias cl="conda list"
alias cr="conda remove"
alias cu="conda update"

## edit file(s)
### fasd
#### fc is a built-in command that is used by fzf ctrl-r
alias fn="fasd -fe 'nvim +file'"
alias fo="fasd -fe open"
alias fp="fasd -fe pycharm"
alias fu="fasd -fe 'nvim -u ~/.SpaceVim/init.vim'"
alias fv="fasd -fe '$EDITOR'" # relies on EDITOR variable from line 121
### jupyter notebooks
alias jl="func() { local ipynb; ipynb=$(echo '$(fdfind --type f --extension ipynb ^ $@ | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && jupyter lab $(echo '$ipynb'); }; func";
alias jn="func() { local ipynb; ipynb=$(echo '$(fdfind --type f --extension ipynb ^ $@ | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && jupyter notebook $(echo '$ipynb'); }; func";
### neovim
alias n="nvim +file"
alias nd="func() { n $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias ne="func() { local files; files=$(echo '$(n -u NONE -es "+pu =v:oldfiles" +%p +q! | fzf --delimiter=/ --with-nth=3..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim +file $(echo '$@') --; }; func";
alias nf="func() { local files; files=$(echo '$(fdfind --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim +file $(echo '$@') --; }; func";
alias ng="func() { local file; file=$(echo '$(rg -l $@ | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim +file +$(echo '$(rg -n $@ $file | head -n 1 | cut -d: -f1)') --; }; func";
alias nh="n -c History" # this only works with -c, not --cmd
alias nl="func() { local files; files=$(echo '$(rg -l $@ | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim +file --; }; func";
alias nn="func() { local files; files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=3..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim +file $(echo '$@') --; }; func";
alias no="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias np="func() { local files; files=$(echo '$(fdfind -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 nvim +file --; }; func";
alias nr="func() { local files; files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=3..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim +file $(echo '$@') --; }; func";
alias ns="func() { n -S $(echo '~/.config/nvim/session/$1.vim'); }; func";
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim +file ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias nu="n -u ~/.SpaceVim/init.vim"
alias nw="func() { local files; files=$(echo '$(fdfind -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0 -n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 nvim +file --; }; func";
### pycharm
alias pc="pycharm"
alias pd="pycharm diff"
alias pm="pycharm merge"
alias pp="func() { local files; files=$(echo '$(fdfind -e js --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 pycharm; }; func";
alias py="python"
## vim
alias v="$EDITOR"
alias vd="func() { v $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias ve="func() { local files; files=$(echo '$(v -es --noplugin -u ~/.vimrc "+set nonumber" "+pu =v:oldfiles" +%p +q! | sed /^.$/d | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=3..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vf="func() { local files; files=$(echo '$(fdfind --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vfh="func() { local files; files=$(echo '$(fdfind --type f --hidden ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vg="func() { local file; file=$(echo '$(rg -l $@ | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR +$(echo '$(rg -n $@ $file | head -n 1 | cut -d: -f1)') --; }; func";
alias vh="v -c History" # this only works with -c, not --cmd
alias vl="func() { local files; files=$(echo '$(rg -l $@ | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vo="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias vp="func() { local files; files=$(echo '$(fdfind -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vr="func() { local files; files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=3..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vs="func() { v -S $(echo '~/.vim/session/$1.vim'); }; func";
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias vu="v -u ~/.SpaceVim/vimrc"
alias vv="func() { local files; files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=3..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vw="func() { local files; files=$(echo '$(fdfind -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0 -n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
## webstorm
alias ww="func() { local files; files=$(echo '$(fdfind -e js --type f ^ $@ | fzf --delimiter=/ --with-nth=3..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 webstorm; }; func";

## list files and dirs
### exa
alias e="exa --all --classify --color=always"
### fasd
#### use fasd builtin f alias: alias f='fasd -f'
alias fl='fasd -fl'
### ls
alias la="ls -a"
alias lah="ls -ah"
alias lal="ls -al"
#### use fasd builtin z alias: alias z='fasd -d'

## grep
alias g="grep --color=always --exclude-dir={.git,.idea,.vscode}"
alias gi="grep -i --color=always --exclude-dir={.git,.idea,.vscode}"
alias gir="grep -ir --color=always --exclude-dir={.git,.idea,.vscode}"
alias gr="grep -r --color=always --exclude-dir={.git,.idea,.vscode}"

## jump through the filesystem
alias 0="directory=$(echo '$(dirs -v | cut -c5- | sed s+~+$HOME+ | fzf --delimiter=/ --preview="exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --with-nth=3..)') && cd $(echo '$directory')"
alias j="func() { local directory; directory=$(echo '$(fdfind --type d ^ $@ | fzf --no-multi --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && cd $(echo '$directory'); }; func"
alias jj="func() { local directory; directory=$(echo '$(fasd -Rdl | fzf --delimiter=/ --no-multi --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)" --with-nth=4..)') && cd $(echo '$directory'); }; func"
alias k="func() { ntimes=$(echo '$(printf "%$@s")') && cd $(echo '${ntimes// /../}'); }; func"

## make directory
alias m="func() { mkdir -p $(echo '$1') && cd $(echo '$1'); }; func";

## open
alias o="open"
### files
alias of="func() { local files; files=$(echo '$(fdfind --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias oh="func() { local files; files=$(echo '$(fdfind -e html --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias op="func() { local files; files=$(echo '$(fdfind -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias or="func() { local files; files=$(echo '$(fdfind -e Rproj --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias ow="func() { local files; files=$(echo '$(fdfind -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
### directories
alias od="func() { local directory; directory=$(echo '$(fdfind --type d ^ $@ | fzf --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && [ $(echo '$directory') ] && echo $(echo '$directory') | tr '\n' '\0' | xargs -0 open; }; func";
### both
alias ee="func() { local both; both=$(echo '$(exa --all --classify --color=always $@ | fzf --ansi --preview="if [[ {} == */ ]]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi")') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open --; }; func"
alias oo="func() { local both; both=$(echo '$(fasd -Ral | fzf --preview="if [[ \"$(fasd -Rdl)\" =~ {} ]]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi")') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open; }; func"

## tmux
alias t="tmux"
alias ta="tmux attach -t"
alias ti="tmux info"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias tn="tmux new -s"
alias ts="tmux switch -t"
alias tt="tmux attach -t $(echo '$(tmux list-sessions | fzf -m --no-sort | cut -d: -f1)')"

## Open dir in ...
#### use z alias from fasd plugin instead of z plugin
alias zc="fasd -de code"
alias zl="fasd -dl" # list all directories
alias zn="fasd -de 'nvim +file'"
alias zo="fasd -de open"
alias zp="fasd -de pycharm"
alias zu="fasd -de 'vim -u ~/.SpaceVim/vimrc'"
alias zv="fasd -de '$EDITOR'"
#### use fasd builtin zz alias

## Misc
### remove spaces from names
alias fixnames="for f in *\ *; do mv '$f' '${f// /-}'; done;"
### if then else
alias it="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func";
alias ite="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func";
alias itee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func";
## map
alias map="func() { for i in $(echo '${@:2}'); do; $(echo '$1 $i'); done; }; func";
## alias r="ranger"
## alias rr="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=\"$2\"'))\"; }; func";
alias rot13="func() { tr 'A-Za-z' 'N-ZA-Mn-za-m' < $(echo '$1') > temp.txt && mv temp.txt $(echo '$1'); }; func";
alias sb="source ~/.bashrc"

# brew installed python
# export PATH=/usr/local/bin/python3:$PATH
# miniconda python
export PATH=$HOME/miniconda/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
export FZF_DEFAULT_OPTS="--bind=change:top,alt-p:toggle-preview,alt-w:toggle-preview-wrap --cycle --exit-0 --inline-info --multi --no-height --no-sort --preview='bat --style=numbers --color=always {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always' --preview-window='70%:hidden' --reverse --tiebreak=index"
export FZF_CTRL_T_OPTS="--select-1"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap"
export FZF_ALT_C_OPTS="--no-multi --preview 'exa --all --classify --color=always -L=2 -T {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always' --select-1"
# Directly executing the command (CTRL-X CTRL-R)
# bind "$(bind -s | grep '^"\\C-r"' | sed 's/"/"\\C-x/' | sed 's/"$/\\C-m"/')"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/marskar/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/marskar/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/marskar/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/marskar/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

