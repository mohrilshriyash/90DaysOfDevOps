#!/bin/bash

# User Management includes different Features 



echo " ######### USER MANAGEMENT #############
       Select sutible options to perform tasks
       1. Account Creation
       2. Account Deletion
       3. Passoword Reset
       4. List User Account
       5. Help


       
  "
  read -p "Choose an  Option (1-5) to perform desired operation: " opt




## checking operation to perform based on user input

if [ $opt -eq 1 ]; then

	#### Account Creation ############
	echo "User Acc Creation"
	read -p "Enter the username which you want to create: " username

                ## User Exists Check
	     if grep "^$username:" /etc/passwd > /dev/null; then
		          echo "User Already Exists"
	     else
			  echo "##### Adding new  user #########"
			  read  -p "Enter your password: " password
 # Create the user with the -m (create home directory) and -s (shell) options
			  sudo useradd -m  $username
# Set the password using the chpasswd command
			   echo "$username:$password" | sudo chpasswd 
			  #
			  echo "User '$username' created with password '$password'"

	     fi
## ***************************************************************************

elif [ $opt -eq 2 ]; then
	  echo "User Acc Deletion"
       
	 read -p "Enter the username which you want to Delete: " username

## Account Deletion ###
#
 ## User Eif grep "^$username:" /etc/passwd > /dev/null; then
 #           echo "###### Deleting User ###########"
 #                      sudo userdel $username
 #                                 echo "$username delete successfully"
 #
 #
 #                                        else
 #                                                  echo "$username does not exits"
 #
 #                                                         fixistt
 #                                                        Check
       if grep "^$username:" /etc/passwd > /dev/null; then
           echo "###### Deleting User ###########"
           sudo userdel $username
	   echo "$username delete successfully"


       else
          echo "$username does not exits"
                                              
       fi

##**************************************************************************

elif [ $opt -eq 3 ]; then
	## Password Reset
	  echo "Password Reset"

if grep "^$username:" /etc/passwd > /dev/null; then
	           echo "###### Reset Password ###########"
		              sudo userdel $username
			                 echo "$username delete successfully"


					        else
							          echo "$username does not exits"

								         fi








## ***********************************************************************
elif [ $opt -eq 4 ]; then
	  ##List user accounts
	  echo "List user accounts"

elif [ $opt -eq 5 ]; then
	  ## Help
	  echo "Help"

else
	  echo "Enter a valid input"

fi


