Set-ExecutionPolicy Unrestricted -Scope Process

write-host "Importing and install Windows updates"
Install-Module PSWindowsUpdate

Import-Module PSWindowsUpdate
Install-WindowsUpdate -AcceptAll

write-host "Installing chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey -y

write-host "*** Initial app install for core tools and packages. ***"

write-host "*** Configuring chocolatey ***"
choco feature enable -n allowGlobalConfirmation

write-host "*** Beginning install, go grab a coffee. ***"
choco upgrade wsl2 python git vscode openssh openvpn netcat nmap wireshark burp-suite-free-edition heidisql sysinternals putty golang neo4j-community openjdk

write-host "*** Build complete, restoring GlobalConfirmation policy. ***"
choco feature disable -n allowGlobalConfirmation