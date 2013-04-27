EnlargeTouchArea
=========
##Intrudoction

This project shows you how to enlarge you button touch area.

##Usage
Drag **UIButton+EnlargeArea.h** and **UIButton+EnlargeArea.m** into your project.

create a button, and use the method:
```objc
[enlargeButton setEnlargeEdge:20];
```

###Customization
You may want to custom your own touch area. All directions are possible.

In <code>setEnlargeEdgeWithTop:</code> method, set the size of top, right, bottom, left you want.

You can easily customize your touch area of button.

##Requirements
* iOS >= 4.3
* non-ARC

[View the original post](http://ch8908.github.io/blog/2013/04/20/uibutton-hit-area/)