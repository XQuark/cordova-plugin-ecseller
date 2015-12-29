//
//  CDVWechat.h
//  cordova-plugin-ecseller
//
//  Created by uzstudio on 12/23/13.
//
//

#import <Cordova/CDV.h>
#import "ECSeller/ECSeller.h"

enum  CDVWechatSharingType {
    CDVWXSharingTypeApp = 1,
    CDVWXSharingTypeEmotion,
    CDVWXSharingTypeFile,
    CDVWXSharingTypeImage,
    CDVWXSharingTypeMusic,
    CDVWXSharingTypeVideo,
    CDVWXSharingTypeWebPage
};

@interface CDVECSeller:CDVPlugin <WXApiDelegate>

@property (nonatomic, strong) NSString *currentCallbackId;
@property (nonatomic, strong) NSString *wechatAppId;

- (void)isWXAppInstalled:(CDVInvokedUrlCommand *)command;
- (void)share:(CDVInvokedUrlCommand *)command;

@end
