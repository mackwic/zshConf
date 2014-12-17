source ~/.vars # need to be at both start and end

[ -d ~/.antigen.git ] || {
    git clone https://github.com/zsh-users/antigen.git .antigen.git
}
source ~/.antigen.git/antigen.zsh

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS=true

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
bower
bundler
coffee
dirpersist
extract
fasd
gem
git
git-extras
git-remote-branch
gitignore
gnu-utils
history-substring-search
mosh
npm
nvm
nyan
rake-fast
rake
rbenv
terminalapp
zsh-users/zsh-syntax-highlighting
# nicoulaj's moar completion files for zsh
zsh-users/zsh-completions src
EOBUNDLES

antigen theme jonathan
antigen apply

#### Options
#
# -1- Moving around
setopt autocd
setopt autopushd
setopt cdablevars
setopt chase_links # true paths
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home # `pushd` == `cd`
#
# -2- Completion
setopt always_to_end # completion makes the cursor move to end of word
setopt auto_list # ambiguity ? list immediately the choices
setopt auto_menu
setopt auto_param_keys # smart removing of automatic separators
setopt auto_param_slash # auto add slash at end of directory names
setopt complete_aliases # I want my aliases in the shell
setopt hash_list_all
setopt list_beep # beep/flash on ambiguity
setopt glob_complete
setopt list_packed 
setopt list_rows_first # I prefer sorting by rows
setopt list_types # identify what's in the completion
setopt rec_exact # priorize exac matches in completion
#
# -3- Expansion and globbing
setopt bad_pattern # alert if glob/pattern is badly formated
setopt glob_subst # I want completions even with glob patterns
setopt mark_dirs # append / to dir names
setopt nomatch # print an error if nothing matches
setopt numeric_glob_sort # when matching numeric filenames, 2 < 20
#
# -4- History
HISTFILE=~/.zhistory
HISTSIZE=2000000
SAVEHIST=1000000
setopt append_history
setopt bang_hist # perform `!` expansion
setopt hist_beep # beep/flash when cmd wasn't in history (^R)
setopt hist_expire_dups_first # when trimming hisfile, remove dups first
setopt HIST_FCNTL_LOCK # fs locking performance
setopt hist_find_nodups # ^R doesn't  print duplicates
setopt share_history
#
# -5- Initialization
unsetopt global_rcs # don't try to read system-shit. My conf is enough
#
# -6- Input/Output
setopt correct # correct 'gut' to 'git'
setopt ignore_eof # type 'exit' or 'logout' to quit, not ^D
setopt hash_cmds # speed yeah
setopt print_exit_value
#
# -7- Jobs control
setopt check_jobs # alert if quittig with suspended jobs
setopt long_list_jobs # like `ls -l` but for jobs
#
# -8- ZLE (Zsh Line Editor)
setopt beep # beep/flash on error

autoload -U complinit
complinit
# tab completion for both ends
setopt completeinword
# better completion for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
# superglobs
setopt extendedglob
unsetopt caseglob

source ~/.vars
export PATH="./node_modules/.bin:/usr/local/heroku/bin:$PATH"

for f in ~/.aliases.d/*.sh
do
    source $f
done

# OPAM configuration
. /Users/thomas/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
