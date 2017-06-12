
# load git completion for ps1
source "${HOME}/gitgood/git-prompt.sh"
# GIT_PS1_SHOWDIRTYSTATE=true # too slow

# shortcuts

alias git_cheat="${HOME}/gitgood/gitcheat.sh"

alias git_discard="git reset --hard"
alias git_uncommit_last="git reset HEAD~"
alias git_amend="git commit --amend"
alias git_commit="git commit -m"
alias git_clean="git clean -f -d"

# this is meant to display the git status when user only presses enter on shell
# one way I could find to do this so far is to use output from history and compare it
# with previous output. if it's changed, then user entered something. if it didn't change,
# then user pressed nothing, and we run git status.
# possible alternative way: https://stackoverflow.com/questions/27384748/detect-empty-command
prompt_command () {
    history_output="$(history 10)"
    # if prev_fc_output is set, compare outputs
    if [ "$prev_history_output" != "" ]; then
        # if outputs are the same, nothing was entered
        if [ "$history_output" == "$prev_history_output" ]; then
            echo 'git status'
            echo ''
            git status
        fi
    fi
    prev_history_output=$history_output
}
PROMPT_COMMAND=prompt_command

# use git-prompt to display current branch
export PS1="\n${bakwht} ${txtwht} ${undwht}\w${txtylw}\$(__git_ps1)${txtblk} ${txtrst}\n"