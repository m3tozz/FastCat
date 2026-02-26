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
    [1]="Anime-Boy" [2]="Death" [3]="Pentagram" [4]="Scorpion"
    [5]="Anime-Girl" [6]="Saturn" [7]="Suse-Icons" [8]="Cat"
    [9]="Jurassic" [10]="BatMan" [11]="Groups" [12]="Rose"
    [13]="Fedora" [14]="Arch" [15]="Hyprland" [16]="Simpsons"
    [17]="Origami" [18]="Home" [19]="DeadPool" [20]="Superman"
    [21]="Spider-Man" [22]="Triangle" [23]="Stars" [24]="Yandere-Girl"
    [25]="TheLead" [26]="ShirazTux" [27]="Kaviani-Derafsh" [28]="Arthur-Morgan-hat"
    [29]="MetoCat" [30]="Shiraz-Linux" [31]="Bulla-Cachy"
)
CATEGORY="Large"

clear
banner(){
echo -e '\033[0;36m
\033[0;31m______        _   _____       _
\033[0;33m|  ___|      | | /  __ \     | |
\033[0;34m| |_ __ _ ___| |_| /  \/ __ _| |_
\033[0;35m|  _/ _` / __| __| |    / _` | __|\033[0;31mLarge-Themes
\033[0;36m| || (_| \__ \ |_| \__/\ (_| | |_
\033[0;31m\_| \__,_|___/\__|\____/\__,_|\__|
\e[1;34m[01]\e[0;32mAnime-Boy \e[1;35m[02]\e[0;32mDeath \e[1;31m[03]\e[0;32mPentagram \033[1;33m[04]\e[0;32mScorpion
\033[1;33m[05]\e[0;32mAnime-Girl \e[1;36m[06]\e[0;32mSaturn \e[1;35m[07]\e[0;32mSuse-Icons \033[0;36m[08]\e[0;32mCat
\e[1;35m[09]\e[0;32mJurassic \033[1;33m[10]\e[0;32mBatMan \e[1;34m[11]\e[0;32mGroups \e[1;31m[12]\e[0;32mRose
\e[0;36m[13]\e[0;32mFedora \e[1;34m[14]\e[0;32mArch \e[1;35m[15]\e[0;32mHyprland \e[1;34m[16]\e[0;32mSimpsons
\033[1;33m[17]\e[0;32mOrigami \e[1;35m[18]\e[0;32mHome \033[1;33m[19]\e[0;32mDeadPool \033[0;36m[20]\e[0;32mSuperman
\e[1;34m[21]\e[0;32mSpider-Man \e[0;36m[22]\e[0;32mTriangle \033[1;33m[23]\e[0;32mStars \e[1;35m[24]\e[0;32mYandere-Girl
\e[1;34m[25]\e[0;32mTheLead \e[1;35m[26]\e[0;32mShirazTux \e[1;31m[27]\e[0;32mKaviani-Derafsh \e[1;35m[28]\e[0;32mArthur-Morgan-hat
\e[1;31m[29]\e[0;32mMetoCat \e[1;33m[30]\e[0;32mShiraz-Linux \e[1;35m[31]\e[0;32mBulla-Cachy
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
        cd Anime-Boy/ && cp -r fastfetch ~/.config
log_history "Large" "Anime-Boy"
clear
fastfetch
elif [[ $islem == 2 || $islem == 02 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Death/ && cp -r fastfetch ~/.config
log_history "Large" "Death"
clear
fastfetch
elif [[ $islem == 3 || $islem == 03 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Pentagram/ && cp -r fastfetch ~/.config
log_history "Large" "Pentagram"
clear
fastfetch
elif [[ $islem == 4 || $islem == 04 ]]; then
        sleep 1
        clear
        loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Scorpion/ && cp -r fastfetch ~/.config
log_history "Large" "Scorpion"
clear
fastfetch
elif [[ $islem == 5 || $islem == 05 ]]; then
        sleep 1
        clear
        loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Anime-Girl/ && cp -r fastfetch ~/.config
log_history "Large" "Anime-Girl"
clear
fastfetch
elif [[ $islem == 6 || $islem == 06 ]]; then
        sleep 1
        clear
        loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Saturn/ && cp -r fastfetch ~/.config
log_history "Large" "Saturn"
clear
fastfetch
elif [[ $islem == 7 || $islem == 07 ]]; then
        sleep 1
        clear
        loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Suse-Icons/ && cp -r fastfetch ~/.config
log_history "Large" "Suse-Icons"
clear
fastfetch
elif [[ $islem == 8 || $islem == 08 ]]; then
        sleep 1
        clear
        loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Cat/ && cp -r fastfetch ~/.config
log_history "Large" "Cat"
clear
fastfetch
elif [[ $islem == 9 || $islem == 09 ]]; then
        sleep 1
        clear
        loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Jurassic/ && cp -r fastfetch ~/.config
log_history "Large" "Jurassic"
clear
fastfetch
elif [[ $islem == 10 ]]; then
        sleep 1
        clear
        loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd BatMan/ && cp -r fastfetch ~/.config
log_history "Large" "BatMan"
clear
fastfetch
elif [[ $islem == 11 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Groups/ && cp -r fastfetch ~/.config
log_history "Large" "Groups"
clear
fastfetch
elif [[ $islem == 12 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Rose/ && cp -r fastfetch ~/.config
log_history "Large" "Rose"
clear
fastfetch
elif [[ $islem == 13 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Fedora/ && cp -r fastfetch ~/.config
log_history "Large" "Fedora"
clear
fastfetch
elif [[ $islem == 14 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Arch/ && cp -r fastfetch ~/.config
log_history "Large" "Arch"
clear
fastfetch
elif [[ $islem == 15 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Hyprland/ && cp -r fastfetch ~/.config
log_history "Large" "Hyprland"
clear
fastfetch
elif [[ $islem == 16 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Simpsons/ && cp -r fastfetch ~/.config
log_history "Large" "Simpsons"
clear
fastfetch
elif [[ $islem == 17 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Origami/ && cp -r fastfetch ~/.config
log_history "Large" "Origami"
clear
fastfetch
elif [[ $islem == 18 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Home/ && cp -r fastfetch ~/.config
log_history "Large" "Home"
clear
fastfetch
elif [[ $islem == 19 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd DeadPool/ && cp -r fastfetch ~/.config
log_history "Large" "DeadPool"
clear
fastfetch
elif [[ $islem == 20 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Superman/ && cp -r fastfetch ~/.config
log_history "Large" "Superman"
clear
fastfetch
elif [[ $islem == 21 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Spider-Man/ && cp -r fastfetch ~/.config
log_history "Large" "Spider-Man"
clear
fastfetch
elif [[ $islem == 22 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Triangle/ && cp -r fastfetch ~/.config
log_history "Large" "Triangle"
clear
fastfetch
elif [[ $islem == 23 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Stars/ && cp -r fastfetch ~/.config
log_history "Large" "Stars"
clear
fastfetch
elif [[ $islem == 24 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
        cd Yandere-Girl/ && cp -r fastfetch ~/.config
log_history "Large" "Yandere-Girl"
clear
fastfetch
elif [[ $islem == 25 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd TheLead/ && cp -r fastfetch ~/.config
log_history "Large" "TheLead"
clear
fastfetch
elif [[ $islem == 26 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
mkdir -p ~/.config/fastfetch/
        cd ShirazTux/ && cp -r fastfetch ~/.config
log_history "Large" "ShirazTux"
clear
fastfetch
elif [[ $islem == 27 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
mkdir -p ~/.config/fastfetch/
        cd Kaviani-Derafsh/ && cp -r fastfetch ~/.config
log_history "Large" "Kaviani-Derafsh"
clear
fastfetch
elif [[ $islem == 28 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch
sleep 1
mkdir -p ~/.config/fastfetch/
mv "Arthur-Morgan's-hat" "Arthur-Morgan-hat"
cd    Arthur-Morgan-hat/ && cp -r fastfetch ~/.config
log_history "Large" "Arthur-Morgan-hat"
clear
fastfetch
elif [[ $islem == 29 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd MetoCat/ && cp -r fastfetch ~/.config
log_history "Large" "MetoCat"
clear
fastfetch
elif [[ $islem == 30 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd Shiraz-Linux/ && cp -r fastfetch ~/.config
log_history "Large" "Shiraz-Linux"
clear
fastfetch
elif [[ $islem == 31 ]]; then
	sleep 1
	clear
	loader
auto_backup
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd Bulla-Cachy/ && cp -r fastfetch ~/.config
log_history "Large" "Bulla-Cachy"
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
log_history "Large" "Default"
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
