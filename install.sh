
echo 'git config: no autocrlf'
git config --global core.autocrlf "false"

echo 'git config: adding gitignore_global'
git config --global core.excludesfile "~/gitgood/.gitignore_global"

echo 'git config: diff-so-fancy setup'

# with pattern snap
git config --global core.pager "~/gitgood/diff-so-fancy | less --tabs=4 -RFX --pattern '^(Date|added|deleted|modified): '"

echo 'adding gitgood.sh to ~/.bashrc'
echo 'source ~/gitgood/gitgood.sh' >> ~/.bashrc

# cygwin bonus
alias open=cygstart

echo 'restarting bash'
exec bash

