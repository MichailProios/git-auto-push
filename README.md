# git-auto-push

This powershell script automatically pushes your scirpts to the desired git repository

For the script to work, do the following.
1) Have git installed on the computer where the script will run from, https://git-scm.com/downloads
2) Create a local repository in the folder of your script with git init
3) Create the equivalent repository in the remote git repository
4) Run git remote add origin https://username:password@remoterepo.com/yourrepo.git and change the link based on your own credentials and repository information
5) Specify the folder where your scripts are located in the powershell script betweeen the quotes after the -Path parameter
6) Run the script from a scheduler or manually. Make sure to specify powershell -ExecutionPolicy Bypass -File git-auto-push.ps1 whenever you execute the script
