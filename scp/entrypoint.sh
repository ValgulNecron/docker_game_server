#!/usr/bin/expect -f

# Run LocalAdmin with automated prompts
spawn /home/steam/scp/LocalAdmin 7777

# Automate the interactive prompts
expect "Do you accept the EULA? [yes/no]" { send "yes\r" }
expect "Do you want to edit that configuration? [edit/keep]:" { send "keep\r" }
expect "Do you want to save the configuration only for THIS server (on port 7777 or should it become a GLOBAL configuration (default one for all future servers - servers not configured yet)? [this/global]:" { send "global\r" }

# Keep the interactive session alive
interact
