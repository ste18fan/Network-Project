import os

print("googoogaga")

# Prompt user to choose between creating a new folder or using an existing one
create = input("1.) Create a folder to store these passwords, 2.) Store in existing folder: ")
if create == "1":
    # Create a new folder
    folder_name = input("Make a name for the folder you can find this all in: ")
    os.makedirs(folder_name, exist_ok=True)
    print(f"If you go looking for these they will be inside of '{folder_name}'")
elif create == "2":
    # Use an existing folder
    folder_name = input("Enter name of existing folder: ")

# Prompt user for password details
specify = input("Name of password designation (basically what is it for): ")
password = input("Password: ")

# Combine the designation and password
combine = specify + ": " + password
file_name = "passwords.txt"
file_path = os.path.join(folder_name, file_name)

# Write the combined string to the file
with open(file_path, 'a') as file:
    file.write(combine + '\n')

print(f"Password saved in '{folder_name}'")

#f is for formattting strings  
