- git status
- git diff
- git branch
- git pull
- git push
- git add *
- git commit -m "message"
-----------------------
- git stash 
- git stash branch <branchName>
- git stash pop
- git stash pop "stash@{1}"
- More helpful stash commands can be found here https://stackoverflow.com/a/10726185/2616000
--------------------------------
- git reset --hard "undo uncommitted changes"
- git checkout 
- git checkout -b 
- git clone
- To see all local branches  ```git branch```
- To see all remote branches ```git branch -r```
--------------

Commands to reconnect to a new origin

- git remote -v
- git remote set-url origin "*new-url*"

---------------------
**Merge dev into another branch**:
```  
git checkout dev 
git pull 
git checkout branch-x
git rebase develop
```  
Or, when on branch-x:

```git fetch && git rebase origin/develop```
