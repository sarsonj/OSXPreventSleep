//
// Created by JS on 09/09/16.
//

#import "OSXPreventSleep.h"
#include <CoreServices/CoreServices.h>


void MyTimerCallback(CFRunLoopTimerRef timer, void *info) {
    UpdateSystemActivity(OverallAct);
}

@implementation OSXPreventSleep {
    BOOL _preventSleep;
    CFRunLoopTimerRef timer;
}
+ (OSXPreventSleep *)instance {
    static OSXPreventSleep *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}


- (BOOL)preventSleep {
    return _preventSleep;
}

- (void)setPreventSleep:(BOOL)preventSleep {
    if (preventSleep != _preventSleep) {
        _preventSleep = preventSleep;
        if (preventSleep) {
            [self startPreventSleep];
        } else {
            [self stopPreventSleep];
        }
    }
}

- (void)stopPreventSleep {
    if (timer) {
        CFRunLoopTimerInvalidate(timer);
        CFRelease(timer);
    }
    timer = NULL;
}

- (void)startPreventSleep {
    CFRunLoopTimerContext context = { 0, NULL, NULL, NULL, NULL };

    timer = CFRunLoopTimerCreate(NULL, CFAbsoluteTimeGetCurrent(), 30, 0, 0, MyTimerCallback, &context);
    if (timer != NULL); {
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes);
    }
}






@end



