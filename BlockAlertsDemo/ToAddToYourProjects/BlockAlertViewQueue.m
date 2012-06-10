//
// Created by stevenoleary on 10/06/2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BlockAlertViewQueue.h"


@implementation BlockAlertViewQueue {
     NSMutableArray *queuedAlerts;
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

- (id)init {
    queuedAlerts = [[NSMutableArray alloc] init];
}

- (void)dealloc {
    [queuedAlerts release];
    [super dealloc];
}

@end