#!/bin/bash

read -p 'Enter Open edX Release by icarrr (ex:icarrr/open-release/hawthorn.1): ' OPENEDX_RELEASE

if [[ ! $OPENEDX_RELEASE ]]; then
    echo "You must define Open edX release"
    exit
fi

echo "Hello, $(whoami)! Here is the link to install Open edX by icarrr:"
echo "set locales"
echo "export LC_ALL='en_US.UTF-8'"
echo "export LC_CTYPE='en_US.UTF-8'"
echo ""
echo "Bootstrap the Ansible installation:"
echo "wget https://raw.githubusercontent.com/icarrr/openedx-configuration/$OPENEDX_RELEASE/util/install/ansible-bootstrap.sh -O - | sudo -H bash"
echo ""
echo "(Optional) If this is a new installation, randomize the passwords:"
echo "wget https://raw.githubusercontent.com/icarrr/openedx-configuration/$OPENEDX_RELEASE/util/install/generate-passwords.sh -O - | bash"
echo ""
echo "Install Open edX:"
echo "wget https://raw.githubusercontent.com/icarrr/openedx-configuration/$OPENEDX_RELEASE/util/install/native.sh -O - | bash > openedxlog.out &" 
