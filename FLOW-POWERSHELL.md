## Demo flow in PowerShell

*Hint: define Shift-Enter as "Run selected text in active terminal" in VScode*

```powershell
# map TF
Set-Alias tf C:\Users\mkoldov\AppData\Local\Microsoft\WinGet\Links\terraform.exe
Set-Alias terraform C:\Users\mkoldov\AppData\Local\Microsoft\WinGet\Links\terraform.exe

# enter correct folder
cd terraform
# check inputs
cat terraform.tfvars
code terraform.tfvars
# it covers:
#   - credentials to speck to Check Point API
#   - credentials for Azure Reader - to obtain inventory by CloudGuard Controller
#   - credentials for Kubernetes reader SA - to obtain inventory by CloudGuard Controller

tf init -upgrade

# made all changes
tf apply -auto-approve
# commit (publish) changes to db to make them visible to all users
tf apply -auto-approve -var publish=true
# make policy applied to enforcement gateway
tf apply -auto-approve -var install=true

# sessions and rule base
ssh cp mgmt_cli -r true show sessions details-level "full"
ssh cp mgmt_cli -r true show access-layers
ssh cp mgmt_cli -r true show access-layer uid "a10561ce-7146-4f9a-810f-e68fbf875b2c"
# https://sc1.checkpoint.com/documents/latest/APIs/#cli/show-access-rulebase~v1.9%20
ssh cp mgmt_cli -r true show  access-rulebase uid "02d8a4f9-37d0-42af-995e-1d39233ea011" details-level "standard" use-object-dictionary true  --format json
```