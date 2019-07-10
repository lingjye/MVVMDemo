//
//  FirstViewModel.m
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "FirstViewModel.h"
#import "SecondViewModel.h"

@interface FirstViewModel ()

@property (nonatomic,strong,readwrite) SecondViewModel *secondViewModel;

@end

@implementation FirstViewModel

- (void)initialize {
    
    @weakify(self);
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^(NSIndexPath *indexPath) {
        @strongify(self)
        self.secondViewModel = [[SecondViewModel alloc] initWithServices:self.services params:@{@"title":@"Second"}];
        [self.services pushViewModel:self.secondViewModel animated:YES];
        return [RACSignal empty];
    }];
}

@end
