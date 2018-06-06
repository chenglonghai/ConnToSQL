//
//  CURDAction.h
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBQueryContext.h"

@interface CURDAction : NSObject
+ (instancetype)shareCURDAction;
- (DBQueryContext *)connect;
- (void)disconnect;
/**
 查询

 @param tableName 表名
 @param condition 条件
 @return 结果
 */
- (NSArray *)selectTableName:(NSString *)tableName
                   condition:(NSString *)condition;


/**
 增加

 @param tableName 表名字
 @param set 数据
 @return return bool
 */
- (BOOL)insertTableName:(NSString *)tableName
                    set:(NSDictionary *)set;

/**
 删除

 @param tableName 表名字
 @param condition 条件
 @return BOOL
 */
- (BOOL)deleteTableName:(NSString *)tableName
              condition:(NSString *)condition;



/**
 更新

 @param tableName 表名字
 @param condition 条件
 @param set 数值
 @return bool
 */
- (BOOL)updateTableName:(NSString *)tableName
              condition:(NSString *)condition
                    set:(NSDictionary *)set;


@end
