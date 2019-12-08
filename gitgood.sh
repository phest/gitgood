
# load git completion for ps1
source "${HOME}/gitgood/git-prompt.sh"
# GIT_PS1_SHOWDIRTYSTATE=true # too slow

# shortcuts

alias git_cheat="'${HOME}/gitgood/gitcheat.sh'"

display_command_called () {
    echo -e "\e[33m$@\e[0m"
}

call_git_shortcut () {
    display_command_called "$@"
    eval "$@"
}

git_discard_all () {
    call_git_shortcut "git reset --hard" "$@"
}
git_discard_file () {
    call_git_shortcut "git checkout --" "$@"
}
git_uncommit_last () {
    call_git_shortcut "git reset HEAD~" "$@"
}
git_amend () {
    call_git_shortcut "git commit --amend" "$@"
}
git_commit () {
    call_git_shortcut "git commit -m \"$1\""
}
git_clean () {
    call_git_shortcut "git clean -f -d" "$@"
}
git_status () {
    call_git_shortcut "git status" $@
}
git_diff () {
    call_git_shortcut "git status -v -v" $@
}
git_log () {
    call_git_shortcut "git log --graph --oneline -U0 --submodule | grep -E '^[*| /\\]+([0-9a-f]{7} |Submodule |> |$)'" "$@"
}

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
            if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
                : # This is a valid git repository (but the current working
                    # directory may not be the top level.
                    # Check the output of the git rev-parse command if you care)
                display_command_called 'git status'
                git status
            else
                : # this is not a git repository
                display_command_called 'ls'
                ls
            fi
        fi
    fi
    prev_history_output=$history_output
}
PROMPT_COMMAND=prompt_command

# use git-prompt to display current branch
export PS1="\n${bakwht} ${txtwht} ${undwht}\w${txtylw}\$(__git_ps1)${txtblk} ${txtrst}\n"
