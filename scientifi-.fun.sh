##################################################scientific#################################################
#scientific Operations Menu#
function scientific_fun(){

        choose=$(whiptail --title "Scientific" --menu "\nChoose an Operation:" --cancel-button Back 15 60 6 \
        "1" "Right Shift" \
        "2" "Left Shift" \
        "3" "AND" \
        "4" "OR" \
        "5" "XOR" \
        "6" "NOT" 3>&1 1>&2 2>&3)
        case $choose in
        1) r_shift ;;
        2) l_shift ;;
        3) and ;;
        4) or ;;
        5) xor ;;
        6) not ;;
        *) calc_opr ;;
        esac
}

#R_Shift Funcrion#
function r_shift(){
	
	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "R_Shift" 3>&1 1>&2 2>&3)
        num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "R_Shift" 3>&1 1>&2 2>&3)
        if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
	s=`echo $(($num1 >> $num2))`
        whiptail --title "R_Shift Result" --msgbox "$num1 >> $num2 = $s" 7 40
        scientific_fun
        else
        whiptail --title "R_Shift ERROR!" --msgbox "Please Enter Valid Input" 10 50
        r_shift
        fi	
}

#L_Shift Function#
function l_shift(){
	
	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "L_Shift" 3>&1 1>&2 2>&3)
        num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "L_Shift" 3>&1 1>&2 2>&3)
        if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
        s=`echo $(($num1 << $num2))`
        whiptail --title "L_Shift Result" --msgbox "$num1 << $num2 = $s" 7 40
        scientific_fun
        else
        whiptail --title "L_Shift ERROR!" --msgbox "Please Enter Valid Input" 10 50
        l_shift
        fi	
}

#AND Function#
function and(){
	
	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "AND" 3>&1 1>&2 2>&3)
        num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "AND" 3>&1 1>&2 2>&3)
        if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
	s=$((num1 & $num2))
        whiptail --title "AND Result" --msgbox "$num1 [AND] $num2 = $s" 7 40
        scientific_fun
        else
        whiptail --title "AND ERROR!" --msgbox "Please Enter Valid Input" 10 50
        and
        fi
		
}

#OR Function#
function or(){
	
	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "OR" 3>&1 1>&2 2>&3)
        num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "OR" 3>&1 1>&2 2>&3)
        if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
        s=$(($num1 | $num2))
        whiptail --title "OR Result" --msgbox "$num1 [OR] $num2 = $s" 7 40
        scientific_fun
        else
        whiptail --title "OR ERROR!" --msgbox "Please Enter Valid Input" 10 50
        or
        fi
	
}

#XOR Function#
function xor(){
	
	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "XOR" 3>&1 1>&2 2>&3)
        num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "XOR" 3>&1 1>&2 2>&3)
        if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
        s=$(($num1 ^ $num2))
        whiptail --title "XOR Result" --msgbox "$num1 [XOR] $num2 = $s" 7 40
        scientific_fun
        else
        whiptail --title "XOR ERROR!" --msgbox "Please Enter Valid Input" 10 50
        xor
        fi
	
}

#NOT Function#
function not(){
	
	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "NOT" 3>&1 1>&2 2>&3)
        if [ "$num1" -eq "$num1" ]; then
        s=$((~$num1))
	whiptail --title "Result" --msgbox "NOT($num1) = $s" 7 40
        scientific_fun
        else
        whiptail --title "ERROR!" --msgbox "Please Enter Valid Input" 10 50
        not
        fi	
}

