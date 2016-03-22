## Homework 7 
### assignment 6? 
**Saving and reading small amounts of data to local file and settings**

Not much different from what we learned in class but it was definitely good to go over it again.

**View 1**

Using NSUserDefaults to read the settings that were being created in the AppDelegate.  

**View 2**

Using NSUserDefaults to read the settings that the user could alter for the app in the iOS settings menu

**Class: Helpers.swift**

I created a class that abstracted the writing and reading of text files.  All, or parts, of this class was used in Views 3 through 6

**View 3 & 4**

Writing to text file `vc3.txt` using my Helpers class.  I used prepareForSegue and checked the destination ViewController title to make sure it was the proper segue.

Reading from text file `vc3.txt` using my Helpers class

**View 5 & 6**

Writing to `fivevc.plist` in View 5 and then reading it in View 6

