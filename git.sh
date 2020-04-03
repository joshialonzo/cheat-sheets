# working directory | working environment
# > staging area | staging environment | staging index
# > local repository > remote repository

# begin a repository
git init

# add a file with changes to staging environment
git add <filename>

# add all files with changes but no deletions
git add .
git add -A

# add all files with changes even deletions
git add --all

# clean or revert the working directory
git checkout <filename>

# clean staging area or saved changes of <filename>
git reset HEAD <filename>

# take out <filename> from staging area but not delete
# useful in order to correct a mistake and ignore a file
git restore --staged <filename>

# rm <filename> && git add <filename>
git rm <filename>

# config your name in current repository
git config --global user.name "<your_name>"

# config your email in current repository
git config --global user.email "<your_email>"

# first step is to initialize (or add) git to our repository
git init

# see a list of changes since the last git commit
git status

# add all changes
git add -A

# make a commit
git commit -m "<commit_message>"

# see all branches
git branch

# go to a specific commit
git checkout <commit_id>

# go to main branch
git checkout master

# naming a branch created from <commit_id>
git branch <new_branch_name> <commit_id>

# create a new branch from the current commit
git branch <new_branch_name>

# bring changes from <other_branch> to current branch
git branch <other_branch>

# change the name of a branch
git branch -m <old_branch_name> <new_branch_name>

# download a repository
git clone <repository>

# download a repository with all branches
git clone --mirror <repository>

# see all branches in a repository
git branch -a

# download a specific branch
git checkout -b <local_branch_name> origin/<remote_branch_name>
git checkout -t origin/<remote_branch_name>

# create a new local branch from an existing local branch
git checkout -b <new_branch_name> <local_branch_name>

# configure as a regular repository
git config --bool core.bare false

# download a specific branch from remote repository
git clone -b <remote_branch_name> <repository>

# start a project from a branch
git clone -b <remote_branch_name> <repository> && cd <new_folder> && rm -rf .git

# Push branch to another branch
git push <remote> <local_branch>:<remote_name>
git push origin josue/ch3634:josue/ch3634

### Feature Branch Flow ###
git checkout master
git checkout -b develop
git checkout -b feature_branch
# work happens on feature branch
git checkout develop
git merge feature_branch
git checkout master
git merge develop
# delete feature branch
git branch -d feature_branch

# Main tutorials
https://www.atlassian.com/git/tutorials

# Rename a local and remote branch in git
https://multiplestates.wordpress.com/2015/02/05/rename-a-local-and-remote-branch-in-git/

# Gitflow workflow
https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow