//
//  Router.h
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"

@interface Router : NSObject
/// Retrieves the shared router instance.
///
/// Returns the shared router instance.
+ (instancetype)sharedInstance;

/// Retrieves the view corresponding to the given view model.
///
/// viewModel - The view model
///
/// Returns the view corresponding to the given view model.
- (BaseViewController *)viewControllerForViewModel:(BaseViewModel *)viewModel;

- (BaseViewModel *)viewModelForViewController:(UIViewController *)viewController;

@end
