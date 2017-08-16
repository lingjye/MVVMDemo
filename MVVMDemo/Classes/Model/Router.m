//
//  Router.m
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "Router.h"
#import "BaseViewModel.h"

@interface Router ()

@property (nonatomic, copy) NSDictionary *viewModelViewMappings;  // viewModel到view的映射

@end

@implementation Router

+ (instancetype)sharedInstance {
    static Router *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (BaseViewController *)viewControllerForViewModel:(BaseViewModel *)viewModel {
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[BaseViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (BaseViewModel *)viewModelForViewController:(UIViewController *)viewController {
    NSString *viewModel = self.viewViewModelMappings[NSStringFromClass(viewController.class)];
    NSParameterAssert(viewModel);
    return [[NSClassFromString(viewModel) alloc] initWithParams:[viewController valueForKey:@"params"]];
}

- (NSDictionary *)viewModelViewMappings {
    return @{
             @"FirstViewModel": @"FirstViewController",
             @"SecondViewModel": @"SecondViewController"
             };
}

- (NSDictionary *)viewViewModelMappings {
    return @{
             @"FirstViewController" : @"FirstViewModel",
             @"SecondViewController" : @"SecondViewModel",
             @"ThirdViewController" : @"ThirdViewModel",
             @"FourthViewController" : @"FourthViewModel"
             };
}
@end
