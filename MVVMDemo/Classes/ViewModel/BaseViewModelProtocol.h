//
//  BaseViewModelProtocol.h
//  MVVMDemo
//
//  Created by txooo on 17/8/16.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol <NSObject>

@optional

- (void)tx_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)tx_popViewControllerAnimated:(BOOL)animated;

- (void)tx_popToRootViewControllerAnimated:(BOOL)animated;

- (void)tx_presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(dispatch_block_t)completion;

- (void)tx_dismissViewModelAnimated:(BOOL)animated completion:(dispatch_block_t)completion;

@end
