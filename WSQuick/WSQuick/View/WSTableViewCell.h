//
//  WSTableViewCell.h
//  WSQuick
//
//  Created by wangshen on 16/12/30.
//  Copyright © 2016年 LP_Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenScale     [UIScreen mainScreen].scale

@interface WSTableViewCellData : NSObject

@property (nonatomic,assign) CGFloat cellHeight; //cell的高度
@property (nonatomic,assign) CGFloat seperateLineLeft; //分割线距离左侧的距离 默认 12
@property (nonatomic,copy) NSString *cellIdentfier; //cell的重用标记 默认是 【self class】名

@end




#pragma mark - 协议
@protocol WSTableViewCellDelegate <NSObject>



@end

@interface WSTableViewCell<T : WSTableViewCellData *> : UITableViewCell


@property (nonatomic,strong) T cellData;  //cell上绑定的数据源

@property (nonatomic,weak) id delegate;

//添加子视图
- (void)setupSubViews;


//返回 cell的高度
+ (CGFloat )cellHeightWithCellData:(WSTableViewCellData *)cellData;


//更新cell上的数据
- (void)updateCellWithCellData:(WSTableViewCellData *)cellData;
@end
