//
//  AppDelegate.m
//  multipractice
//
//  Created by 研发部 on 2017/9/22.
//  Copyright © 2017年 development team. All rights reserved.
//

#import "AppDelegate.h"
#import <UMSocialQQHandler.h>
#import <UMSocialWechatHandler.h>
#import "WXApi.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
 
 /* 打开调试日志 */
 [[UMSocialManager defaultManager] openLog:YES];
 
 /* 设置友盟appkey */
 [[UMSocialManager defaultManager] setUmSocialAppkey:@"596d9eb045297d42ee000899"];
 [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1106292856"/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://zy.b6ss.com/public/api/Home/APP"];
 [self configUSharePlatforms];
    return YES;
}
-(void)configUSharePlatforms{
 
 /* 设置微信的appKey和appSecret */
 [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxc6201a14feb3a9a2" appSecret:@"749234c3ce290a5e104cd9e37e471569" redirectURL:@"http://zhuoyue"];
 
  [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1106292856"/*设置QQ平台的appID*/  appSecret:nil redirectURL:nil];
 
}

// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
 
 BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
 return result;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
