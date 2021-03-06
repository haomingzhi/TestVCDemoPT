//
//  AppDelegate.m
//  TestVCDemoPT
//
//  Created by apple on 2018/11/21.
//  Copyright © 2018 wjy. All rights reserved.
//

#import "AppDelegate.h"
#import "VCManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //    NSString *vcName = @"JYSettingViewController";
    //   NSString *vcName =  @"JYVideoTestListViewController";
    //    NSString *vcName = @"JYMsgInfoViewController";
    //    NSString *vcName = @"JYFeedbackViewController";
    //    NSString *vcName = @"JYBindPhoneViewController";
    //    NSString *vcName = @"JYBindPhoneNumViewController";
    //     NSString *vcName = @"JYEditMineViewController";
    //    NSString *vcName = @"JYCourseViewController";
    //    NSString *vcName = @"JYStudyViewController";
    //    NSString *vcName = @"JYGoodClassListViewController";
    //    NSString *vcName = @"JYClassListViewController";
    //    NSString *vcName = @"JYTeacherDonListViewController";
    //    NSString *vcName = @"JYFreeClassListViewController";
    //    NSString *vcName = @"JYRechargeViewController";
    //    NSString *vcName = @"JYHomeViewController";
    //    NSString *vcName = @"JYClassBuyViewController";
    //    NSString *vcName = @"JYClassPlayViewController";
    //    NSString *vcName = @"JYVideoEvaViewController";
    //    NSString *vcName = @"JYClassReadViewController";
    //    NSString *vcName = @"JYDownloadedViewController";
    //    NSString *vcName = @"JYTrainingInfoViewController";
    //    NSString *vcName = @"JYVideoInfoViewController";
    //    NSString *vcName = @"JYEvaListViewController";
    //    NSString *vcName = @"JYDirectViewController";
//    NSString *vcName = @"JYIntroViewController";
//    NSString *vcName = @"TestAnimationViewController";
//     NSString *vcName = @"JYTeacherListViewController";
//         NSString *vcName = @"JYSearchZxViewController";
//    NSString *vcName = @"JYNoZxViewController";
     NSString *vcName = @"TestAnimationViewController";
//    NSString *vcName = @"JYTeacherInfoViewController";
    [[VCManager sharedManager] regsisterClass:vcName obj:vcName];
    Class c = [[VCManager sharedManager] getClass:vcName];
    id obj = [[c alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:obj];
//      nav.navigationBar.translucent = YES;
    self.window.rootViewController = nav;
    return YES;
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
