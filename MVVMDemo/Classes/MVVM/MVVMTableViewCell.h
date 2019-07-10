//
//  MVVMTableViewCell.h
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MVVMModel;

NS_ASSUME_NONNULL_BEGIN

@interface MVVMTableViewCell : UITableViewCell

@property (nonatomic, strong) MVVMModel *model;

@end

NS_ASSUME_NONNULL_END
