//
// Created by JS on 09/09/16.
//

#import <Foundation/Foundation.h>


/*
 * Prevents sleep of OS X
 * Based on https://developer.apple.com/library/mac/qa/qa1160/_index.html
 */

@interface OSXPreventSleep : NSObject

+ (OSXPreventSleep *)instance;

@property BOOL preventSleep;


@end