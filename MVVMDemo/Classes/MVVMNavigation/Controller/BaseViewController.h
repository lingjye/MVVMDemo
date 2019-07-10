//
//  BaseViewController.h
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewModel.h"

#import "BaseViewControllerProtocol.h"

@interface BaseViewController : UIViewController<BaseViewControllerProtocol>

@property (nonatomic, strong) BaseViewModel *viewModel;
//Pass to your own ViewModel
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel;
// init viewModel with params
- (instancetype)initWithParams:(NSDictionary *)params;

@end
