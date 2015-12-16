#import "HWPInviteAppLinks.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>



@implementation HWPInviteAppLinks


- (void)canShow:(CDVInvokedUrlCommand*)command
{
    
    NSString* callbackId = [command callbackId];
    
    
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:1];
    
    FBSDKAppInviteDialog *inviteDialog = [[FBSDKAppInviteDialog alloc] init];
    
    if ([inviteDialog canShow])
    {
        [self.commandDelegate sendPluginResult:result callbackId:callbackId];
    }
    else
    {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:0];
        [self.commandDelegate sendPluginResult:result callbackId:callbackId];
    }
    
}


- (void)appInvite:(CDVInvokedUrlCommand*)command
{
    
    NSString* callbackId = [command callbackId];
    NSString* appLinkUrl = [NSString stringWithFormat: @"%@", [[command arguments] objectAtIndex:0]];
    NSString* previewImageUrl = [NSString stringWithFormat: @"%@", [[command arguments] objectAtIndex:1]];
    
 
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"successed"];
    

    if (appLinkUrl.length > 0 && previewImageUrl.length > 0)
    {
        FBSDKAppInviteContent *content =[[FBSDKAppInviteContent alloc] init];
        content.appLinkURL = [NSURL URLWithString:appLinkUrl];
        content.appInvitePreviewImageURL = [NSURL URLWithString:previewImageUrl];
        
        FBSDKAppInviteDialog *inviteDialog = [[FBSDKAppInviteDialog alloc] init];
        
        if([inviteDialog canShow])
        {
            inviteDialog.content = content;
            inviteDialog.delegate = (id)self;
            [inviteDialog show];
            
            [self.commandDelegate sendPluginResult:result callbackId:callbackId];
        }
        else
        {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"failed"];
            
            [self.commandDelegate sendPluginResult:result callbackId:callbackId];
        }
        
    }
    else
    {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"appLinkUrl or previewImageUrl is empty"];
        
        [self.commandDelegate sendPluginResult:result callbackId:callbackId];
    }
 
}

/*!
 @abstract Sent to the delegate when the app invite encounters an error.
 @param appInviteDialog The FBSDKAppInviteDialog that completed.
 @param error The error.
 */

- (void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didCompleteWithResults:(NSDictionary *)results
{
    
}


- (void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didFailWithError:(NSError *)error
{

}


@end