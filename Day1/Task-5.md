## Task 5: Read and process user input in a script.

- For simple user input with a prompt text (-p) :

```bash
read -p "Enter your name : " name
echo "Hello $name."
```

- For password entry (-s) :

```bash
read -sp "Enter your password : " password
echo "Password entered successfully. Password is $password."
```

- For changing the seperator for input variable (IFS) :
```bash
IFS="," read -p "Enter name, age, city and country : " name age city country
echo "Name : $name"
echo "Age : $age"
echo "City : $city"
echo "Country : $country"
```

- For input of array elements (-a) :

```bash
read -a array -p "Enter the elements of array : "
for n in ${array[*]};
do
    echo "$n"
done
```

- For timed input (-t) :

```bash
read -p "Enter the name : " -t 8 name
echo -e "\nName : $name"
```

- For limiting length of input (-n)
```bash
read -n 6 -p "Enter the name : " name
echo -e "\nName : $name"
```