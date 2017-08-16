//
//  DemoTool.m
//  MVVMDemo
//
//  Created by txooo on 17/8/16.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "DemoTool.h"

@implementation DemoTool

UIViewController *VisibleViewController(){
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    while ([rootVC isKindOfClass:[UINavigationController class]]) {
        rootVC = [(UINavigationController *)rootVC visibleViewController];
    }
    while ([rootVC isKindOfClass:[UITabBarController class]]) {
        rootVC = [(UITabBarController *)rootVC selectedViewController];
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            rootVC = [(UINavigationController *)rootVC visibleViewController];
        }
    }
    return rootVC;
}

@end
