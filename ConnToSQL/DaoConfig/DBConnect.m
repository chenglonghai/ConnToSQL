//
//  DBConnect.m
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#import "DBConnect.h"
#import "DBUser.h"

@implementation DBConnect
static DBConnect *_dbConnect;

+ (instancetype)shareDBConnect
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      _dbConnect =  [[DBConnect alloc] initWithUser:[DBUser getDBUser]];
    });
    return _dbConnect;
}
//获取连接器
+ (DBConnect *)getCoordinator
{
    return  [DBConnect shareDBConnect];
}

@end
