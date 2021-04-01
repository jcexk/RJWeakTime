//
//  AppDelegate.m
//  RJWeakTime
//
//  Created by 江其 on 2021/3/26.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <objc/runtime.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGRect mainRect = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc]initWithFrame:mainRect];
    
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
