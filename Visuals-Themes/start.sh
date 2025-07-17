#!/usr/bin/env bash

# CRLF line-ending fix block
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

# Loader function
loader() {
  printf "\033[0m\nFastCat - FastFetch Theme Pack!\n[#####                     ] 25%%  completed.\r"
  sleep 0.3
  clear
  printf "\nFastCat - FastFetch Theme Pack!\n[###############       ] 75%%  completed.\r"
  sleep 0.2
  clear
  printf "\nFastCat - FastFetch Theme Pack!\n[####################] 100%%  completed.\r"
  sleep 0.2
}

# Prompts the user to select the image rendering protocol with details.
# This is now called AFTER a theme is selected.
prompt_logo_protocol() {
    echo -e "\n\033[1;33mChoose the image rendering protocol for this theme:\033[0m"
    echo -e "-------------------------------------------------------------------"
    echo -e "\033[1;32m[1] auto\033[0m          - (Default) Tries to auto-detect. Works well on Kitty, Ghostty but can be unpredictable."
    echo -e "\033[1;32m[2] kitty\033[0m         - The standard Kitty protocol. Best for Kitty terminal."
    echo -e "\033[1;32m[3] kitty-direct\033[0m  - Fastest protocol. Supported by: WezTerm, Warp, Kitty (PNG only), Ghostty (PNG only)."
    echo -e "\033[1;32m[4] iterm\033[0m         - iTerm2 protocol. Supported by: iTerm2, WezTerm, Konsole."
    echo -e "\033[1;32m[5] sixel\033[0m         - For terminals with Sixel graphics support (e.g., foot, Contour)."
    echo -e "-------------------------------------------------------------------"

    local choice
    while true; do
        echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read choice
        case "$choice" in
            1) LOGO_PROTOCOL="auto"; break ;;
            2) LOGO_PROTOCOL="kitty"; break ;;
            3) LOGO_PROTOCOL="kitty-direct"; break ;;
            4) LOGO_PROTOCOL="iterm"; break ;;
            5) LOGO_PROTOCOL="sixel"; break ;;
            *) echo -e "\033[1;31mInvalid choice. Please try again.\033[0m" ;;
        esac
    done
    export LOGO_PROTOCOL
}

# Applies a visual theme by modifying the config on the fly.
# Arguments: $1 = Theme folder name
apply_visual_theme() {
    local theme_dir="$1"
    local config_dest_path="$HOME/.config/fastfetch"

    loader

    # Clean up old config
    rm -rf "$config_dest_path"
    mkdir -p "$config_dest_path"

    # Copy theme files
    cp -r "$theme_dir/fastfetch/"* "$config_dest_path/"

    local target_config_file="$config_dest_path/config.jsonc"

    # Use a contextual sed command to only modify the type within the "logo" block.
    # Use an explicit if/else for sed to avoid backup file issues on macOS.
    if [[ "$(uname)" == "Darwin" ]]; then
        # For BSD sed on macOS
        sed -i '' '/"logo": {/,/}/s/"type": ".*"/"type": "'"$LOGO_PROTOCOL"'"/' "$target_config_file"
        sed -i '' "s|\"source\": \"|\"source\": \"$config_dest_path/|g" "$target_config_file"
    else
        # For GNU sed on Linux
        sed -i '/"logo": {/,/}/ s/"type": ".*"/"type": "'"$LOGO_PROTOCOL"'"/' "$target_config_file"
        sed -i "s|\"source\": \"|\"source\": \"$config_dest_path/|g" "$target_config_file"
    fi

    clear
    echo "Running fastfetch with the new theme. Errors (if any) will be shown below:"
    fastfetch --show-errors
}

# --- Main Script Flow ---

# The main banner function only displays the menu.
banner() {
  echo -e '\033[0;36m
\033[0;31m______          _   _____     _
\033[0;33m|  ___|        | | /  __ \   | |
\033[0;34m| |_ __ _ ___| |_| /  \/ __ _| |_
\033[0;35m|  _/ _` / __| __| |    / _` | __|\033[0;31mVisuals-Themes
\033[0;36m| || (_| \__ \ |_| \__/\ (_| | |_
\033[0;31m\_| \__,_|___/\__|\____/\__,_|\__|
\e[1;34m[01]\e[0;32mDragonball \e[1;35m[02]\e[0;32mOne-Piece \e[1;31m[03]\e[0;32mXenia
\e[3m\e[92mThese themes require an image-supporting terminal emulator.\e[0m
\033[1;31m[x]Exit  [00]Menu  [D]Default-Theme
'
}

# The main loop now handles the complete interaction flow.
while true; do
    clear
    banner
    echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read islem

    case "$islem" in
        1|01)
            prompt_logo_protocol
            apply_visual_theme "Dragonball"
            break
            ;;
        2|02)
            prompt_logo_protocol
            apply_visual_theme "One-Piece"
            break
            ;;
        3|03)
            prompt_logo_protocol
            apply_visual_theme "Xenia"
            break
            ;;
        00)
            cd ..
            bash ./fastcat.sh -s
            break
            ;;
        D|d)
            echo -e "\n\033[1;33mWarning: There is no 'default' for visual themes.\033[0m"
            sleep 2
            ;;
        x|X)
            clear
            echo -e "\033[1;31mGoodbye!\033[0m"
            exit 1
            ;;
        *)
            echo -e "\n\033[1;31mInvalid selection!\033[0m"
            sleep 1
            ;;
    esac
done
