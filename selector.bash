#!/usr/bin/env BASH
set -x
# 0 create second list
# 1 read the first list
# 2 host each hostname from first list get IP and write IP to IP colomn of second list
# 3 host each IP from first list get HOSTNAME and write HOSTNAME to HOSTNAME colomn of second list
# 4 diff, sort first list to second list and generate the change
























# # Definition variables
# selector0=$0
# selector1=$1
# host_name="$(awk {$1})"
# i_p="$(awk {$2})"


# touch selector1
# cat $host_name


# sort file0 && sort file1;

# i_p="$(awk '{print $(NF-1);}' selector0)"
# # #host_name="$(awk '{print $(NF-0);}' selector0)"

# # # get information from first column
# # $i_p > file_arrange_ip

# # get information from second column
# #$host_name > file_arrrange_hostname

# #
# #while read -r file_arrange_ip; do host "$file_arrange_ip"; donew
# #cat selector0|
# #awk '{print $(NF-1);}' selector0 > bob | while read line ; do host line ; done

# #for file in

# #ls -1 | sed 's/^\(.*\)$/echo \1/'

# #ls -1
# #cat selector0 | while read file_arrange_ip ; do host $file_arrange_ip ; done

# #while read $i_p ; do host $i_p ; done



# #
# #cat file_arrrange_hostname | xargs -n1 host

# so="$(awk '{print $(NF-1);}' selector0)"

# while read -r LINE; do
#     host "$LINE"
#     done < $so > selector1


# selector0=$1
# selector1=$2

# # exec 4> "$selector1"

# # while read -ru 3 selector0; do
# #     host "$selector0" >&4
# # done 3< "$selector0"


# readarray -t selector0 < "$selector0"
# for selector0 in "${selector0[@]}"; do
#     ...
# done

awk '{print $(NF-1);}' selector0 > selector1

selector1 xargs -I{} -d'\n' host {}
