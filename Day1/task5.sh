#!/bin/sh

read -p "Enter your name : " name
echo "Hello $name."

read -sp "Enter your password : " password
echo "Password entered successfully. Password is $password."

IFS="," read -p "Enter name, age, city and country : " name age city country
echo "Name : $name"
echo "Age : $age"
echo "City : $city"
echo "Country : $country"

read -a array -p "Enter the elements of array : "
for n in ${array[*]};
do
    echo "$n"
done

read -p "Enter the name : " -t 8 name
echo -e "\nName : $name"

read -n 6 -p "Enter the name : " name
echo -e "\nName : $name"