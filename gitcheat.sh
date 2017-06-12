
read -r -d '' msg <<EOS
STASH:                          git stash       # stashes current changes
                                git stash pop   # applies top stash and deletes it
Note: stashes can be stacked. Look up stash list, apply & drop (& clear).

DISCARD UNCOMMITED CHANGES:     git reset --hard # or git_discard

DELETE UNTRACKED FILES+FOLDERS: git clean -f -d # (-f: force, -d: directories too)

ADD CHANGE TO LAST CMT:         git add . # or add individual files
                                git commit --amend

EDIT MSG OF LAST CMT:           git commit --amend

UNDO LAST CMT:                  git reset HEAD~ # or git_uncommit_last

MOVE LAST CMT TO NEW BRANCH:    git branch new-branch-name
                                git reset HEAD~ --hard
                                git checkout new-branch-name

NEW BRANCH:                     git checkout -b new-branch-name

REMOTE BRANCH CHECKOUT+TRACK:   git checkout -b my-branch origin/my-branch

MERGE BRANCH:                   git merge branch-name
Note: Don't use GitHub Desktop "Update from", it adds a merge commit.
Note: after merge, different histories will be displayed depending on tool:
    - git log will show full history
    - Github may hide commit from merge
    - GitHub desktop may hide commits from branch (most confusing)

DELETE BRANCH:                  git branch -d branch-name
                                git branch -d --force branch-name
Note: will return an error if that branch is checked out.

ADD UPSTREAM TO FORK:           git remote add upstream ORIGINAL_URL

UPDATE FORK:                    git pull upstream master

DIFF BRANCHES:                  git difftool -d otherBranch

DIFF BRANCHES FILE BY FILE:     git difftool branch1..branch2

MORE TIPS:                      http://ohshitgit.com
EOS

echo ""
echo "$msg"
