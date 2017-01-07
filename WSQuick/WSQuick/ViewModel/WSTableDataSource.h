//
//  WSTableDataSource.h
//  WSQuick
//
//  Created by wangshen on 17/1/7.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSTableViewCell.h"
#import "WSSectionData.h"

typedef void(^DataSourceCallBack)(NSMutableArray *);

@class WSTableDataSource;

@protocol WSTableDataSourceDelegate <NSObject>


/**
 代理方法 返回组合的数据源

 @param dataSource  当前的类
 @param sourceArray 数组
 */
- (void)tableDataSouce:(WSTableDataSource *)dataSource sourceArray:(NSMutableArray *)sourceArray;

@end

@interface WSTableDataSource : NSObject

@property (nonatomic,weak) id viewController;

@property (nonatomic,copy) DataSourceCallBack dataSourceCallBack;

/**
 返回 一组数据源

 @return WSTableDataSource
 */
- (NSMutableArray *)crecteDataSouce;



/**
 异步获取 数据源数据 子类中需要重写此方法 需要实现代理方法 tableDataSouce:sourceArray:
 */
- (void)asyncCreateDataSource;



/**
 block 方式获取数据源数据 子类中需要重写此方法

 @param callBack block
 */
- (void)asyncCreateDataSourceWithBlock:(DataSourceCallBack )callBack;

@end
