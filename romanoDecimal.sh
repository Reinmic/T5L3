#!/bin/bash

declare -A roman_numerals=( ["I"]=1 ["IV"]=4 ["V"]=5 ["IX"]=9 ["X"]=10 ["XL"]=40 ["L"]=50 ["XC"]=90 ["C"]=100 ["CD"]=400 ["D"]=500 ["CM"]=900 ["M"]=1000 )


echo "Ingresa un número romano (entre 1 y 1999):"
read roman_numeral


if [[ "$roman_numeral" =~ ^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$ ]]; then

    decimal_numeral=0
    

    for (( i=0; i<${#roman_numeral}; i++ )); do

        char=${roman_numeral:i:1}
        val=${roman_numerals[$char]}
        

        if [[ ${roman_numerals[${roman_numeral:i+1:1}]} > $val ]]; then
            decimal_numeral=$((decimal_numeral-val))
        else
            decimal_numeral=$((decimal_numeral+val))
        fi
    done
    

    if [[ "$decimal_numeral" -ge 1 && "$decimal_numeral" -le 1999 ]]; then
        echo "El número decimal es: $decimal_numeral"
    else
        echo "El número romano ingresado no está dentro del rango permitido (1-1999)."
    fi
else
    echo "El número romano ingresado no es válido."
fi