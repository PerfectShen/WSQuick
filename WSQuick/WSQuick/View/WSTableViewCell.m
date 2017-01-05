//
//  WSTableViewCell.m
//  WSQuick
//
//  Created by wangshen on 16/12/30.
//  Copyright © 2016年 LP_Macmini. All rights reserved.
//

#import "WSTableViewCell.h"

@implementation WSTableViewCellData

@end




@interface WSTableViewCell ()

@property (nonatomic,strong) CALayer *aSeperateLine; //cell的分割线

@end


@implementation WSTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
        [self _addSeperateLine];
    }
    return self;
}

#pragma mark - Config UI
- (void)_addSeperateLine{
    [self.contentView.layer addSublayer:self.aSeperateLine];
}


#pragma mark - over write function
- (void)layoutSubviews{
    [super layoutSubviews];
    self.aSeperateLine.frame = CGRectMake(0, 0, 0, 0);
}


#pragma mark - public function
- (void)setupSubViews{
  
}

+ (CGFloat )cellHeightWithCellData:(WSTableViewCellData *)cellData{

    return cellData.cellHeight;
}

- (void)updateCellWithCellData:(WSTableViewCellData *)cellData{
    self.cellData = cellData;
}


@end
