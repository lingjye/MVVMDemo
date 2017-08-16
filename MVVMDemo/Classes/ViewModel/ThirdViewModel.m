//
//  ThirdViewModel.m
//  MVVMDemo
//
//  Created by txooo on 17/8/16.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "ThirdViewModel.h"

#import "FourthViewController.h"

@implementation ThirdViewModel

- (void)initialize {
    @weakify(self);
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^(NSIndexPath *indexPath) {
        @strongify(self)
        FourthViewController *fourthViewController = [[FourthViewController alloc] initWithParams:@{@"title":@"Fourth"}];
        [self tx_presentViewController:fourthViewController animated:YES completion:nil];
//        [self tx_popToRootViewControllerAnimated:YES];
        return [RACSignal empty];
    }];
    
}

@end
