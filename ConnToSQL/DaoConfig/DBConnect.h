//
//  DBConnect.h
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#import <Foundation/Foundation.h>
// // 初始化连接器
@interface DBConnect : OHMySQLStoreCoordinator
//获取连接器
+ (DBConnect *)getCoordinator;
@end
