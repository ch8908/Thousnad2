//
//  ViewController.m
//  EnlargeTouchArea
//
//  Created by Huang ChienShuo on 4/27/13.
//  Copyright (c) 2013 ThousandSquare. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+EnlargeArea.h"

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    UIButton* enlargeButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [enlargeButton1 setTitle:@"Enlarge Button" forState:UIControlStateNormal];
    [enlargeButton1 setFrame:CGRectMake(90, 150, 100, 50)];
    [enlargeButton1 addTarget:self action:@selector(onButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [enlargeButton1 sizeToFit];
    [self.view addSubview:enlargeButton1];

    [enlargeButton1 setEnlargeEdgeWithTop:20 right:20 bottom:20
                                     left:0];

    UIButton* enlargeButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [enlargeButton2 setTitle:@"Enlarge Button" forState:UIControlStateNormal];
    [enlargeButton2 setFrame:CGRectMake(90, 260, 100, 50)];
    [enlargeButton2 addTarget:self action:@selector(onButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [enlargeButton2 sizeToFit];
    [self.view addSubview:enlargeButton2];

    [enlargeButton2 setEnlargeEdge:20];
}

- (void) onButtonTap:(UIButton*) sender
{
    NSLog(@">>>>>>>>>touch button:%@", [sender titleForState:UIControlStateNormal]);
}

@end
