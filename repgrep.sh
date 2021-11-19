#!/bin/bash

# init the default grep with color enabling
grep_command="grep --color=always ";

# import all of the command arguements 
args_joined="$*";

final_grep_command="${grep_command} ${args_joined}"

# the delta (in seconds) we will run the grep commands
rep_time=10;

# code for fetching the rep time
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
# end of code fetching the rep time

# run the grep commands
rep_counter=0;
echo "............. repgrep: ${final_grep_command} ............."
echo
while true
do
   echo "............. repgrep: iteration number - ${rep_counter}, time elapsed - $((rep_counter*rep_time))[sec] ............."
   echo
   # execute the command
   $final_grep_command
   # sleep for rep_time
   sleep $rep_time;
   ((rep_counter = rep_counter + 1))
   echo 
done
 
