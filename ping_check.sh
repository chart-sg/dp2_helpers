#!/bin/bash
bold=`tput bold`
normal=`tput rmso`

while true
input="./ip-list"
do
    clear
    while IFS= read -r line
    do
        A="$(cut -d',' -f1 <<<$line)"
        B="$(cut -d',' -f2 <<<$line)"
        ((count = 1))                          
        while [[ $count -ne 0 ]] ; do
            ping -c 1 $A  &>/dev/null                    
            rc=$?
            if [[ $rc -eq 0 ]] ; then
                ((count = 1))                      # If okay, flag to exit loop.
            fi
            ((count = count - 1))                  # So we don't go forever.
        done

        if [[ $rc -eq 0 ]] ; then                  # Make final determination.
            echo "$B is up at $A."
        else
            echo -e "\033[36m$B is down.\033[0m"
        fi

    done < "$input"
    sleep 5
done