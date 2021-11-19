#!/bin/bash
grep_command="grep --color=always ";
args_joind="$*";
c="${grep_command} ${args_joind}"
rep_time=10;
 
next=0;
for var in "$@"
do
    if [ "$next" == "1" ]; then
      rep_time=$var;
    fi
    if [ "$var" == "-rep" ];
    then
         next=1;
    else
         next=0;
    fi
done

counter=0;
echo "............. repgrep: ${c} ............."
echo
while true
do
   echo "............. repgrep: iteration number - ${counter}, time elapsed - $((counter*rep_time))[sec] ............."
   echo
   $c
   sleep $rep_time;
   ((counter = counter + 1))
   echo 
done
 
