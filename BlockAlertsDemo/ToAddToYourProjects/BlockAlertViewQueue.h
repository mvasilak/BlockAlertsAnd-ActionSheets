//
// Created by stevenoleary on 10/06/2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BlockAlertViewQueue : NSObject {

}
+ (BlockAlertViewQueue *)instance;


+ (void)queueAndShow:(BlockAlertView *)blockAlertView;
@end