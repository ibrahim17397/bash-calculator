#####################################################Programmer#################################################

#Programmer Operation Menu#

function programmer_fun(){

        choose=$(whiptail --title "Programmer" --menu "\nChoose an Operation:" --cancel-button Back 15 60 4 \
        "1" "Decimal" \
        "2" "Binary" \
        "3" "Octal" \
        "4" "Hexadecimal" 3>&1 1>&2 2>&3)
        case $choose in
        1) dec ;;
        2) bina ;;
        3) oct ;;
        4) hexa ;;
        *) calc_opr ;;
        esac
}

function dec(){

        num=$(whiptail --inputbox "Enter Decimal Number" 10 50 --title "Decimal" 3>&1 1>&2 2>&3)
        if [ "$num" -eq "$num" ]; then
        b=$(echo "obase=2;$num" | bc)
        o=$(echo "obase=8;$num" | bc)
        h=$(echo "obase=16;$num" | bc)
        #h=$(printf '%x\n' $num)
        whiptail --title "Decimal Convert" --msgbox "Conversion for the Decimal ($num): \n\n Binary = $b \n Octal  = $o \n Hex    = $h" 12 55
        programmer_fun
        else
        whiptail --title "Decimal Convert ERROR!" --msgbox "Please Enter Valid Input" 10 50
        dec
        fi
}

function bina(){

        num=$(whiptail --inputbox "Enter Binary Number" 10 50 --title "Binary" 3>&1 1>&2 2>&3)
        if  [[ ! "$num" =~ ^[0-1]*$ ]] || [[ "$num" =~ ^[" "]*$ ]]; then
        whiptail --title "Binary Convert ERROR!" --msgbox "Please Enter Valid Input" 10 50
        bina
        else
        d=$(echo "obase=10;ibase=2;$num" | bc)
        o=$(echo "obase=8;ibase=2;$num" | bc)
        h=$(echo "obase=16;ibase=2;$num" | bc)
        whiptail --title "Decimal Convert" --msgbox "Conversion for the Binary ($num): \n\n Decimal = $d \n Octal   = $o \n Hex     = $h" 12 55
        programmer_fun
        fi
}

function oct(){

        num=$(whiptail --inputbox "Enter Octal Number" 10 50 --title "Octal" 3>&1 1>&2 2>&3)
        if [[ ! "$num" =~ ^[0-7]*$ ]] || [[ "$num" =~ ^[" "]*$ ]]; then
        whiptail --title "Octal Convert ERROR!" --msgbox "Please Enter Valid Input" 10 50
        oct
        else
        d=$(echo "obase=10;ibase=8;$num" | bc)
        b=$(echo "obase=2;ibase=8;$num" | bc)
        h=$(echo "obase=16;ibase=8;$num" | bc)
        whiptail --title "Octal Convert" --msgbox "Conversion for the Octal ($num): \n\n Decimal = $d \n Binary  = $b \n Hex     = $h" 12 55
        programmer_fun
        fi
}

function hexa(){

        num=$(whiptail --inputbox "Enter Hexa Number" 10 50 --title "Hexa" 3>&1 1>&2 2>&3)
        if [[ ! "$num" =~ ^[a-f]?[A-F]?[0-9]*$ ]] || [[ "$num" =~ ^[" "]*$ ]]; then
        whiptail --title "Hexa Convert ERROR!" --msgbox "Please Enter Valid Input" 10 50
        hexa
        else
        num1=`echo $num| tr '[:lower:]' '[:upper:]'`
        d=$(echo "obase=10;ibase=16;$num1" | bc)
        b=$(echo "obase=2;ibase=16;$num1" | bc)
        o=$(echo "obase=8;ibase=16;$num1" | bc)
        whiptail --title "Octal Convert" --msgbox "Conversion for the Hexa ($num): \n\n Decimal = $d \n Binary  = $b \n Octal   = $o" 12 55
        programmer_fun
        fi
}
