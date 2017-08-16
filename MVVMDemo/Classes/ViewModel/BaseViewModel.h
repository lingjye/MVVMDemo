//
//  BaseViewModel.h
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelServices;

#import "BaseViewModelProtocol.h"

#import "BaseViewModelServices.h"

/// The type of the title view.
typedef NS_ENUM(NSUInteger, TitleViewType) {
    /// System title view
    TitleViewTypeDefault,
    /// Double title view
    TitleViewTypeDoubleTitle,
    /// Loading title view
    TitleViewTypeLoadingTitle
};

@interface BaseViewModel : NSObject<BaseViewModelProtocol>

- (instancetype)initWithServices:(id<BaseViewModelServices>)services params:(NSDictionary *)params;

- (instancetype)initWithParams:(NSDictionary *)params;

@property (nonatomic, strong, readonly) id<BaseViewModelServices> services;

@property (nonatomic, copy, readonly) NSDictionary *params;

@property (nonatomic, assign) TitleViewType titleViewType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) BOOL shouldFetchLocalDataOnViewModelInitialize;

@property (nonatomic, assign) BOOL shouldRequestRemoteDataOnViewDidLoad;

@property (nonatomic, strong, readonly) RACSubject *errors;

@property (nonatomic, strong, readonly) RACSubject *willDisappearSignal;

@property (nonatomic, strong) RACCommand *didSelectCommand;

- (void)initialize;

@end
