The following Powershell script will enable you to delete all blobs from an Azure storage account.

First, run the code below to install Az to run the commands.

```
Install-Module -Name Az -Scope CurrentUser
```

Begin by setting variables:

```
[string]$myConnectionString = "Your-storage-account-connection-string"
[string]$ContainerName = "your-container-name"
[int]$blobCountAfter = 0
[int]$blobCountBefore = 0
```

Then create a context:

```
$context = New-AzStorageContext -ConnectionString $myConnectionString
```

Save the number of blobs before deletion and print the output:

```
$blobCountBefore = (Get-AzStorageBlob -Container $ContainerName -Context $context).Count
Write-Host "Total number of blobs in the container Before deletion: $blobCountBefore" -ForegroundColor Yellow
```

Set a loop to delete the blobs:

```
Get-AzStorageBlob -Container $ContainerName -Context $context | ForEach-Object {
    $_ | Remove-AzStorageBlob
}
```

Save the number of blobs after deletion and print the output:

```
$blobCountAfter = (Get-AzStorageBlob -Container $ContainerName -Context $context).Count
Write-Host "Total number of blobs in the container After deletion : $blobCountAfter" -ForegroundColor Green
```