#!/bin/bash

read -p "Enter Your Name: "  name
echo "Welcome $name!"

PS3='Please enter your choice: '

                echo "What do you want to do?"
                echo "   1) Add a new user"
                echo "   2) Remove an existing user"
                echo "   3) List users"
                echo "   4) Exit"
                read -p "Select an option [1-4]: " option
                case $option in
                        1)
                        #Invoke terraform script to add user
                        echo ""
                        read -p "User Name: " name
                        bash /root/iam/useradd.sh $name
                        exit
                        ;;
                        2)
                        #AWS cli to remove useri
                        echo ""
			read -p "User Name: " Username
                        bash /root/iam/userdel.sh $Username           
                        exit
                        ;;
                        3)
                        echo ""
                        aws iam list-users|grep -i username
                        exit
                        ;;
                        4)
                        echo "Thanks for using"
                        exit
                        ;;
	esac
done
