#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the
# setuid file list including having a title
# use the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files should be sorted by their group

# Task 2 for the exercise is to modify it to also display the 10 largest regular files in the system, sorted by their sizes
# The listing should only have the file name, owner, and size in MBytes and be displayed after the listings of
# setuid and setgid files and should have its own title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired





# to set title for setuid files
echo "Setuid files:"
# to get line under setuid files
echo "============="


# to find list of files and redirct eoors in to null floder
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3
echo ""

# title for setuid files
echo "Setgid files"
# line under setuid files
echo "============="

# Setgid files that has two octet values and setuid has four tooo.
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 3
echo ""
# 18 large files
echo "The 10 largest file on the system"
echo "============"

# type -f will only find file, ls -l for list of the file, block size is to get out put inmb
# sort -rh for reverse order list in human readble figures and awk to display 3 , 5 and last field of the output
find / 2>/dev/null -type f -exec ls -l --block-size=M {} + | sort -rh -k 5 | head -n 10 | awk '{print $5, $3, $9}'
