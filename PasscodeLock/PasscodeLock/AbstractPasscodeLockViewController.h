//
// Created by Kros on 1/1/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface AbstractPasscodeLockViewController : UIViewController
@property (nonatomic, readonly, retain) UILabel* noticeLabel;

- (void) updateNotice:(NSString*) notice;

- (void) clearPasscode;

- (void) clearAndUpdateNotice:(NSString*) notice;

- (void) onFilled:(NSString*) result;

@end