//
// Created by stevenoleary on 10/06/2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BlockAlertViewQueue.h"
#import "BlockAlertView.h"


@implementation BlockAlertViewQueue {
     NSMutableArray *queuedAlerts;
}

- (void)blockAlertViewDidDisappear:(id)sender {
    NSLog(@"Hit");
}

+ (BlockAlertViewQueue *)instance {
    static BlockAlertViewQueue *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (void)queueAndShow:(BlockAlertView *)blockAlertView {
    blockAlertView.delegate = self;
    [queuedAlerts addObject:blockAlertView];
    [blockAlertView show];
}

- (id)init {
    queuedAlerts = [[NSMutableArray alloc] init];

}

- (void)dealloc {
    [queuedAlerts release];
    [super dealloc];
}

@end