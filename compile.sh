#!/bin/bash
#Date: 03/26/2018
#Author: Eva Cedent
#Co-Author: Joel Turbi

#Description: A general Shell script file to automate compiling of c++ program(s) 

echo
echo "**********************************************************"
echo "****   Welcome to the C++ compile & execute program   ****" 
echo "**********************************************************"
#Lists the files in the current directory
echo "Here are the list of current files in $PWD :"
echo
for files in $PWD'*';
do
	ls -a $files
	echo
done
echo "**********************************************************"
echo
echo "Please enter the name of the .cpp file you want to compile: " 

read name

fileName=${name%.*}.out #Reads file name from left to right up until the '.' 

g++ -o $fileName $name  #Compiles & makes object file

echo
echo "Your file $fileName has been created"
echo
#Runs created '.out' object file or quits script based on users choice
echo "Would you like to run $fileName (Y/N) ? "

read answer

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
	echo "Here is the output from $fileName : "
	echo "***************************************************"
	echo
	./$fileName
	echo
	echo "***************************************************"
	#Performs a mild clean-up by deleting '.out' file based on users choice
	echo "Would you like to remove the $fileName (Y/N) ?"
	read input
	if [ "$input" = "y" ] || [ " $input " = "Y" ]; then
		rm -f $fileName
	elif [ "$input" = "n" ] || [ "$input" = "N" ]; then
		echo "Goodbye!, Until Next Time :)"
		exit
	fi

elif [ "$answer" = "n" ] || [ "$answer" = "N" ]; then
	echo "Goodbye!, Until Next Time :)"
	exit
fi
