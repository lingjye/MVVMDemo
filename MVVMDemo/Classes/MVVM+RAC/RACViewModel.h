//
//  RACViewModel.h
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RACViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<RACModel *> *datas;

@property (nonatomic, strong) RACCommand *requestCommand;

@property (nonatomic, strong) RACSubject *errors;

@end

NS_ASSUME_NONNULL_END
