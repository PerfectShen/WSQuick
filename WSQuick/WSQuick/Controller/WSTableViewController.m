//
//  WSTableViewController.m
//  WSQuick
//
//  Created by wangshen on 16/12/30.
//  Copyright © 2016年 LP_Macmini. All rights reserved.
//

#import "WSTableViewController.h"

@interface WSTableViewController ()

@property (nonatomic,strong) WSTableDataSource *tableDataSource;

@end

@implementation WSTableViewController

- (instancetype)init{

    if (self = [super init]) {
        
        self.tableDataSource = [[WSTableDataSource alloc] init];
        self.tableDataSource.viewController = self;
        self.dataSource = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    [self initlizedDataSource];
}

#pragma mark - getter
- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:[self prefersTableViewStyle]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


#pragma mark - 子类中可能会需要重写的方法
- (void)initlizedDataSource{

    //eg
//    [self.dataSource removeAllObjects];
    self.dataSource = [self.tableDataSource crecteDataSouce];
    [self.tableView reloadData];
    
}

- (UITableViewStyle)prefersTableViewStyle{

    return UITableViewStylePlain;
}



#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    WSSectionData *data = [self.dataSource objectAtIndex:section];
    if ([data isKindOfClass:[WSSectionData class]]) {
        return data.headerHeight;
    }else{
    
        NSAssert(0, @"dataSource中的对象应该是 WSSectionData 子类");
        return 0.01;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    WSSectionData *data = [self.dataSource objectAtIndex:section];
    if ([data isKindOfClass:[WSSectionData class]]) {
        return data.footerHeight;
    }else{
        
        NSAssert(0, @"dataSource中的对象应该是 WSSectionData 子类");
        return 0.01;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    WSSectionData *sectionData = self.dataSource[section];
    if ([sectionData isKindOfClass:[WSSectionData class]]) {
        return sectionData.celldataArray.count;
    }else{
        
        NSAssert(0, @"dataSource中的对象应该是 WSSectionData 子类");
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WSSectionData *sectionData = self.dataSource[indexPath.section];
    WSTableViewCellData *cellData = sectionData.celldataArray[indexPath.row];
    return [WSTableViewCell cellHeightWithCellData:cellData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WSSectionData *sectionData = self.dataSource[indexPath.section];
    WSTableViewCellData *cellData = sectionData.celldataArray[indexPath.row];
    WSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellData.cellIdentfier];
    if (!cell) {
        cell = [[WSTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellData.cellIdentfier];
    }
    cell.delegate = self;
    [cell updateCellWithCellData:cellData];
    return cell;
}


@end
