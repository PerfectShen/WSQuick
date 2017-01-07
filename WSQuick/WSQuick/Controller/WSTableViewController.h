//
//  WSTableViewController.h
//  WSQuick
//
//  Created by wangshen on 16/12/30.
//  Copyright © 2016年 LP_Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSTableDataSource.h"

@interface WSTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource; //数据源



/**
 初始化数据源
 */
- (void)initlizedDataSource;



/**
 默认是 UITableViewStylePlain
 实现这个方法可以在子类中修改tableview的类型
 @return UITableViewStyle
 */
- (UITableViewStyle )prefersTableViewStyle;




@end
