#import <Foundation/Foundation.h>
#import "BlockAlertView.h"

@class BlockAlertView;

@interface BlockAlertViewQueue : NSObject <BlockAlertViewDelegate> {

}
+ (BlockAlertViewQueue *)instance;

- (void)queueAndShow:(BlockAlertView *)blockAlertView;

@end