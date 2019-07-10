//
//  RACTableViewCell.h
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACModel;

NS_ASSUME_NONNULL_BEGIN

@interface RACTableViewCell : UITableViewCell

@property (nonatomic, strong) RACModel *model;

@end

NS_ASSUME_NONNULL_END
