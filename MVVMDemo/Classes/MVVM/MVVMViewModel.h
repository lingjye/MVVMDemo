//
//  MVVMViewModel.h
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVVMViewModel : NSObject

@property (nonatomic, assign) NSInteger pageIndex;

@property (nonatomic, strong) NSMutableArray<MVVMModel *> *datas;

- (void)requestDatas:(void (^)(NSError  * _Nullable error))result;

@end

NS_ASSUME_NONNULL_END
