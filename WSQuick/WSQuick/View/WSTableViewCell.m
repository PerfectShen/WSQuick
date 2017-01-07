//
//  WSTableViewCell.m
//  WSQuick
//
//  Created by wangshen on 16/12/30.
//  Copyright © 2016年 LP_Macmini. All rights reserved.
//

#import "WSTableViewCell.h"

@implementation WSTableViewCellData

- (instancetype)init{

    if (self = [super init]) {
        
        self.seperateLineLeft = 12;
        self.cellIdentfier = NSStringFromClass([self class]);
    }
    return self;
}

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
    
    self.aSeperateLine.frame = CGRectMake(self.cellData.seperateLineLeft, self.frame.size.height - 1/ScreenScale , self.frame.size.width - self.cellData.seperateLineLeft, 1/ScreenScale);
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
