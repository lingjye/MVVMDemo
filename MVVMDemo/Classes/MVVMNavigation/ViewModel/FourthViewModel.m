//
//  FourthViewModel.m
//  MVVMDemo
//
//  Created by txooo on 17/8/16.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "FourthViewModel.h"

@implementation FourthViewModel

- (void)initialize {
    @weakify(self);
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^(NSIndexPath *indexPath) {
        @strongify(self)
        [self dismissViewModelAnimated:YES completion:^{
            
        }];
        //        [self tx_popToRootViewControllerAnimated:YES];
        return [RACSignal empty];
    }];
    
}
@end
