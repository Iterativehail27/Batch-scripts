Directory for Diskpart_fat_16 batch file and all associated files

# "This file will format your drive into a fat 16 file system compatible drive, it will set the primary partition size to 4gb and erase all data on the drive."

# The file comes with an instruction set that is written in the CMD line within the diskpart tool. The script asks for user input such as selecting a drive NUMBER, not letter, after the "list disk" command is run behind the scenes. Any invalid inputs may lead to the script crashing." 

# "The script requires administrative mode to run properly."

# "Currently :D only exists to match a != y statement, however it does not function properly at the moment, currently it exits the script if you give a value other than (Y,y,N,n). I may update this in the future but I left it in for anyone who wants to redirect invalid inputs back to the start of the script without quitting the script and re-running it.
