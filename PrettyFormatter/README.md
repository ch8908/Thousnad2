Pretty formatter
=========

##Introduction

This project shows you how to use **NSCalendar** and **NSDateComponents**, and set the ***date formate*** for **NSDateFormatter**.

more information about ***date formate***:
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

it's very easy to use;

--

