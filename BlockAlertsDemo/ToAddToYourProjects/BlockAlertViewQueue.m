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

- (void)blockAlertViewDidDisappear:(id)sender {

    //remove this alert from the queue
    [queuedAlerts removeObject:sender];

    //NSLog(@"Alerts remaining: %d", [queuedAlerts count]);

    if ([queuedAlerts count] > 0) {
        BlockAlertView *headAlert = [queuedAlerts objectAtIndex:0];
        [headAlert show];
    }

}

- (void)queueAndShow:(BlockAlertView *)blockAlertView {
    blockAlertView.delegate = self;

    //if this is the first (and therefore only) alert on the queue then display immediately
    if ([queuedAlerts count] == 0) {
        [blockAlertView show];
    }

    [queuedAlerts addObject:blockAlertView];

    //NSLog(@"Alerts on queue: %d", [queuedAlerts count]);
}

- (id)init {
    queuedAlerts = [[NSMutableArray alloc] init];
}

- (void)dealloc {
    [queuedAlerts release];
    [super dealloc];
}

@end