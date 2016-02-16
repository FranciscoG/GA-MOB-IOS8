# Homework 3

### Swipe gestures, View Controllers II, and Table Views

There are 2 View Controllers and 1 Table View Controller

**HomeVC**

I embedded the Home View Controller in a Navigation controller but I'm hiding the top navigation bar programmitically on viewWillAppear and un-hiding it on viewWillDisappear because I don't want to see it in the Home view but I want to see it in the Table View

**PicModalVC**

This is view is presented programmatically as an action from the swipe gesture in the Home View. 

**extra:** I'm animating the background color and an animated gif in the image view.

**ArrayTableViewController**

I subclassed the Animal class and using override to change the prettyAnimalName function . 


**Animated Gif Support**

I added animated GIF support using FlipBoard's FLAnimatedImage framework which I installed via cocoapods and used a bridge header file so I could use the Objective-C code within Swift.

https://github.com/Flipboard/FLAnimatedImage