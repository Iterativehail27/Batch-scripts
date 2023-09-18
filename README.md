# Batch-scripts
This file contains batch scripts that are in no sorted order or arranged for any purpose, they are custom batch scripts made to perform very specific jobs but if you find that they work for your installation for a similar purpose feel free to use them, just note that certain parameters may need to be changed such as the names of directories or files.
<br>

# Automation
All batch scripts are saved as .bat files instead of .txt files and therefore they contain scripts within a file that can be executed to run commands on your system which also means that they can be automated to run. all of the .bat listed here in this respository can be run through the same process as described below to set up a basic template for automating the script.
<br>

<h3>1. Go to the windows start button search bar and type "Task Scheduler" click on it to open the application. </h3>
<h3>2. On the right side "actions" panel select "create task" </h3>
<h3>3. Give your task a name and description so you remember what it was for, also determine if you need elevated permissions to run this task then check the box at the bottom "run with highest privleges" if required, alternatively select a user group with valid permissions.</h3>
<h3>4. Set the trigger for the task in the next tab "triggers" select new to create new criteria to tell the system to activate after a certain time period or condition has been met </h3>
<h3>5. Set the action that will take place once the trigger has been met on the "actions" tab this will typically be where you point the task to your script or .bat file with the action "start a program" </h3>
<h3>6. Set power/network/idle conditions in the "conditions" tab. These are for advanced users and are not required but can be tuned for specific needs.</h3>
<h3>7. In the "settings" tab pay close attention to the options as these affect the overall behavior of your task. These settings determine when the task should retry if it misses its scheduled time or when it should cease operating if it forms an endless loop etc. Be very careful with these and know how the .bat operates before checking any of these boxes.</h3>
<br>
<br>
<h3>That's all for now!</h3>
