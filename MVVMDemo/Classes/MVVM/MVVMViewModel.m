//
//  MVVMViewModel.m
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import "MVVMViewModel.h"

@implementation MVVMViewModel

- (void)requestDatas:(void (^)(NSError * _Nullable))result {
    for (int i = 0; i < 20; i++) {
        MVVMModel *model = [[MVVMModel alloc] init];
        model.title = [NSString stringWithFormat:@"%i", i];
        model.subTitle = [NSString stringWithFormat:@"第%i个", i];
        [self.datas addObject:model];
    }
    
    // if failed callback error
    
    // result
    if (result) {
        result(nil);
    }
}

- (NSMutableArray<MVVMModel *> *)datas {
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
    }
    return _datas;
}

@end
