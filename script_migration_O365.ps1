#----------------------------------------Connexion Office 365-------------------------------------------------------

$LiveCred = Get-Credential
#Dans la fenêtre Demande d’informations d’identification Windows PowerShell,
#tapez les informations d’identification d’un compte de votre organisation basée sur un nuage.
#Cliquez ensuite sur OK.

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
#Le paramètre AllowRedirection permet aux organisations basées sur un nuage
#des centres de données du monde entier de connecter Windows PowerShell au service
#basé sur un nuage à l’aide de la même URL. 

Import-PSSession $Session
#Les commandes utilisées dans le service basé sur un nuage sont importées dans la session côté client
#de votre ordinateur local, comme indiqué par une barre de progression.
#Lorsque ce processus est terminé, vous pouvez exécuter ces commandes.

#----------------------------------------Création ID Office 365 + Mail-----------------------------------------------------

#Création Automatique
Connect-MsolService
$userlist = Import-Csv -Path C:\compte_utilisateurs.csv -UseCulture ;
$userlist | Foreach-Object {
$pwd = ConvertTo-SecureString $_.NewPassword -AsPlainText -Force
Set-MsolUserPassword -UserPrincipalName $_.UserPrincipalName -ForceChangePassword $false -NewPassword $pwd } | Export-Csv -Path C:\compteutilisateurs_resulte -NoTypeInformation -UseCulture ;
