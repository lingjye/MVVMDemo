//
//  ThirdViewModel.m
//  MVVMDemo
//
//  Created by txooo on 17/8/16.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "ThirdViewModel.h"
#import "FourthViewModel.h"

@implementation ThirdViewModel

- (void)initialize {
    @weakify(self);
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^(NSIndexPath *indexPath) {
        @strongify(self)
        FourthViewModel *viewModel = [[FourthViewModel alloc] initWithParams:@{@"title":@"Fourth"}];
        [self presentViewModel:viewModel animated:YES completion:^{
            
        }];
//        [self tx_popToRootViewControllerAnimated:YES];
        return [RACSignal empty];
    }];
    
}

@end
