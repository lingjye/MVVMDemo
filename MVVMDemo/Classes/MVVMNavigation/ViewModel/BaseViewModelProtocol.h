//
//  BaseViewModelProtocol.h
//  MVVMDemo
//
//  Created by txooo on 17/8/16.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseViewModel;

@protocol BaseViewModelProtocol <NSObject>

@optional
- (void)pushViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated;
- (void)popViewModelAnimated:(BOOL)animated;
- (void)popToRootViewModelAnimated:(BOOL)animated;
- (void)presentViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;
- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion;
@end
