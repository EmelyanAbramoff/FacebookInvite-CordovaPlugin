#import <Cordova/CDV.h>

@interface HWPInviteAppLinks : CDVPlugin

- (void) appInvite:(CDVInvokedUrlCommand*)command;

- (void) canShow:(CDVInvokedUrlCommand*)command;


@end