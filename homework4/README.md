
### Homework 4 

In this project I decided to try [SnapKit](http://snapkit.io/) so I added it via cocoapods.  I've actually never tried to add constraints via pure Swift before so I don't have that to compare it to, but I did enjoy the syntax of SnapKit

**Things I learned**

When you add UI Elements in pure code you lose a lot of the defaults that the storyboard gives you. I had to go in and set a bunch of UI elements basic functionality and styling.  So I created a custom Class that held my UI components and gave them their basic style there.  Then in each View Controllers I updated them as needed.

**Questions I still have**

I tried real hard (in pure Swift code) to make the UITableViewCell hold 2 "columns" using UILabels and it seemed like it worked but I couldn't access the labels and add text to them.  So in the 2nd Pair list view I just ended up concatenating the pair values to a single string.  But I'd still like to figure out how to do it in "columns" inside each cell.

**Note to self** - to reduce future minor frustrations.  When I added the Cocoapod to the existing project I was getting a "cannot load underlying module SnapKit" issue. Before you start using the framework, rebuild the project so that the framework gets added and is accessible. 