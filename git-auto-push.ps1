$Date = Get-Date -Format "dddd MM/dd/yyyy HH:mm"

Get-ChildItem -Path ‘C:\Users\Michael Proios\Desktop\Scripts’ -Depth 0 -Recurse -Directory |

ForEach-Object {
    
    Write-Output "Pushing $_ to Bitbucket"
  
    CD $_.FullName  
    
    git add --all 2>$null
    
    git commit -m "System Automated Commit for $Date" 2>$null 

    git push origin master --force 2>$null     
}
