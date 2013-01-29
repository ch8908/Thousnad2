//
// Created by Kros on 1/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//

//====== Use your own data controller =======

#import <Foundation/Foundation.h>


@interface PasscodeDataController : NSObject

- (id) initPasscodeData;
- (void) setPasscode:(NSString*) passcode;
- (NSString*) getPasscode;

@end