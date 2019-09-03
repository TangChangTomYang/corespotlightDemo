//
//  AppDelegate.m
//  CoreSpotlightDemo
//
//  Created by yangrui on 2019/9/3.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

- (BOOL)application:(nonnull UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray * __nullable))restorationHandler{
    
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 30, 50)];
    lb.backgroundColor = [UIColor blueColor];
    [application.keyWindow addSubview:lb];
    
    
    NSString *identifer = userActivity.userInfo[@"kCSSearchableItemActivityIdentifier"];
    
    
    
    ViewController *vc = (ViewController *)self.window.rootViewController;
    
    
    if ([identifer  isEqualToString: @"mg1"] ) {
        vc.imgV.image = [UIImage imageNamed:@"1.png"];
    }
    
    if ([identifer  isEqualToString: @"mg2"] ) {
        vc.imgV.image = [UIImage imageNamed:@"2.png"];
    }
    
    
    if ([identifer  isEqualToString: @"mg3"] ) {
        vc.imgV.image = [UIImage imageNamed:@"3.png"];
    }
 
    return YES;
}

@end
