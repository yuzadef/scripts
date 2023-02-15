#!/bin/bash

# Gets a list with 'firstname lastname' and formats them into various username format

if [[ $ == "-h" || $# != 1 ]]; then
	echo "Usage: ctf-wordlist-names names-file"
	exit
fi

if [ -f formatted_name_wordlist.txt ]; then
    echo "[!] formatted_name_wordlist.txt file already exist."
    exit 1
fi

cat $1 | while read line; do
	firstname=$(echo $line | cut -d ' ' -f1 | tr '[:upper:]' '[:lower:]')
	lastname=$(echo $line | cut -d ' ' -f2 | tr '[:upper:]' '[:lower:]')
	echo "$firstname.$lastname
$(echo $firstname | cut -c1).$lastname
$(echo $firstname | cut -c1)-$lastname
$firstname$lastname
$firstname-$lastname
$(echo $firstname | cut -c1-3)$(echo $lastname | cut -c1-3)
$(echo $firstname | cut -c1-3).$(echo $lastname | cut -c1-3)
$(echo $firstname | cut -c1)$lastname
$lastname$firstname
$lastname-$firstname
$lastname.$firstname
$lastname$(echo $firstname | cut -c1)
$lastname-$(echo $firstname | cut -c1)
$lastname.$(echo $firstname | cut -c1)" >> formatted_name_wordlist.txt
done