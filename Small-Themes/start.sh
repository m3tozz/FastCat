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
loader ()
{
printf "\033[0m
FastCat - FastFetch Theme Pack!
[#####               ] 25%%  completed.\r"
sleep 0.3
clear
printf "
FastCat - FastFetch Theme Pack!
[###############     ] 75%%  completed.\r"
sleep 0.2
clear
printf "
FastCat - FastFetch Theme Pack!
[####################] 100%%  completed.\r"
sleep 0.2
}

# Theme directory mapping
THEMES=(
    [1]="MetoSpace" [2]="Fast-Snail" [3]="Cat" [4]="Minimal"
    [5]="Arch" [6]="Blocks" [7]="Cocktail" [8]="Palm"
    [9]="Sheriff" [10]="Bunny" [11]="Coffee" [12]="Duck"
    [13]="OWL" [14]="Giraffe" [15]="Robo-Dog" [16]="Tie-Fighter"
)

# Preview a theme without applying it
preview_theme() {
    local theme_dir="$1"
    local tmp_dir
    tmp_dir=$(mktemp -d)

    cp -r "$theme_dir/fastfetch/"* "$tmp_dir/"

    local config="$tmp_dir/config.jsonc"

    # Fix logo source paths to use temp directory
    if [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' "s|~/.config/fastfetch/|$tmp_dir/|g" "$config"
        sed -i '' "s|\\\$HOME/.config/fastfetch/|$tmp_dir/|g" "$config"
    else
        sed -i "s|~/.config/fastfetch/|$tmp_dir/|g" "$config"
        sed -i "s|\\\$HOME/.config/fastfetch/|$tmp_dir/|g" "$config"
    fi

    # Fix relative image paths (for visual themes)
    for img in "$tmp_dir"/*.png "$tmp_dir"/*.jpg "$tmp_dir"/*.jpeg; do
        [[ -f "$img" ]] || continue
        local imgname
        imgname=$(basename "$img")
        if [[ "$(uname)" == "Darwin" ]]; then
            sed -i '' "s|\"source\": \"$imgname\"|\"source\": \"$tmp_dir/$imgname\"|g" "$config"
        else
            sed -i "s|\"source\": \"$imgname\"|\"source\": \"$tmp_dir/$imgname\"|g" "$config"
        fi
    done

    clear
    echo -e "\033[1;33m--- Preview Mode (not applied) ---\033[0m"
    fastfetch --config "$config"
    echo -e "\n\033[1;33m--- End of Preview ---\033[0m"
    echo -e "\033[0;36mPress any key to return to menu...\033[0m"
    read -r -n1

    rm -rf "$tmp_dir"
}

clear
banner(){
echo -e '\033[0;36m
\033[0;31m______        _   _____       _   
\033[0;33m|  ___|      | | /  __ \     | |  
\033[0;34m| |_ __ _ ___| |_| /  \/ __ _| |_ 
\033[0;35m|  _/ _` / __| __| |    / _` | __|\033[0;31mSmall-Themes
\033[0;36m| || (_| \__ \ |_| \__/\ (_| | |_ 
\033[0;31m\_| \__,_|___/\__|\____/\__,_|\__|                 
\e[1;34m[01]\e[0;32mMetoSpace \e[1;35m[02]\e[0;32mFast-Snail \e[1;36m[03]\e[0;32mCat \e[1;31m[04]\e[0;32mMinimal
\e[1;33m[05]\e[0;32mArch \e[1;36m[06]\e[0;32mBlocks \e[1;34m[07]\e[0;32mCocktail \033[1;33m[08]\e[0;32mPalm \033[0;36m[09]\e[0;32mSheriff 
\e[1;35m[10]\e[0;32mBunny \e[1;34m[11]\e[0;32mCoffee \e[1;35m[12]\e[0;32mDuck \033[1;33m[13]\e[0;32mOWL \e[1;34m[14]\e[0;32mGiraffe
\e[1;36m[15]\e[0;32mRobo-Dog \e[1;34m[16]\e[0;32mTie-Fighter
\033[1;31m[P]\e[0;32mPreview \033[1;31m[x]Exit [00]Menu [D]Default-Theme
'
        echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read islem
}
banner
if [[ $islem == 1 || $islem == 01 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd MetoSpace/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 2 || $islem == 02 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Fast-Snail/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 3 || $islem == 03 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Cat/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 4 || $islem == 04 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Minimal/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 5 || $islem == 05 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Arch/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 6 || $islem == 06 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Blocks/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 7 || $islem == 07 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Cocktail/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 8 || $islem == 08 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Palm/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 9 || $islem == 09 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Sheriff/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 10 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Bunny/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 11 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Coffee/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 12 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Duck/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 13 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd OWL/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 14 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Giraffe/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 15 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Robo-Dog/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 16 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Tie-Fighter/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[  $islem == 00 ]]; then
        sleep 1
        cd ..
        bash ./fastcat.sh -s
elif [[ $islem == D || $islem == d  ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd Default/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == P || $islem == p ]]; then
    echo -e "\033[1;33mEnter theme number to preview:\033[0m"
    echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read preview_num
    # Remove leading zero
    preview_num=$((10#$preview_num))
    if [[ -n "${THEMES[$preview_num]+x}" ]]; then
        preview_theme "${THEMES[$preview_num]}"
    else
        echo -e "\033[1;31mInvalid theme number!\033[0m"
        sleep 1
    fi
    exec bash "$0"
elif [[ $islem == x || $islem == X ]]; then
	clear
echo -e "\033[1;31m GoodBye\033[0m"
	exit 1
else
	echo -e '\033[36;40;1m Wrong transaction number!'	
fi
