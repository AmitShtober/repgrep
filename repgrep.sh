#!/bin/bash

# init the default grep with color enabling
grep_command="grep --color=always ";

# import all of the command arguements 
args_joined="$*";
new_args_joind=();
# the delta (in seconds) we will run the grep commands
rep_time=10;

#fetching the rep_time and create new list of the relevan args
next=0;
for ((i=1; i<=$#; i++))
do
   if [ "$next" == "1" ]; then
	rep_time=${!i};
	next=0;
   elif [ "${!i}" == "-rep" ]; then
	next=1;
   else
	new_args_joind+=(${!i});
   fi
done

final_grep_command="${grep_command} ${new_args_joind[*]// /|}"

# run the grep commands
rep_counter=0;
echo "............. repgrep: ${final_grep_command} , every ${rep_time} [sec] ............."
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
 
