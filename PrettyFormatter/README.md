PrettyFormatter
=========

##Introduction

{% img center https://github.com/ch8908/Thousnad2/blob/master/PrettyFormatter/exampleImage.png %}


This project shows you how to use **NSCalendar** and **NSDateComponents**, and set the ***date formate*** for **NSDateFormatter**.

For more information about ***date format***:  
[Unicode Date Format Patterns](http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns "Optional Title")

PrettyFormatter class contains two kinds of format:
* Twitter time format
* Facebook time format

##How to use
Just Import **PrettyFormatter.h**

```objc
#import "PrettyFormatter.h"
```


And use it's class methods. For example:
```objc
label3.text = [PrettyFormatter twitterFormat:[NSDate dateWithTimeIntervalSinceNow:-60 * 60]];
```

It's very easy to use;

--

