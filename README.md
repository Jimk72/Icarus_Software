# Icarus_Mod_manager

10/15/22 Updated Mod Manager 

Vers.0.9

Fixed a bug I found when merging mods with item names with same name of other mods.

Added UnrealPak to the folder so no need to download seperately. 

Added search for files for new installs. When ran for the first time it will not search for the Icarus install and auto setup!

Added more options when rightclicking an extracted mod:

1. Rename Mod: This allows you to rename the mod. It changes the mods folder name and the json mods name So you dont have to manualy go through the files to do this anymore.

2. Copy Mod: Use this if you want to make changes to a mod but dont want to mess up the original, or if you want to create a similar mod to one that you already have.

3. Refresh: This refreshes the list of Extracted mods. Incase it didnt auto update.

Also added a right click menu in the Mods to Install list. Remove: This will remove the mod from the list so you dont have to start all over if you click on the wrong mod. Does not remove mod from mod manager, only from this list!

Added a right click menu to the "Install All Listed Mods" button.

1. Create new mod from list: This will allow you to merge the listed mods and create a new mod with a new name! So instead of IMM_Merged_Mod_P it will be whatever name you give it. Example: Online_Combo, or Offline_Exotics ect.. 

2. Create PAK files from list: Selecting this allows you to select a folder of your choice and will PAK each mod in the list in its own PAK file and place in the folder you selected. This Is used for when you want to update your mods to the new week and share them. Just put all the ones you want in the Mods to Install list and select and they will all be updated and added to the folder you choose.



9/29/22 Latest version of Mod Manager Uploaded

Vers.0.8

Fixed Issue with files having same name as mod.

Fixed Issue of added mods not showing up in mods folder in UI.

Removed Add Mod to Game button! 

Added more options when rightclicking an extracted mod:

1. Add mod to Game, paks and places mod in games mods folder.(Replaced the old Add Mod to Game) button
            
2. Edit Mod, Brings up a mod editor and allows fast editing by clicking the files in mod and then selecting the item to edit will take you right to the spot in the mod file. Make sure you click Save Changes!
3. Delete, This deletes the mod from mod manager.
            
Added several new extracted mods.

Updated Mod Editor to latest version. This is what I use to create my mods fast. 



8/29/22 Latest version of Mod Manager Uploaded

Vers.0.7

Added New editor for extracted mods. Right click extracted mod and select edit to bring up the editor.

Fixed issue with mod names containing _P

Updated the way the program acts when a new user runs it for the first time. Now it makes you edit the settings and then confirms you selected the right folder.

Added more info for when an error happens.

Vers.0.6

Last version was a total re-write of extractor, This is a total re-write of the import/merge function. This version Extracts/Imports at the Items Values instead of just complete Items. This should fix issues where the Devs add a new value to an item(like attachments) causing the mod to break. It now will only extract the changed value of an item. This is only one level down so only the main values of each item. 

Example:
old version would extract:



{
            "Name": "Exotic",
            "ResourceType": {
                "RowName": "Meta_Resource"
            },
            "MiningTimeSeconds": 10,
            "Metadata": {
                "bIsDeprecated": true
            },
            
            
New version only extracts:


{
            "Name": "Exotic",
            "MiningTimeSeconds": 10
            },



So If they were to add a new value to Exotic the old version would ignore this new value possibly causing new missions to be unfinishable. The new version finds the value "MiningTimeSeconds" and only changes that.

Streamlined how mods were merged! All mods are now merged together and then re-imported into the game files. This drasticly reduces time to merge several mods into one and import to game.

Added support for mods to have ImageOnly.png this will load the image into Mod Manager and allow it to be scrolled down. The Width can only be 560 px but the height can be more just like the text and just mouse wheel scroll down to see more of the image.

Added a blend image over the banner image to help blend thing into the UI.

Added the option to choose when a conflicting json change is found. The two different versions of the Items value will be displayed and you can choose the version you want to add. If you dont want to choose you can select default and it will merge them the old way by order they were added. 

Added a pdf version of the instructions as well as a version in the mod manager that always displays at start up. Almost every issue people reported to me were user error so I am trying to eliminate those with providing as many ways to read directions as possible.

Added as many error catches as possible. Most errors are user/mod errors so I tried to show why the error occured so the user will better understand what went wrong.

Ive extracted every mod I could find and imported/merged them many different ways and had no issues so hopefully that holds true with new users.


8/19/22 New version on Mod Manager.

Vers.0.5

Rebuilt the entire way the extractor recreates the folder structure. It now uses the unpaked data folder from game to find each json file and then places the file in the correct folder for extraction. This should eliminate any issues with importing json mods that were packed at a folder other than data. Uasset mods are still extracted based off file structure of mod So when creating them the folder structure should contain the data folder in the PAK file.

sample_mod_name\data

sample_mod_name\BP\Objects\World\Items\Deployables\Extractors\BP_Extractor.uasset

Streamlined the extraction process to help eliminate possible errors from faulty mods.

Extensive testing with as many pak files/mod folders as I could download. 

Researching the possibility of extracting items json at a more line by line instead of item only. This would allow better compatability when they update a part of an item. As it is now extraction is at a per item level. Each json file has rows of items and if any setting in an item is changed then the whole item is extracted. I designed is this way as every json file structure is based on a single row with items listed. Makes an extraction process the same for all files, simplifying the process.


Vers.0.4

Reminder that mods with the data folder included work best!

Changed the way mods were Extracted to help remove issues. 

Fixed issue with Extracting from a PAK file with no data folder.

Fixed bug I found when importing a mod folder with files that are not part of original game.

Total rewrite of parsing/json text formating. Modded files should be same format as originals.

Fixed issues with dialogs in json.

Added image only support. This will display the image in the mod folder called ImageOnly.png. added some in the mod manager folder for examples.
Paste the ImageOnlyFade over your image in your photo editor to give your image a nice fade in.


7/24/22 Uploaded new version of Modmanager.

Vers.0.3
Fixed Bug the would duplicate files when importing a mod folder with no data folder.

Complete revamp of UI to a more Icarus theme!

7/10/22 Changed name to Icarus_Software, added description of mod manager.

Vers.0.2

Features: Auto update non uasset mods to current week and adds them to the game. Can merge mutiple mods into 1. 

Setup: 
When you first run it there will be a popup asking you to update settings and it looks for an unpacked data folder from game. So you may get a file not found message. This is normal. Once running select Edit from the main menu at top and click Settings. Here you need to select the Content folder for Icarus. It shows you just above the location it normaly is in. After That you need to select the UnrealPak.exe file that you downloaded from the discord Tools section. Then click save and close settings.*** you now need to exit program and restart it so it can load the settings data!! ***

Once you restart the program it may notify you your data folder is outdated. Click ok and it should unpak the data folder from the game. If it doesnt you can just click Update data folder on the right hand side.

Very important!! DO NOT change the folders that are created with the Mod Manager! It will create a data folder from the games data.pak file and each mod that is added will have a *.EXMod file in the extracted mods folder and a corrisponding folder with the mods name that contains the mods files. 

The User Interface: 
   The list on the left is all the extracted mods that have been added to the mod managed. The list on the lower right is a list of currently installed mods in the games mods folder. Once you click on an extracted mod the Add Mod to Game button will be enabled and a list of all the files the mod uses will be shown as well as the info from the readme.txt file if the mod has one. This helps when checking for compatibility of mods. If they contain the same file they are not compatible but can be merged into one mod using this program. At the bottom of the screen is the log info that explains what is going on.

How it works:
   To add a mod to the manager you click on Extract Mod from Folder. Select your mods folder and click select folder. Then give it a unique name(no spaces!) and click Add/Create. This will use the files in the extracted data folder to compare the files in your mod and extract only the modified items and create a new single file that is added to the mod manager. This file never needs updating. You just need to update the data folder after every game update. Repeat this for each mod you want to add to the manager. To add a mod to game just select the Mod on the left and click the button Add Mod to Game. This will take the extracted mod data and reimport it into the updated data files from the game and then repack it and place in the games mods folder. To remove mods from the games mods folder just click on the Remove All Mods From Game. This just deletes the PAK files in the games mods folder.

Folders used:
   The mod manager copies the folder from any added mod to its own folder. This allows mods that also contain uasset files to still use them when the program Paks the mod. You should also see a folder called data. This is the extracted data folder from the game. It contains all the updated json files from the game. Its important that you update your data folder anytime there is a game update. Just run the program and you should get a notification that there is an update and then select Edit and then Update data folder. All Extracted mods are in the extracted mods folder.

Extracted Mods:
   These are single files that contain all the modified json for the mod. The structure is standard json and lists ModName and then an array of files that have changes and then the items modified as a json array. You could edit these just like the json files in the mod but they will only contain the items that have been originaly moddified when you extracted the mod. All the extracted mods are in the Extracted mods folder.

Create a merged mod from several other mods:
   To add several mods to game make sure the Mods to Install list is clear, if not click the Clear List button. Double click the Extracted mods from the list on the left with the least priority mod you want to add. Continue adding mods from least priority to highest priority. The last mod you add has the highest priority and will be merged last. Once you have all the mods added you want click on the install All Listed Mods button and it will begin to merge each mod back into the updated json files in order from top to bottom. This also copies any UASSET files in the same order and adds them to the mod. Once all mods have been added it creates a Folder called IMM_Merged_Mod and paks this and places it into your games mods folder and your ready to play. This IMM_Merged_Mod folder can also be added to mod manager by clicking the Extract Mod from Folder button and selecting this folder then give it a unique name and add/create it. Now you dont need to merge the mod again as its a mod all on its own.

6/11/22 fixed some memory leaks in modmanager beta.

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

