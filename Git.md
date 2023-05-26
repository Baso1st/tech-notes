#### General
- git status
- git diff
- git branch
- git pull
- git push
- git add *
- git commit -m "message"
- To Fix a commit message ```git commit --amend -m "New commit message"``` 
-----------------------
#### Stashing
- git stash 
- git stash branch <branchName>
- git stash pop
- git stash pop "stash@{1}"
- More helpful stash commands can be found here https://stackoverflow.com/a/10726185/2616000
--------------------------------
#### Connect to a new origin

- git remote -v
- git remote set-url origin "*new-url*"

---------------------
#### Merge dev into another branch
```  
git checkout dev 
git pull 
git checkout branch-x
git rebase develop
```  
Or, when on branch-x:

```git fetch && git rebase origin/develop```

-------------------------------------
#### Auth Changes
- To change git user name and email on one repo or globally checkout this link https://stackoverflow.com/a/36782014/2616000
-------------------------------------
#### Reset
- git reset --hard "undo uncommitted changes"
- git checkout 
- git checkout -b 
- git clone
- To see all local branches  ```git branch```
- To see all remote branches ```git branch -r```
--------------
#### To cancel/revert commited change
- Run ```git log --oneline``` to see the commit history
- Run ```git reset --hard <CommitIdForCommitYouWantToBeAt>``` to cancel everything after the specified commit id. 
- Run ```git reset --soft <CommitIdForLastCommitYouWantToRemove>``` everything before this and including it will be canceled, up until the one above. 
- Nice StackOverflow Link https://stackoverflow.com/questions/1463340/how-can-i-revert-multiple-git-commits  
#### To cancel locally commited changes
- Run ```git reset --soft HEAD~1``` to take the commited changes back to staging
- Run ```git reset HEAD~1``` to take the commited changes back to show up as changes in your file that you commit or discard.
