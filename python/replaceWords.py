#!/usr/bin/env python3

f = open("/home/user/Desktop/ctf/lfi-list.txt", "r")

for i in f:
	replace = i.replace("{FILE}", "etc/passwd")
	print(replace)
