//
//  CDVECSeller.m
//  cordova-plugin-ecseller
//
//  Created by uzstudio on 12/29/2015.
//
//

#import "CDVECSeller.h"

@implementation CDVECSeller

#pragma mark "API"

- (void)pluginInitialize {
    NSString* appId = [[self.commandDelegate settings] objectForKey:@"wechatappid"];
    if(appId){
        self.wechatAppId = appId;
        // [WXApi registerApp: appId];
    }   
}

- (void)isWXAppInstalled:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    
    [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
}

- (void)share:(CDVInvokedUrlCommand *)command
{
    ECSellerMod * mod = [[ECSellerMod alloc] init];
    [mod uploadImage:@""];
    
    // check arguments
    NSDictionary *params = [command.arguments objectAtIndex:0];
    if (!params)
    {
        [self failWithCallbackID:command.callbackId withMessage:@"参数格式错误"];
        return ;
    }
    
    // save the callback id
    self.currentCallbackId = command.callbackId;
    
    // message or text?
    NSDictionary *message = [params objectForKey:@"message"];
    
    if (message)
    {
        [self failWithCallbackID:command.callbackId withMessage:@"已发送Message"];
        self.currentCallbackId = nil;
    }
    else
    {
        [self failWithCallbackID:command.callbackId withMessage:@"已发送Text"];
        self.currentCallbackId = nil;
    }
}

- (void)successWithCallbackID:(NSString *)callbackID
{
    [self successWithCallbackID:callbackID withMessage:@"OK"];
}

- (void)successWithCallbackID:(NSString *)callbackID withMessage:(NSString *)message
{
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
    [self.commandDelegate sendPluginResult:commandResult callbackId:callbackID];
}

- (void)failWithCallbackID:(NSString *)callbackID withError:(NSError *)error
{
    [self failWithCallbackID:callbackID withMessage:[error localizedDescription]];
}

- (void)failWithCallbackID:(NSString *)callbackID withMessage:(NSString *)message
{
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:message];
    [self.commandDelegate sendPluginResult:commandResult callbackId:callbackID];
}

@end
