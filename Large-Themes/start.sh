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
    exec bash "$0" "$@"
fi

# Made By M3TOZZ
loader () {
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
    [1]="Anime-Boy" [2]="Death" [3]="Pentagram" [4]="Scorpion"
    [5]="Anime-Girl" [6]="Saturn" [7]="Suse-Icons" [8]="Cat"
    [9]="Jurassic" [10]="BatMan" [11]="Groups" [12]="Rose"
    [13]="Fedora" [14]="Arch" [15]="Hyprland" [16]="Simpsons"
    [17]="Origami" [18]="Home" [19]="DeadPool" [20]="Superman"
    [21]="Spider-Man" [22]="Triangle" [23]="Stars" [24]="Yandere-Girl"
    [25]="TheLead" [26]="ShirazTux" [27]="Kaviani-Derafsh" [28]="Arthur-Morgan-hat"
    [29]="MetoCat" [30]="Shiraz-Linux" [31]="Bulla-Cachy"
    [32]="Phoenix" [33]="Dragon" [34]="Zeith-Hum" [35]="Anchor"
)

THEME_COUNT=${#THEMES[@]}

apply_by_name() {
    local theme="$1"
    if [[ ! -d "$theme" ]]; then
        echo -e "\033[1;31mTheme directory '$theme' not found!\033[0m"
        sleep 1
        return
    fi
    sleep 1
    clear
    loader
    rm -rf ~/.config/fastfetch
    sleep 1
    mkdir -p ~/.config/fastfetch
    cp -r "$theme/fastfetch" ~/.config/
    clear
    fastfetch
}

preview_theme() {
    local theme_dir="$1"
    local tmp_dir
    tmp_dir=$(mktemp -d)

    cp -r "$theme_dir/fastfetch/"* "$tmp_dir/"

    local config="$tmp_dir/config.jsonc"

    if [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' "s|~/.config/fastfetch/|$tmp_dir/|g" "$config"
        sed -i '' "s|\\\$HOME/.config/fastfetch/|$tmp_dir/|g" "$config"
    else
        sed -i "s|~/.config/fastfetch/|$tmp_dir/|g" "$config"
        sed -i "s|\\\$HOME/.config/fastfetch/|$tmp_dir/|g" "$config"
    fi

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

random_theme() {
    local rand=$((RANDOM % THEME_COUNT))
    local name="${THEMES[$rand]}"
    echo -e "\033[1;33mRandom pick: \033[1;32m$name\033[0m"
    sleep 1
    apply_by_name "$name"
}

search_themes() {
    echo -e "\033[1;33mSearch theme:\033[0m"
    read -rp $'\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m ' query

    if [[ -z "$query" ]]; then
        echo -e "\033[1;31mEmpty search.\033[0m"
        sleep 1
        return
    fi

    local found=0
    local matches=()
    local match_nums=()

    for i in "${!THEMES[@]}"; do
        if [[ "${THEMES[$i],,}" == *"${query,,}"* ]]; then
            matches+=("${THEMES[$i]}")
            match_nums+=("$i")
            ((found++))
        fi
    done

    if [[ $found -eq 0 ]]; then
        echo -e "\033[1;31mNo themes found matching '$query'\033[0m"
        sleep 2
        return
    fi

    echo -e "\033[1;34m--- Search Results ---\033[0m"
    for idx in "${!matches[@]}"; do
        echo -e "  \033[1;33m[${match_nums[$idx]}]\033[0m ${matches[$idx]}"
    done
    echo -e "\033[1;34m----------------------\033[0m"

    read -rp $'\033[0;36mEnter number to apply, or press Enter to go back:\033[0m ' choice
    if [[ -n "$choice" ]]; then
        choice=$((10#$choice))
        if [[ -n "${THEMES[$choice]+x}" ]]; then
            apply_by_name "${THEMES[$choice]}"
        else
            echo -e "\033[1;31mInvalid number!\033[0m"
            sleep 1
        fi
    fi
}

# --- Banner ve Menü ---
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
\033[1;33m[32]\e[0;32mPhoenix \e[1;35m[33]\e[0;32mDragon \033[1;33m[34]\e[0;32mZeith-Hum \033[0;36m[35]\e[0;32mAnchor
\033[1;31m[P]Preview [R]Random [x]Exit [00]Menu [D]Default-Theme
'
echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read islem
}

banner

# --- Menü Seçimleri ---
case $islem in
    [1-9]|0[1-9]|1[0-9]|2[0-9]|3[0-5])
        choice=$((10#$islem))
        apply_by_name "${THEMES[$choice]}"
        ;;
    P|p) 
        echo -e "\033[1;33mEnter theme number to preview:\033[0m"
        read -r preview_num
        preview_num=$((10#$preview_num))
        if [[ -n "${THEMES[$preview_num]+x}" ]]; then
            preview_theme "${THEMES[$preview_num]}"
        else
            echo -e "\033[1;31mInvalid theme number!\033[0m"
            sleep 1
        fi
        exec bash "$0"
        ;;
    R|r)
        random_theme
        ;;
    D|d)
    sleep 1
    clear
    loader
    rm -r ~/.config/fastfetch
    clear   
    fastfetch
        ;;
    00)
        bash ./fastcat.sh -s
        ;;
    X|x)
        clear
        echo -e "\033[1;31mGoodBye\033[0m"
        exit 0
        ;;
    *)
        echo -e '\033[36;40;1mWrong transaction number!'
        ;;
esac
