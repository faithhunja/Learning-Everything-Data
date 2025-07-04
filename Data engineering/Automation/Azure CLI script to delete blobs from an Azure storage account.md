### Deleting blobs from an Azure storage account using Azure CLI

First, start by setting the necessary variables.

```
$connection_string="Your-storage-account-connection-string"
$container_name="your-container-name"
```

You can list the containers in the storage account using the following command:

```
az storage container list --connection-string $connection_string
```

This gives a lot of information, most of which may be unnecessary. Azure CLI uses the `--query` parameter to execute a JMESPath query on the results of commands. JMESPath is a query language for JSON, giving you the ability to select and modify data from CLI output. 

To extract the container name from the JSON array output, run the following command:

```
az storage container list --connection-string $connection_string --query "[].name"
```

You can list the blobs in the container using the following command:

```
az storage blob list --connection-string $connection_string --container-name $container_name
```

To extract the blob name from the JSON array output, run the following command:

```
az storage blob list --connection-string $connection_string --container-name $container_name --query "[].name"
```

Next, set variables to save the number of blobs before deletion, then print it out. 

`ConvertFrom-Json` converts a JSON string into a PowerShell object, which in this case is an array. `.Count` returns the number of items in the array. 

```
$container_items_before = az storage blob list --connection-string $connection_string --container-name $container_name | ConvertFrom-Json
$blobs_before = $container_items_before.Count
Write-output "Total number of blobs = $blobs_before"
```

Do the same for the number of blobs after deletion:

```
$container_items_after = az storage blob list --connection-string $connection_string --container-name $container_name | ConvertFrom-Json
$blobs_after = $container_items_after.Count
Write-output "Total number of blobs = $blobs_after"
```

Finally, there are various options to delete blobs. You can delete a blob by its name:

```
az storage blob delete --connection-string $connection_string --container-name $container_name -n "Your-blob-name"
```

You can also delete a blob by its prefix.

`--pattern` is used for string matching. `*` represents a wild card character. 

```
az storage blob delete-batch --connection-string $connection_string --source $container_name --pattern "Your*"
```

You can delete a blob by its suffix:

```
az storage blob delete-batch --connection-string $connection_string --source $container_name --pattern "*name"
```

You can delete a blob using a matching character in the blob name:

```
az storage blob delete-batch --connection-string $connection_string --source $container_name --pattern "*b*"
```

You can delete all blobs using the following command:

```
az storage blob delete-batch --connection-string $connection_string --source $container_name --pattern "*"
```