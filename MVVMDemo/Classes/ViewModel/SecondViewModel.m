//
//  SecondViewModel.m
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "SecondViewModel.h"

#import "ThirdViewController.h"

@interface SecondViewModel ()


@end

@implementation SecondViewModel

- (void)initialize {
    @weakify(self);
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^(NSIndexPath *indexPath) {
        @strongify(self)
        ThirdViewController *thirdViewController = [[ThirdViewController alloc] initWithParams:@{@"title":@"Third"}];
        [self tx_pushViewController:thirdViewController animated:YES];
        return [RACSignal empty];
    }];
    
}

@end
