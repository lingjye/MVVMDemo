//
//  RACViewModel.m
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import "RACViewModel.h"

@implementation RACViewModel

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
    }
    return _datas;
}

- (RACCommand *)requestCommand {
    if (!_requestCommand) {
        @weakify(self);
        _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                for (int i = 0; i < 20; i++) {
                    RACModel *model = [[RACModel alloc] init];
                    model.title = [NSString stringWithFormat:@"%i", i];
                    model.subTitle = [NSString stringWithFormat:@"第%i个", i];
                    [self.datas addObject:model];
                }
                [subscriber sendNext:@YES];
                [subscriber sendError:nil];
                [subscriber sendCompleted];
                return [RACDisposable disposableWithBlock:^{
                    
                }];
            }];
        }];
    }
    return _requestCommand;
}

@end
