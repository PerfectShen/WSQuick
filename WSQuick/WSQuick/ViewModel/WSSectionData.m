//
//  WSSectionData.m
//  WSQuick
//
//  Created by wangshen on 17/1/7.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSSectionData.h"

@implementation WSSectionData

- (instancetype)init{

    if (self = [super init]) {
        
        self.headerHeight = 12;
        self.footerHeight = 0.01;
    }
    return self;
}

- (instancetype)initWithCellDataArray:(NSMutableArray *)cellDataArray{

    if (self =  [self init]) {
        
        self.celldataArray = cellDataArray;
    }
    return self;
}

@end
