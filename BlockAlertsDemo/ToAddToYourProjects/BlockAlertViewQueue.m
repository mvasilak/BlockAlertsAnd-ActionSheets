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
    [self enqueue:blockAlertView];
}

- (id)init {
    queuedAlerts = [[NSMutableArray alloc] init];
}

// Queues are first-in-first-out, so we remove objects from the head
- (BlockAlertView *) dequeue {
    if ([queuedAlerts count] == 0) return nil;
    id headObject = [queuedAlerts objectAtIndex:0];
    if (headObject != nil) {
        [[headObject retain] autorelease]; // so it isn't dealloc'ed on remove
        [queuedAlerts removeObjectAtIndex:0];
    }
    return headObject;
}

- (void) enqueue:(BlockAlertView *)blockAlertView {
    [queuedAlerts addObject:blockAlertView];
}

- (void)dealloc {
    [queuedAlerts release];
    [super dealloc];
}

@end