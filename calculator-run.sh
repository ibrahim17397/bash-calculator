#!/bin/bash
source ./arithmetic-fun.sh
source ./scientifi.fun.sh
source ./programmer-fun.sh

#The Main Menu#
function main_menu(){
        choose=$(whiptail --title "Calculator Project" --menu "\nOPtions:" --ok-button Enter --cancel-button Exit! 12 30 2 \
        "1" "Start Calculator" \
        "2" "Documentation" 3>&1 1>&2 2>&3)
        case $choose in
        1) calc_opr ;;
        2) docs ;;
        *) exit ;;
        esac

}

#The Operation Menu#
function calc_opr(){
        choose=$(whiptail --title "Calculator" --menu "\nSelect Mode:" --ok-button Enter --cancel-button Back 12 30 3 \
        "1" "Arithmetic" \
        "2" "Scientific" \
        "3" "Programmer" 3>&1 1>&2 2>&3)
        case $choose in
        1) arith_fun ;;
        2) scientific_fun ;;
        3) programmer_fun ;;
        *) main_menu ;;
        esac
}

#Documentation#
function docs(){
        whiptail --title "Documentation" --msgbox "This Project was made by Ibrahim Taha during the ITI 3-Months 2021-2022 period\nunder the supervision of Eng.Karim Abdelhamid, so that really all thanks to Eng.Karim for his great efforts :)\n\nThis is a pure Bash Scripting TUI Calculator Project, with different 3 Modes:\n1.Arithmetic Mode\n2.Scientific Mode\n3.Programmer Mode\n\nYou can find all details here -> https://github.com/ibrahim17397/bash-calculator" 20 90
        main_menu
}


main_menu


