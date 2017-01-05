//
//  WSTableViewCell.h
//  WSQuick
//
//  Created by wangshen on 16/12/30.
//  Copyright © 2016年 LP_Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSTableViewCellData : NSObject

@property (nonatomic,assign) CGFloat cellHeight; //cell的高度
@property (nonatomic,assign) CGFloat seperateLineLeft; //分割线距离左侧的距离

@end

@interface WSTableViewCell<T : WSTableViewCellData *> : UITableViewCell


@property (nonatomic,strong) T cellData;

//添加子视图
- (void)setupSubViews;


//返回 cell的高度
+ (CGFloat )cellHeightWithCellData:(WSTableViewCellData *)cellData;


//更新cell上的数据
- (void)updateCellWithCellData:(WSTableViewCellData *)cellData;
@end
