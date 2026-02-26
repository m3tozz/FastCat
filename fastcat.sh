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
# fastcat updater 
remote_url="https://raw.githubusercontent.com/m3tozz/FastCat/main/fastcat.sh"
local_file="$0"
tmp_file=$(mktemp)
curl -s "$remote_url" -o "$tmp_file"
remote_ver=$(grep -E "^ *version=" "$tmp_file" | cut -d"'" -f2)
local_ver=$(grep -E "^ *version=" "$local_file" | cut -d"'" -f2)
rm "$tmp_file"
if [ "$remote_ver" != "$local_ver" ]; then
    echo "new version found: $local_ver → $remote_ver"
    if [ -d ".git" ]; then
        echo "updating... syncing entire repository"
        branch=$(git symbolic-ref --short HEAD 2>/dev/null)
        git fetch origin
        git reset --hard origin/$branch
        echo "update complete. restarting script..."
		echo -e "\033[1;31mThis message may repeat itself several times. Please wait...\e[0m"
        exec "$local_file" "$@"
        exit
    else
        echo -e "\e[1;33m[Warning]\e[0m Git repository not found. Skipping full update."
        echo -e "To update manually, run:\n\e[1;34mgit clone --depth 1 https://github.com/m3tozz/FastCat.git && cd FastCat && bash ./fastcat.sh --shell\e[0m"
        sleep 2
    fi
fi
# FastCat Version
    version='1.3.2.1'
# Colors
    red='\e[1;31m'
    yellow='\e[1;33m'
    blue='\e[1;34m'
    tp='\e[0m'
    green='\e[0;32m'
    bgreen='\033[1;32m'
# Define Constants.
export APP="FastCat" 		# Project Name
export CWD="${PWD}"			# Current Work Directory
export BASENAME="${0##*/}"	# Base Name of This Script
# Functions.
help() {
	echo -e "Wrong usage, there is 3 arguments for ${BASENAME}\n
\t${BASENAME} --shell: run the ${APP} .
\t${BASENAME} --backup: back up your own fastfetch configuration.
\t${BASENAME} --version: show the version.
\t${BASENAME} --about: about ${APP} project.
\t${BASENAME} --help: show this page.
"
}
fastcat:version() {
echo "$version"
}
fastcat:about() {
echo -e '
 _____         _    ____      _   
|  ___|_ _ ___| |_ / ___|__ _| |_ 
| |_ / _` / __| __| |   / _` | __|FastFetch Theme Pack!
|  _| (_| \__ \ |_| |__| (_| | |_ 
|_|  \__,_|___/\__|\____\__,_|\__|                       
'
    echo -e "$blue###########################################################################$tp"
    echo -e "    Create by           ":" $red M3TOZZ$tp"
	echo -e "    Contributors        ":" $red LierB, ArThirtyFour, cassiofb-dev, ParsaBordbar$tp"
    echo -e "    Github              ":" $red github.com/m3tozz/FastCat$tp"
    echo -e "    Community Server    ":" $red discord.com/invite/sQwYCZer95$tp"
    echo -e "    Version             ":" $red ${version} $tp"
    echo -e "$blue###########################################################################$tp"
	exit 1
}
fastcat:backup() {
bash ./backup.sh
}
help() {
	echo -e "	 
--shell: run the ${APP} .
--backup: back up your own fastfetch configuration.
--version: show the version.
--about: about ${APP} project.
--help: show this page."
}
shell(){
if ! command -v fastfetch
then
    clear
    echo -e "\033[1;31mFastFetch Not Found!\033[1;33m"
    echo -e "To use FastCat, you must first install FastFetch :)"
    echo -e "\n\033[1;31mFastFetch Installation:\033[0m"
    echo -e "\033[1;36mDebian or Ubuntu using APT:\033[0m"
    echo -e "  \033[1;34m→ sudo apt install fastfetch\033[0m"
    echo -e "\n\033[1;32mArch Linux using Pacman:\033[0m"
    echo -e "  \033[1;34m→ sudo pacman -S fastfetch\033[0m"
    echo -e "\n\033[1;35mRHEL, Fedora, or CentOS using DNF:\033[0m"
    echo -e "  \033[1;34m→ sudo dnf install fastfetch\033[0m"
exit 1
fi
mkdir -p ~/.config/fastfetch
clear
banner(){
echo -e '\033[1;36m
⠀⠀⠀⢠⣾⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣰⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢰⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣄⣀⣀⣤⣤⣶⣾⣿⣿⣿⡷
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀    \033[0;31m  ______        _    _____      _   \033[1;36m 
⣿⣿⣿⡇⠀⡾⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀    \033[0;31m |  ____|      | |  / ____|    | |  \033[1;36m 
⣿⣿⣿⣧⡀⠁⣀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀    \033[0;31m | |__ __ _ ___| |_| |     __ _| |_ \033[1;36m
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⢹⠉⠙⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀    \033[0;31m |  __/ _` / __| __| |    / _` | __|\033[1;36m
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⠀⣀⣼⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀   \033[0;31m  | | | (_| \__ \ |_| |___| (_| | |_ \033[1;36m 
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀    \033[0;31m |_|  \__,_|___/\__|\_____\__,_|\__|\033[1;36m
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀    \033[0;36m    FastFetch Theme Pack.\033[1;36m 
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠀⠤⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⠿⠋⢃⠈⠢⡁⠒⠄⡀⠈⠁⠀⠀⠀⠀⠀⠀⠀
⣿⣿⠟⠁⠀⠀⠈⠉⠉⠁⠀⠀⠀⠀⠈⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                       
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                       
'
echo -e '
\e[1;34m[01]\e[0;32mSmall Themes \e[1;35m[02]\e[0;32mLarge Themes \e[1;33m[03]\e[0;32mVisuals Themes \033[0;33m[C]\e[0;32mCommunity Themes 
\e[1;31m[A]About [B]Backup \e[1;36m[H]History [F]Favorites \e[1;31m[x]Exit\033[0m
'
        echo -ne "\e[1;31mm3tozz\033[0;36m@\033[1;33mfastcat\n\e \033[0;36m↳\033[0m " ; read islem
}
banner
if [[ $islem == 1 || $islem == 01 ]]; then
	clear
	cd Small-Themes/
	bash start.sh
elif [[ $islem == 2 || $islem == 02 ]]; then
	clear
	cd Large-Themes/
	bash start.sh
elif [[ $islem == 3 || $islem == 03 ]]; then
	clear
	cd Visuals-Themes/
	
	chmod +x start.sh
	bash start.sh
elif [[ $islem == x || $islem == X ]]; then
	clear
elif [[ $islem == c || $islem == C ]]; then
	clear
	rm -rf fastcat-community-themes
	git clone https://github.com/m3tozz/fastcat-community-themes.git
 	clear
 	cd fastcat-community-themes
 	echo -e '\033[0;33mTo add your own fastfetch configuration to the FastCat community,'
	echo -e '\033[0;31mAdd your own configuration at https://github.com/m3tozz/fastcat-community-themes'
	echo -e 'and submit a Pull Request..\e[0m'
 	echo -e "\033[1;32m Themes Uploaded by Our Community:\033[01;35m"
 	ls -d */
 	echo -e '\033[0;33mYou need to manually install the themes in this folder into .config/fastfetch.\033[0;31m'
  	pwd
	echo -e '    \033[0m'
elif [[ $islem == a || $islem == A ]]; then
	clear
echo -e '
 _____         _    ____      _   
|  ___|_ _ ___| |_ / ___|__ _| |_ 
| |_ / _` / __| __| |   / _` | __|FastFetch Theme Pack!
|  _| (_| \__ \ |_| |__| (_| | |_ 
|_|  \__,_|___/\__|\____\__,_|\__|                       
'
    echo -e "$blue###########################################################################$tp"
    echo -e "    Create by           ":" $red M3TOZZ$tp"
	echo -e "    Contributors        ":" $red LierB, ArThirtyFour, cassiofb-dev, ParsaBordbar$tp"
    echo -e "    Github              ":" $red github.com/m3tozz/FastCat$tp"
    echo -e "    Community Server    ":" $red discord.com/invite/sQwYCZer95$tp"
    echo -e "    Version             ":" $red ${version} $tp"
    echo -e "$blue###########################################################################$tp"
    echo -e "\nPress any key to continue..."
    read -r -n1
    shell
    
elif [[ $islem == h || $islem == H ]]; then
    FASTCAT_DATA="$HOME/.config/fastcat"
    if [[ ! -f "$FASTCAT_DATA/history.log" ]] || [[ ! -s "$FASTCAT_DATA/history.log" ]]; then
        echo -e "\033[1;33mNo history yet.\033[0m"
    else
        echo -e "\033[1;34m--- Theme History ---\033[0m"
        tac "$FASTCAT_DATA/history.log" | head -20 | while IFS='|' read -r date category name; do
            echo -e "\033[0;36m$date\033[0m  \033[1;33m[$category]\033[0m  $name"
        done
        echo -e "\033[1;34m---------------------\033[0m"
    fi
    echo -e "\nPress any key to continue..."
    read -r -n1
    shell
elif [[ $islem == f || $islem == F ]]; then
    FASTCAT_DATA="$HOME/.config/fastcat"
    if [[ ! -f "$FASTCAT_DATA/favorites.txt" ]] || [[ ! -s "$FASTCAT_DATA/favorites.txt" ]]; then
        echo -e "\033[1;33mNo favorites yet.\033[0m"
    else
        echo -e "\033[1;34m--- Favorites ---\033[0m"
        while IFS='|' read -r category name; do
            echo -e "  \033[0;36m[$category]\033[0m $name"
        done < "$FASTCAT_DATA/favorites.txt"
        echo -e "\033[1;34m-----------------\033[0m"
    fi
    echo -e "\nPress any key to continue..."
    read -r -n1
    shell
elif [[ $islem == b || $islem == B ]]; then
$SHELL ./backup.sh
else
	echo -e '\e[1;34m Wrong transaction number!\033[0m'
fi
}
# Argument Parser.
normalized_arg=$(echo "$1" | tr '[:upper:]' '[:lower:]')
case "$normalized_arg" in
	"--shell"|"-s")
		shell
	;;
	"--backup"|"-b")
		fastcat:backup
	;;
		"--about"|"-a")
		fastcat:about
	;;
	"--version"|"-v")
		fastcat:version
	;;
	*)
		help
	;;
esac
