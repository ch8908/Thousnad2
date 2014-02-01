Customize your PageControl just like ViewPagerIndicator
=========

![screenshot](https://raw2.github.com/ch8908/Thousnad2/master/CustomPageControl/SampleImage.png)

##Intrudoction

This project shows you how to use [SMPageControl](https://github.com/Spaceman-Labs/SMPageControl) to customize page control just like ViewPagerIndicator in android.

##Concept

Custom page dot with rect image.

##Code

```objc
    // create dot image
    UIImage* currentPageIndicatorImage = [UIImage imageWithRect:CGRectMake(0, 0, indicatorWith, VIEWS_PAGE_CONTROL_HEIGHT)
                                                          color:[UIColor hexARGB:0xFFFF6666]];

    UIImage* pageIndicatorImage = [UIImage imageWithRect:CGRectMake(0, 0, indicatorWith, VIEWS_PAGE_CONTROL_HEIGHT)
                                                   color:[UIColor hexARGB:0xFF333333]];

    // set custom image                                                   
    [self.pageControl setCurrentPageIndicatorImage:currentPageIndicatorImage];
    [self.pageControl setPageIndicatorImage:pageIndicatorImage];
```

##Requirements
* iOS >= 5.0
* ARC

[View the original post](http://ch89-8-blog.logdown.com/blog/2014/01/31/customize-your-pagecontrol/)