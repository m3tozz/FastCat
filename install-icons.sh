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
echo -e '\033[1;36m
    ______           __  ______      __ 
   / ____/___ ______/ /_/ ____/___ _/ /_
  / /_  / __ `/ ___/ __/ /   / __ `/ __/
 / __/ / /_/ (__  ) /_/ /___/ /_/ / /_  
/_/    \__,_/____/\__/\____/\__,_/\__/  
 FastFetch Theme Pack                           
\033[0m'
read -p "Do you want to install CascadiaCode Nerd Font? (Y/N): " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then
    # Check for a downloader
    if command -v curl &>/dev/null; then
        DOWNLOADER="curl"
    elif command -v wget &>/dev/null; then
        DOWNLOADER="wget"
    else
        echo -e "\033[1;31mError: Neither 'curl' nor 'wget' is installed. Please install one and rerun.\033[0m"
        exit 1
    fi

    if ! command -v unzip >/dev/null 2>&1; then
        echo -e "\033[1;31mError: 'unzip' is not installed. Please install it and rerun the script.\033[0m"
        exit 1
    fi

    # OS-aware font directory
    if [[ "$(uname)" == "Darwin" ]]; then
        FONT_DIR="$HOME/Library/Fonts"
    else
        FONT_DIR="$HOME/.fonts"
    fi

    echo -e "\033[1;32mEnsuring font directory exists: $FONT_DIR...\033[0m"
    mkdir -p "$FONT_DIR"

    FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip"
    ZIP_PATH="$FONT_DIR/CascadiaCode.zip"

    echo -e "\033[1;34mDownloading CascadiaCode Nerd Font using $DOWNLOADER...\033[0m"
    if [[ "$DOWNLOADER" == "curl" ]]; then
        curl -sL "$FONT_URL" -o "$ZIP_PATH"
    else
        wget -q -O "$ZIP_PATH" "$FONT_URL"
    fi

    echo -e "\033[1;34mExtracting font files...\033[0m"
    unzip -oq "$ZIP_PATH" -d "$FONT_DIR"

    echo -e "\033[1;34mCleaning up...\033[0m"
    rm "$ZIP_PATH"

    echo -e "\033[1;34mRefreshing font cache...\033[0m"
    fc-cache -fv

    echo -e "\nInstallation complete! Please set 'CaskaydiaCove Nerd Font' in your terminal."
else
    echo -e "\033[1;31mInstallation canceled by user.\033[0m"
fi