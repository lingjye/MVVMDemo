//
//  AppDelegate.h
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseNavigationControllerStack.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readonly) BaseNavigationControllerStack *navigationControllerStack;

@end

