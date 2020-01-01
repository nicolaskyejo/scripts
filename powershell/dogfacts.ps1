# IE first run problem --> https://stackoverflow.com/a/58465946
# Copied and edited from https://old.reddit.com/r/PowerShell/comments/6550a7/using_powershell_for_office_pranks/


Add-Type -AssemblyName System.Speech
$SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
$DogFact = (ConvertFrom-Json (Invoke-WebRequest -Uri 'https://dog-api.kinduff.com/api/facts')).facts
$SpeechSynth.Speak($DogFact)
