GData Objective-C Client Example
=========
##Introduction

<img class="left" height=568 width=320 src="https://raw2.github.com/ch8908/Thousnad2/master/GDataExample/ScreenShot.png">

This project shows you how to use Google [GData Objective-C Client](https://code.google.com/p/gdata-objectivec-client/) fetching youtube videos and use **batch processing**.


##How to use:

**Important**

###Two steps for build project

1. You must be enter your own "YouTube Api Key" in the following field. Ensure you can run this project successfully.

(You can generate your key [here](https://developers.google.com/youtube/registering_an_application))

In "YoutubeApiFetcher.m", modify:
```objc
static NSString* YOUTUBE_API_V2_KEY = @"** Your YouTube API Key **";
```

2. Install dependency by using cocoapods. Change directory to project directory, and input:
```
pod install
```

That's it!

##Requirements
* iOS >= 6.0
* ARC

[View the original post](http://ch89-8-blog.logdown.com/blog/2014/02/04/gdata-objective-c-client-introduction)