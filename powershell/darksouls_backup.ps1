#TODO
# Replace hardcoded paths


# Hard coded paths
$darksouls_remastered = "$HOME\Documents\NBGI\DARK SOULS REMASTERED\94216872\"
$darksouls_ptde = "$HOME\Documents\NBGI\DarkSouls\BabuSeya\"
$darksouls_sofs = "$Env:AppData\DarkSoulsII\01100001059da2a8\"
$darksouls_3 = "$Env:AppData\DarkSoulsIII\01100001059da2a8\"
$file_pattern = @("DRAKS0005.sl2", "draks0005.sl2", "DS2SOFS0000.sl2", "DS30000.sl2")

$limit = 10  # number of backup files
$interval = 10  # time in minutes


Function backup ($path, $choice)
{
    $i = 1
    $file = $file_pattern[$choice-1]
    New-Item $path\..\backup -ItemType Directory -ea 0  # redirect error to null

    while($true) {
        cp $path\$file $path\..\backup\$file.bak$i
        Write-Output "Backup $i done at $(Get-date -Format HH:mm)..."
        $i++
        if ($i -eq $limit+1){
            $i = 1
        }
        Start-Sleep -Seconds ($interval * 60)
    }    
}


$MenuItems = (
    '1. Backup Dark Souls: Remastered edition',
    '2. Backup Dark Souls: Prepare to Die edition',
    '3. Backup Dark Souls 2: Scholar of The First Sin',
    '4. Backup Dark Souls 3'
    )
$ValidChoices = $MenuItems | ForEach-Object {$_[0]}

$Choice = ''
while ($Choice -notin $ValidChoices)
    {
    Clear-Host
    $MenuItems
    Write-Output ''
    $Choice = (Read-Host "Enter which game to backup [number]")
    }

Write-Output ''
$Action = ''
switch ($Choice)
    {
        '1'
                {
                    $Action = '1';
                    $path = $darksouls_remastered 
                    Write-Host "Backing up DKS Remastered."
                    Break
                } 
        '2'
                {
                    $Action = '2';
                    $path = $darksouls_ptde
                    Write-Host "Backing up DKS PTDE."
                    Break
                } 
        '3'
                {
                    $Action = '3';
                    $path = $darksouls_sofs
                    Write-Host "Backing up DKS 2 SOFS."
                    Break
                } 
        '4'
                {
                    $Action = '4';
                    $path = $darksouls_3
                    Write-Host "Backing up DKS 3."      
                    Break
                } 
    }

backup $path $Action