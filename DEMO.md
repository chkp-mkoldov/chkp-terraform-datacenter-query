```powershell
# work folder
cd terraform

# initial state
../scripts/step1.ps1

Set-Alias tf C:\Users\mkoldov\AppData\Local\Microsoft\WinGet\Links\terraform.exe 
tf init -upgrade

# made all changes
tf apply -auto-approve
# commit (publish) changes to db to make them visible to all users
tf apply -auto-approve -var publish=true
# make policy applied to enforcement gateway
tf apply -auto-approve -var install=true


# jump to step2
../scripts/step2.ps1


# made all changes
tf apply -auto-approve
# commit (publish) changes to db to make them visible to all users
tf apply -auto-approve -var publish=true
# make policy applied to enforcement gateway
tf apply -auto-approve -var install=true

```