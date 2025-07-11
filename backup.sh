#!/usr/bin/env bash
if grep -q $'\r' "$0"; then
    # Script has CRLF, try to fix it
    if command -v dos2unix &>/dev/null; then
        dos2unix "$0"
    elif [[ "$(uname)" == "Darwin" ]] && command -v gsed &>/dev/null; then
        gsed -i 's/\r$//' "$0" # Use gsed on macOS if available
    elif [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' 's/\r$//' "$0" # Use BSD sed on macOS
    else
        sed -i 's/\r$//' "$0" # Use GNU sed on Linux
    fi
    # Re-execute the script with the corrected line endings
    exec bash "$0" "$@"
fi
# Made By M3TOZZ
	clear
	echo -e "\033[0;31mBacking Up...\033[1;36m"
	mkdir -p Backup-$(date +%Y-%m-%d-%H:%M:%S)	
	cp -r ~/.config/fastfetch Backup-$(date +%Y-%m-%d-%H:%M:%S)
	clear
	echo -e "\033[31m Backed Up!\033[0m"
	cd Backup-$(date +%Y-%m-%d-%H:%M:%S)
	pwd
	cd ..
