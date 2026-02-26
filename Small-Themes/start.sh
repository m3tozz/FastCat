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

# FastCat data directory
FASTCAT_DATA="$HOME/.config/fastcat"
mkdir -p "$FASTCAT_DATA/backups"

# Auto-backup current fastfetch config before applying a new theme
auto_backup() {
    local src="$HOME/.config/fastfetch"
    if [[ -d "$src" ]] && [[ "$(ls -A "$src" 2>/dev/null)" ]]; then
        local backup_name="$FASTCAT_DATA/backups/Backup-$(date +%Y-%m-%d-%H%M%S)"
        cp -r "$src" "$backup_name"
        echo -e "\033[0;32mBackup saved: $backup_name\033[0m"
        # Keep only the last 5 backups
        local count
        count=$(ls -1d "$FASTCAT_DATA/backups"/Backup-* 2>/dev/null | wc -l)
        if [[ "$count" -gt 5 ]]; then
            ls -1d "$FASTCAT_DATA/backups"/Backup-* | head -n $((count - 5)) | xargs rm -rf
        fi
    fi
}

# Log theme application to history
log_history() {
    local category="$1"
    local theme_name="$2"
    echo "$(date '+%Y-%m-%d %H:%M:%S')|$category|$theme_name" >> "$FASTCAT_DATA/history.log"
    # Keep only last 50 entries
    if [[ -f "$FASTCAT_DATA/history.log" ]]; then
        tail -n 50 "$FASTCAT_DATA/history.log" > "$FASTCAT_DATA/history.log.tmp"
        mv "$FASTCAT_DATA/history.log.tmp" "$FASTCAT_DATA/history.log"
    fi
}

# Toggle favorite
toggle_favorite() {
    local entry="$1"
    if grep -qxF "$entry" "$FASTCAT_DATA/favorites.txt" 2>/dev/null; then
        grep -vxF "$entry" "$FASTCAT_DATA/favorites.txt" > "$FASTCAT_DATA/favorites.txt.tmp"
        mv "$FASTCAT_DATA/favorites.txt.tmp" "$FASTCAT_DATA/favorites.txt"
        echo -e "\033[1;31mRemoved from favorites: $entry\033[0m"
    else
        echo "$entry" >> "$FASTCAT_DATA/favorites.txt"
        echo -e "\033[1;32mAdded to favorites: $entry\033[0m"
    fi
    sleep 1
}

# Show history
show_history() {
    if [[ ! -f "$FASTCAT_DATA/history.log" ]] || [[ ! -s "$FASTCAT_DATA/history.log" ]]; then
        echo -e "\033[1;33mNo history yet.\033[0m"
    else
        echo -e "\033[1;34m--- Theme History (recent) ---\033[0m"
        tac "$FASTCAT_DATA/history.log" | head -20 | while IFS='|' read -r date category name; do
            echo -e "\033[0;36m$date\033[0m  \033[1;33m[$category]\033[0m  $name"
        done
        echo -e "\033[1;34m------------------------------\033[0m"
    fi
    echo -e "\033[0;36mPress any key to continue...\033[0m"
    read -r -n1
}

# Show favorites
show_favorites() {
    if [[ ! -f "$FASTCAT_DATA/favorites.txt" ]] || [[ ! -s "$FASTCAT_DATA/favorites.txt" ]]; then
        echo -e "\033[1;33mNo favorites yet. Use [+] after selecting a theme number.\033[0m"
    else
        echo -e "\033[1;34m--- Favorites ---\033[0m"
        local i=1
        while IFS='|' read -r category name; do
            echo -e "  \033[1;33m$i)\033[0m \033[0;36m[$category]\033[0m $name"
            ((i++))
        done < "$FASTCAT_DATA/favorites.txt"
        echo -e "\033[1;34m-----------------\033[0m"
    fi
    echo -e "\033[0;36mPress any key to continue...\033[0m"
    read -r -n1
}

# Theme name mapping
THEMES=(
    [1]="MetoSpace" [2]="Fast-Snail" [3]="Cat" [4]="Minimal"
    [5]="Arch" [6]="Blocks" [7]="Cocktail" [8]="Palm"
    [9]="Sheriff" [10]="Bunny" [11]="Coffee" [12]="Duck"
    [13]="OWL" [14]="Giraffe" [15]="Robo-Dog" [16]="Tie-Fighter"
)
CATEGORY="Small"

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
\e[1;32m[+]\e[0;32mFavorite \e[1;36m[H]\e[0;32mHistory \e[1;33m[F]\e[0;32mFavorites
\033[1;31m[x]Exit [00]Menu [D]Default-Theme
'
        echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read islem
}
banner
if [[ $islem == 1 || $islem == 01 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd MetoSpace/ && cp -r fastfetch ~/.config
log_history "Small" "MetoSpace"
clear
fastfetch
elif [[ $islem == 2 || $islem == 02 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Fast-Snail/ && cp -r fastfetch ~/.config
log_history "Small" "Fast-Snail"
clear
fastfetch
elif [[ $islem == 3 || $islem == 03 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Cat/ && cp -r fastfetch ~/.config
log_history "Small" "Cat"
clear
fastfetch
elif [[ $islem == 4 || $islem == 04 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Minimal/ && cp -r fastfetch ~/.config
log_history "Small" "Minimal"
clear
fastfetch
elif [[ $islem == 5 || $islem == 05 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Arch/ && cp -r fastfetch ~/.config
log_history "Small" "Arch"
clear
fastfetch
elif [[ $islem == 6 || $islem == 06 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Blocks/ && cp -r fastfetch ~/.config
log_history "Small" "Blocks"
clear
fastfetch
elif [[ $islem == 7 || $islem == 07 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Cocktail/ && cp -r fastfetch ~/.config
log_history "Small" "Cocktail"
clear
fastfetch
elif [[ $islem == 8 || $islem == 08 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Palm/ && cp -r fastfetch ~/.config
log_history "Small" "Palm"
clear
fastfetch
elif [[ $islem == 9 || $islem == 09 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Sheriff/ && cp -r fastfetch ~/.config
log_history "Small" "Sheriff"
clear
fastfetch
elif [[ $islem == 10 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Bunny/ && cp -r fastfetch ~/.config
log_history "Small" "Bunny"
clear
fastfetch
elif [[ $islem == 11 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Coffee/ && cp -r fastfetch ~/.config
log_history "Small" "Coffee"
clear
fastfetch
elif [[ $islem == 12 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Duck/ && cp -r fastfetch ~/.config
log_history "Small" "Duck"
clear
fastfetch
elif [[ $islem == 13 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd OWL/ && cp -r fastfetch ~/.config
log_history "Small" "OWL"
clear
fastfetch
elif [[ $islem == 14 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Giraffe/ && cp -r fastfetch ~/.config
log_history "Small" "Giraffe"
clear
fastfetch
elif [[ $islem == 15 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Robo-Dog/ && cp -r fastfetch ~/.config
log_history "Small" "Robo-Dog"
clear
fastfetch
elif [[ $islem == 16 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Tie-Fighter/ && cp -r fastfetch ~/.config
log_history "Small" "Tie-Fighter"
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
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Default/ && cp -r fastfetch ~/.config
log_history "Small" "Default"
clear
fastfetch
elif [[ $islem == "+" ]]; then
    echo -e "\033[1;33mEnter theme number to toggle favorite:\033[0m"
    echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read fav_num
    fav_num=$((10#$fav_num))
    if [[ -n "${THEMES[$fav_num]+x}" ]]; then
        toggle_favorite "$CATEGORY|${THEMES[$fav_num]}"
    else
        echo -e "\033[1;31mInvalid theme number!\033[0m"
        sleep 1
    fi
    exec bash "$0"
elif [[ $islem == H || $islem == h ]]; then
    show_history
    exec bash "$0"
elif [[ $islem == F || $islem == f ]]; then
    show_favorites
    exec bash "$0"
elif [[ $islem == x || $islem == X ]]; then
	clear
echo -e "\033[1;31m GoodBye\033[0m"
	exit 1
else
	echo -e '\033[36;40;1m Wrong transaction number!'
fi
