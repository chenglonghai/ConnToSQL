//
//  DBQueryContext.h
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#import "OHMySQLQueryContext.h"

@interface DBQueryContext : OHMySQLQueryContext

//连接数据库
+ (BOOL)connectDB;
//断开数据库
+ (BOOL)disConnectDB;
//初始化设备上下文
+ (DBQueryContext *)getDBQueryContext;
//设置连接器
+(void)setCoordinator;
@end
