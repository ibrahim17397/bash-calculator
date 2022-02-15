#####################################################Arithmetic######################################################
#Arithmetic Operations Function#
function arith_fun(){
        choose=$(whiptail --title "Arithmetic Operations" --menu "\nChoose an Operation:" --cancel-button Back 17 60 7 \
        "1" "Addition(+)" \
        "2" "Subtraction(-)" \
        "3" "Multiplication(*)" \
        "4" "Division(/)" \
        "5" "Power(^)" \
        "6" "Modulus(%)" \
        "7" "Factorial(!)" 3>&1 1>&2 2>&3)
        case $choose in
        1) add ;;
        2) sub ;;
        3) mul ;;
        4) div ;;
        5) power ;;
        6) mod ;;
        7) fact ;;
        *) calc_opr ;;
        esac
}

#ADD Function#
function add(){

	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "ADD" 3>&1 1>&2 2>&3)	
	num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "ADD" 3>&1 1>&2 2>&3)
	if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
	a=`echo "scale=2; $num1+$num2" | bc`
	whiptail --title "ADD Result" --msgbox "$num1 + $num2 = $a" 7 40
	arith_fun
	else
	whiptail --title "ADD ERROR!" --msgbox "Please Enter Valid Input" 10 50
	add
	fi
}

#Subtraction Function
function sub(){

	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "SUB" 3>&1 1>&2 2>&3)
	num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "SUB" 3>&1 1>&2 2>&3)
	if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
	s=`echo "scale=2; $num1-$num2" | bc`
	whiptail --title "Subtraction Result" --msgbox "$num1 - $num2 = $s" 7 40
	arith_fun
	else
	whiptail --title "Subtracrion ERROR!" --msgbox "Please Enter Valid Input" 10 50
	sub
	fi
}

#Multiplication Function#
function mul(){

	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "Multi" 3>&1 1>&2 2>&3)
	num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "Multi" 3>&1 1>&2 2>&3)
	if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then	
	m=`echo "scale=2; $num1*$num2" | bc`	
	whiptail --title "Multiplication Result" --msgbox "$num1 * $num2 = $m" 7 40
	arith_fun
	else
	whiptail --title "Multiplication ERROR!" --msgbox "Please Enter Valid Input" 10 50
	mul
	fi
}

#Division Function#
function div(){
	
	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "DIV" 3>&1 1>&2 2>&3)
	num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "DIV" 3>&1 1>&2 2>&3)
	if [ $num2 = 0  ]; then
	whiptail --title "Division Result" --msgbox "can't Devide by 0" 10 50
	div
	fi
	if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
	d=`echo "scale=2; $num1/$num2" | bc`
	whiptail --title "Division Result" --msgbox "$num1 / $num2 = $d" 7 40	
	arith_fun
	else
	whiptail --title "Division ERROR!" --msgbox "Please Enter Valid Input" 10 50
	div	
	fi
}

#Power Function#
function power(){
	
	num1=$(whiptail --inputbox "Enter Number" 10 50 --title "Power" 3>&1 1>&2 2>&3)
        num2=$(whiptail --inputbox "Enter Power" 10 50 --title "Power" 3>&1 1>&2 2>&3)
        if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
        p=`echo "scale=2; $num1^$num2" | bc`
        whiptail --title "Power Result" --msgbox "$num1 ^ $num2 = $p" 7 40
        arith_fun
        else
        whiptail --title "Power ERROR!" --msgbox "Please Enter Valid Input" 10 50
        power
        fi
}

#Moduls Function#
function mod(){
	
	num1=$(whiptail --inputbox "Enter Number1" 10 50 --title "Modulus" 3>&1 1>&2 2>&3)
        num2=$(whiptail --inputbox "Enter Number2" 10 50 --title "Modulus" 3>&1 1>&2 2>&3)
        if [ "$num1" -eq "$num1" ] && [ "$num2" -eq "$num2" ]; then
	m=`echo "$num1%$num2" | bc`
        whiptail --title "Modulus Result" --msgbox "$num1 mod $num2 = $m" 7 40
        arith_fun
        else
        whiptail --title "Modulus ERROR!" --msgbox "Please Enter Valid Input" 10 50
        mod
        fi
}

#factorail Function#
function fact(){
	
	num=$(whiptail --inputbox "Enter Number" 10 50 --title "Factorail" 3>&1 1>&2 2>&3)
        if [ "$num" -eq "$num" ]; then
	facto=1
	counter=$num
	while [[ $counter -gt 0 ]]; do
   	facto=$(( $facto * $counter ))
   	counter=$(( $counter - 1 ))
	done
	whiptail --title "Factorial Result" --msgbox "!($num) = $facto" 7 40
        arith_fun
        
	else
        whiptail --title "Factorial ERROR!" --msgbox "Please Enter Valid Input" 10 50
        fact 
        fi
}
