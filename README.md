## Installation steps

1) Login to you organization and Enable Dev Hub.

2) Execute the following commands in command line:

```bash

sfdx force:org:create -s -f config/project-scratch-def.json -a OnBoardingScratchOrg 

sfdx force:user:permset:assign -n EmployeeDashboard -u OnBoardingScratchOrg
sfdx force:user:permset:assign -n FinanceDashboard -u OnBoardingScratchOrg

sfdx force:data:tree:import -f data/Employee__c.json -u OnBoardingScratchOrg

sfdx force:org:open
```
