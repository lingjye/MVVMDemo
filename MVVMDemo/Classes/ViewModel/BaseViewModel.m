//
//  BaseViewModel.m
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "BaseViewModel.h"

#import "BaseViewModelServices.h"

#import "BaseNavigationViewController.h"

@interface BaseViewModel ()

@property (nonatomic, strong, readwrite) id<BaseViewModelServices> services;
@property (nonatomic, copy, readwrite) NSDictionary *params;
@property (nonatomic, strong, readwrite) RACSubject *errors;
@property (nonatomic, strong, readwrite) RACSubject *willDisappearSignal;

@end

@implementation BaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(initWithServices:params:)]
    	subscribeNext:^(id x) {
            @strongify(viewModel)
            [viewModel initialize];
        }];
    [[viewModel
      rac_signalForSelector:@selector(initWithParams:)]
    	subscribeNext:^(id x) {
            @strongify(viewModel)
            [viewModel initialize];
        }];
    return viewModel;
    
}

- (instancetype)initWithServices:(id<BaseViewModelServices>)services params:(NSDictionary *)params {
    if (self = [super init]) {
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        self.services = services;
        self.title    = params[@"title"];
        self.params   = params;
    }
    return self;
}

- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super init]) {
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        self.title    = params[@"title"];
        self.params   = params;
    }
    return self;
}

- (RACSubject *)errors {
    if (!_errors) _errors = [RACSubject subject];
    return _errors;
}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}

- (void)initialize {}

- (void)tx_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [VisibleViewController().navigationController pushViewController:viewController animated:animated];
}

- (void)tx_popViewControllerAnimated:(BOOL)animated {
    [VisibleViewController().navigationController popViewControllerAnimated:animated];
}

- (void)tx_popToRootViewControllerAnimated:(BOOL)animated {
    [VisibleViewController().navigationController popToRootViewControllerAnimated:animated];
}

- (void)tx_presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(dispatch_block_t)completion {
    if (![viewController isKindOfClass:UINavigationController.class]) {
        viewController = [[BaseNavigationViewController alloc] initWithRootViewController:viewController];
    }
    [VisibleViewController() presentViewController:viewController animated:animated completion:completion];
}

- (void)tx_dismissViewModelAnimated:(BOOL)animated completion:(dispatch_block_t)completion {
    [VisibleViewController() dismissViewControllerAnimated:animated completion:completion];
}

@end
