//
// Created by Kros on 1/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "AbstractPasscodeLockViewController.h"


typedef void (^CompletionBlock)(void);

@interface VerifyPasscodeViewController : AbstractPasscodeLockViewController
- (id) initVerify:(CompletionBlock) complete;


@end
