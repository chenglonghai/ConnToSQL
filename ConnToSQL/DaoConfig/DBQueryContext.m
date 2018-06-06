//
//  DBQueryContext.m
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#import "DBQueryContext.h"

#import "DBConnect.h"
@implementation DBQueryContext
static DBQueryContext *_dbQueryContext;
//初始化设备上下文
+ (instancetype)shareDBQueryContext
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dbQueryContext =  [DBQueryContext new];
    });
    return _dbQueryContext;
}
//连接数据库
+ (BOOL)connectDB
{
    [[DBConnect getCoordinator] connect];
    [self setCoordinator];//设置连接器
 
    return [DBConnect getCoordinator].connected;
    
}
//断开数据库
+ (BOOL)disConnectDB
{
    [[DBConnect getCoordinator] disconnect];
    return [DBConnect getCoordinator].connected;
}
//初始化设备上下文
+ (DBQueryContext *)getDBQueryContext
{
   BOOL connected =   [self connectDB];
    if (connected == YES) {
        NSLog(@"连接数据库成功");
            return [DBQueryContext shareDBQueryContext];
    }else
    {
            NSLog(@"连接数据库失败");
          return nil;
    }
    
  
}

//设置连接器
+(void)setCoordinator
{
    [DBQueryContext shareDBQueryContext].storeCoordinator  = [DBConnect getCoordinator];
}
@end
