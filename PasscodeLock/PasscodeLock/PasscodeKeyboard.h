//
// Created by Kros on 1/1/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol PasscodeKeyboardDelegate

@optional

- (void) onNumberClicked:(NSString*) number;
- (void) onBackspaceClicked;

@end

@interface PasscodeKeyboard : UIView

@property (nonatomic, readwrite, assign) id<PasscodeKeyboardDelegate> delegate;

- (id) initKeyboard;

@end