#!/bin/bash
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Googlebot ${normal}\n"
    printf "${menu}**${number} 2)${menu} Facebookbot ${normal}\n"
    printf "${menu}**${number} 3)${menu} VKontakte ${normal}\n"
    printf "${menu}**${number} 4)${menu} Odnoklassniki ${normal}\n"
    printf "${menu}**${number} 5)${menu} LinkedInBot ${normal}\n"
    printf "${menu}**${number} 6)${menu} MailRuBot ${normal}\n"
    printf "${menu}**${number} 7)${menu} User browser ${normal}\n"
    printf "${menu}**${number} x)${menu} ${fgred}exit ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Request as a: ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            printf "CURL as a Googlebot:\n\n"
            curl --user-agent "Googlebot/2.1 (+http://www.google.com/bot.html)" -v "$1"
            show_menu;
        ;;
        2) clear;
            printf "CURL as a Facebootbot:\n\n"
            curl -v --compressed -H "Range: bytes=0-524288" -H "Connection: close" -A "facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)" "$1"
            show_menu;
        ;;
        3) clear;
            printf "CURL as VKontakte:\n\n"
            curl -H "User-Agent: Mozilla/5.0 (compatible; vkShare; +http://vk.com/dev/Share)" "$1"
            show_menu;
        ;;
        4) clear;
            printf "CURL as user:\n\n"
            curl -H "User-Agent: Mozilla/5.0 (compatible; OdklBot/1.0 like Linux; klass@odnoklassniki.ru)" "$1"
            show_menu;
        ;;
        5) clear;
            printf "CURL as user:\n\n"
            curl -H "User-Agent: LinkedInBot/1.0 (compatible; Mozilla/5.0; Apache-HttpClient http://www.linkedin.com)" "$1"
            show_menu;
        ;;
        6) clear;
            printf "CURL as user:\n\n"
            curl -H "User-Agent: Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/Fast/2.0; +http://go.mail.ru/help/robots) python-requests/2.2.1 CPython/2.7.6 Linux/4.9.80-c9" "$1"
            show_menu;
        ;;
        7) clear;
            printf "CURL as user:\n\n"
            curl -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" "$1"
            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done
