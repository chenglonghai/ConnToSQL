//
//  DataSourceConfig.h
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#ifndef DataSourceConfig_h
#define DataSourceConfig_h

//数据库配置
#define DB_USER_NAME @"root"
#define DB_PASSWORD @"root123"
#define DB_NAME @"sbm"
#define DB_SERVER_NAME @"192.168.2.238"
#define DB_PORT 3306
#define DB_SOCKET nil
#import <OHMySQL.h>

//核心代码参考
//    // 初始化数据库连接用户
//    OHMySQLUser *usr = [[OHMySQLUser alloc] initWithUserName:@"itimes" password:@"iTimessql" serverName:@"114.215.103.67" dbName:@"itimes" port:3306 socket:nil];
//    // 初始化连接器
//    OHMySQLStoreCoordinator *coordinator = [[OHMySQLStoreCoordinator alloc] initWithUser:usr];
//    // 连接到数据库
//    [coordinator connect];
//    // 初始化设备上下文
//    OHMySQLQueryContext *queryContext = [OHMySQLQueryContext new];
//    // 设置连接器
//    queryContext.storeCoordinator = coordinator;

// 获取log表中的数据
//    OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"tb_area" condition:nil];
//    NSError *error = nil;
//    // task用于存放数据库返回的数据
//    NSArray *tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
//    if (tasks != nil) {
//        NSLog(@"%@",tasks);
//    }
//https://www.jianshu.com/p/d26be287812f
#endif /* DataSourceConfig_h */
