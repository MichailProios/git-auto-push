$Date = Get-Date -Format "dddd MM/dd/yyyy HH:mm"

Get-ChildItem -Path ‘C:\Users\Michael Proios\Desktop\Scripts’ -Depth 0 -Recurse -Directory |

ForEach-Object {

    Write-Output "Pushing $_ to Bitbucket"

    $path = $_.FullName  
  
    CD $path   

    if(Test-Path -Path $path\.git){
        
        git status
    
        git add --all 2>$null
    
        git commit -m "System Automated Commit for $Date" 2>$null 

        git push origin master --force 2>$null 

    }
    else{           
               
        $output = (git ls-remote https://mproios:Maxim123@bitbucket.org/maximgrp/$_.git 2>&1)          
        
        if($output -like '*The requested repository either does not exist or you do not have access*'){
            Write-Output "Remote repository does not exist for $_"     
            continue        
        }                 
            
        git init

        git remote add origin https://mproios:Maxim123@bitbucket.org/maximgrp/$_.git 2>$null 

        git status

        git add --all 2>$null 

        git commit -m "Initial System Automated Commit for $Date" 2>$null
 
        git push origin master --force 2>$null           
    }	      
} 