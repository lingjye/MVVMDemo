//
//  FirstViewModel.h
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "BaseViewModel.h"

#import "SecondViewModel.h"

@interface FirstViewModel : BaseViewModel

@property (nonatomic,strong,readonly) SecondViewModel *secondViewModel;

@end
