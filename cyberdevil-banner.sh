
#!/data/data/com.termux/files/usr/bin/bash

figlet "CYBERDEVIL"

links=(
    "https://whatsapp.com/channel/0029Vaw3SXOFSAsyp8Ampv1V"
    "https://t.me/+piF-v2pXs102MzU1"
    "https://ig.me/j/AbYsExv-rWd-R_F7/"
    "https://youtube.com/@cybersecurity2025?si=WTxpRt2nCeOI1S0R"
)

for link in "${links[@]}"; do
    termux-open-url "$link"
    read -p "Please join and continue... "
done

echo "Thank you for joining CYBERDEVIL"







#!/bin/bash




# Colors
CYAN="\e[1;36m"
NC="\e[0m"

# Install figlet if not already
pkg install figlet -y > /dev/null

# Clear screen
clear

# Print banner
echo -e "${CYAN}"
figlet "BANNERS"
figlet "MAKER TOOL"
echo -e "${NC}"

# Done
echo -e "   ${CYAN}Welcome to the 𝐂𝐘𝐁𝐄𝐑𝐃𝐄𝐕𝐈𝐋 BANNER MAKER tool!${NC}"









# Colors
GREEN="\e[1;32m"
RED="\e[1;31m"
NC="\e[0m"

# Install dependencies
apt-get update -y > /dev/null
apt-get install figlet toilet python -y > /dev/null
pip install pyfiglet > /dev/null

# Create pyfiglet wrapper if not exists
if [ ! -f "$PREFIX/bin/pybanner" ]; then
cat << EOF > $PREFIX/bin/pybanner
#!/usr/bin/env python
from pyfiglet import Figlet
import sys
f = Figlet(font='slant')
print(f.renderText(sys.argv[1]))
EOF
chmod +x $PREFIX/bin/pybanner
fi

# Function to create banner
create_banner() {
    clear
    echo -e "${GREEN}𝐄𝐍𝐓𝐄𝐑 𝐘𝐎𝐔𝐑 𝐍𝐀𝐌𝐄 𝐓𝐎 𝐌𝐀𝐊𝐄 𝐁𝐀𝐍𝐍𝐄𝐑:${NC}"
    read username

    echo -e "\n${GREEN}Choose banner style:${NC}"
    echo "1. figlet"
    echo "2. toilet"
    echo "3. pyfiglet"
    echo "4. Mixed (all three)"
    read -p "Enter 1-4: " style

    case $style in
        1)
            echo "figlet '$username'" > ~/.ascii_banner
            ;;
        2)
            echo "toilet -f mono12 -F metal '$username'" > ~/.ascii_banner
            ;;
        3)
            echo "pybanner '$username'" > ~/.ascii_banner
            ;;
        4)
            echo "figlet '$username'" > ~/.ascii_banner
            echo "toilet -f mono12 -F metal '$username'" >> ~/.ascii_banner
            echo "pybanner '$username'" >> ~/.ascii_banner
            ;;
        *)
            echo "figlet '$username'" > ~/.ascii_banner
            ;;
    esac

    # Add to bashrc if not already added
    if ! grep -q "source ~/.ascii_banner" ~/.bashrc; then
        echo -e "\n# Custom ASCII Banner" >> ~/.bashrc
        echo "source ~/.ascii_banner" >> ~/.bashrc
    fi

    # Disable welcome message
    touch ~/.hushlogin

    clear
    source ~/.ascii_banner
    echo -e "${GREEN}\nBanner set successfully and will appear every time you open Termux.${NC}"
}

# Function to remove banner
remove_banner() {
    sed -i '/source ~\/.ascii_banner/d' ~/.bashrc
    rm -f ~/.ascii_banner
    rm -f ~/.hushlogin
    rm -f $PREFIX/bin/pybanner
    echo -e "${RED}Banner removed. Restart Termux to see changes.${NC}"
}

# Main menu
clear
echo -e "${GREEN}𝐓𝐄𝐑𝐌𝐔𝐗 𝐁𝐀𝐍𝐍𝐄𝐑 𝐓𝐎𝐎𝐋${NC}"
echo "1. Create or Change Banner"
echo "2. Remove Banner"
echo "3. Exit"
read -p "Choose an option: " option

case $option in
    1) create_banner ;;
    2) remove_banner ;;
    3) echo "Exiting..." ;;
    *) echo -e "${RED}Invalid option!${NC}" ;;
esac