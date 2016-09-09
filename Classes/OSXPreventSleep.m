//
// Created by JS on 09/09/16.
//

#import "OSXPreventSleep.h"
#import <IOKit/pwr_mgt/IOPMLib.h>

@implementation OSXPreventSleep {
    BOOL _preventSleep;
    IOPMAssertionID displaySleepAssertionID;
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
  if (displaySleepAssertionID != 0) {
      IOPMAssertionRelease(displaySleepAssertionID);
      displaySleepAssertionID = 0;
  }
}

- (void)startPreventSleep {
  if (displaySleepAssertionID == 0) {
      IOPMAssertionCreateWithName(
              kIOPMAssertionTypeNoDisplaySleep,
              kIOPMAssertionLevelOn,
              CFSTR("Baby monitor running"),
              &displaySleepAssertionID);
  }
}


@end
