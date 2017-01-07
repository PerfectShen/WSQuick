//
//  WSSectionData.h
//  WSQuick
//
//  Created by wangshen on 17/1/7.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WSSectionData : NSObject

@property (nonatomic,strong) NSMutableArray *celldataArray; //当前section中的cell的行数

@property (nonatomic,assign) CGFloat headerHeight; //section头视图的高度 默认 12

@property (nonatomic,assign) CGFloat footerHeight; //section尾视图的高度 默认 0.01

@property (nonatomic,copy) NSString *headerTitle; //section头视图的title

@property (nonatomic,copy) NSString *footerTitle; //section尾视图的title



/**
 使用一个cellData数组初始化一个sectionData

 @param cellDataArray cellData数组
 @return 返回当前类的一个实例对象
 */
- (instancetype)initWithCellDataArray:(NSMutableArray *)cellDataArray;


@end
