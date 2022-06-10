# Icarus_Mod_Editor

6/9/22
Uploaded Beta of the Mod Manager. Have not had time to create instructions. So here is a quick rundown. To use you need to import your mod and create an Extracted version of your mod. This is a single file that containes all the json from all files that does not match(has been modified). It is very important that the data folder in this programs folder is the same version of your mod you are importing! Once the mod is imported then it doesnt matter. Your exported mod does not need updating. When a new update is installed from the game, simply click the Update data folder and this will unPAK the games NEW data folder in the programs directory. To add an exported mod to your game just select it in the list on the left and then click the Add Mod to Game button. This will take the modified items in the Extracted mod and merge them back into the update data files and create an up to date mod that is then PAKed and placed into the game mods folder.

5/29/22  
Uploaded ver 1.0 of Editor.

Avail in program under help!
Tabs:

Player Crafter: Currently Disabled!

JSON Editor:
This is used for editing any json file in your mod data folder. Clicking on the refresh loads a list of all files in your data folder.

Once files are loaded simply click the file you want to edit and a list of all the items in that file will display and the file will be loaded into the editor. To scroll to an items position in the editor simply click on the item in the list.

On the far right is a note pad that you can utilize to paste text or notes for future use. All text in that Notepad is saved when you exit so it will always be avail for reference. Use it however you want.

Once you have made changes to the file make sure you save the changes before loading another file!


Compare JSON Files:
This is used to see a list of all the items that have been changed in all the mod files. It parses all the JSON in each file inside the mod folder with that of the originals and list any item that does not match. Clicking on that item will load both 
versions so you can compare them.

The Missing items column should remain empty.If items appear here that means the item has been left out of your mod folder. This is usually a result of not properly updating your mod to the latest release of game files. To fix this the 
items must be added to the files in your mod manualy.


Item Inspection:
This page is used to edit the main items in the game. Clicking Re-Load will load every item in game. Then just select the item you want to edit and the D_ItemTemplate and D_ItemsStatic sections will scroll to the items position in the file. 
The items links to other files will also show up in the file list. To edit that part of the item click the file and it will be loaded into the page and scroll to that items section. Dont forget to save your changed before clicking another file!

Example: To edit the workshop furnace(Meta_Furnace_Printed) you can type "printed" in the Filter section then click Re-Load. This will display only items that contain the word printed in it. Next click the Meta_Furnace_Printed item and it 
will show in the 
D_Items slots. To edit the text in D_ItemsStatic just edit it in the window and click the save button above. To edit the Processing part just click D_Processing and the file will be loaded into the editor and scoll to that items position in the 
file. Make changes and then click save.

Notes:
This tab has two notepads that you can paste/copy anything to or add reference notes to. They save when you exit and are reloaded when you start the program again.

REMEMBER to always click save after changes!

PAK Mod button:
This button will pak the mod and place it in your games mods folder. Added this to speed things up when testing. Does not use any bat files. just needs the link to the UnrealPak.exe file.

