//
//  MVVMTableViewCell.m
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import "MVVMTableViewCell.h"
#import "MVVMModel.h"

@implementation MVVMTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MVVMModel *)model {
    _model = model;
    self.textLabel.text = model.title;
    self.detailTextLabel.text = model.subTitle;
}

@end
