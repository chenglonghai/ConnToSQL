//
//  CURDAction.m
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#import "CURDAction.h"

@interface CURDAction()



@end

@implementation CURDAction

- (DBQueryContext *)connect
{
    return [DBQueryContext getDBQueryContext];
}
- (void)disconnect
{
    [DBQueryContext disConnectDB];
}

// SELECT获取数据库中表中的数据
-(OHMySQLQueryRequest *)getSELECT_SQLQueryRequestWithTable_name:(NSString *)tableName
                                                   condition:(NSString *)condition
{
    return [OHMySQLQueryRequestFactory SELECT:tableName condition:condition];
}
// UPDATE获取数据库中表中的数据
-(OHMySQLQueryRequest *)getUPDATE_SQLQueryRequestWithTable_name:(NSString *)tableName
                                                      condition:(NSString *)condition
                                                            set:(NSDictionary *)set
{
    return [OHMySQLQueryRequestFactory UPDATE:tableName set:set condition:condition];
}


// DELETE获取数据库中表中的数据
-(OHMySQLQueryRequest *)getDELETE_SQLQueryRequestWithTable_name:(NSString *)tableName
                                                      condition:(NSString *)condition
{
    return [OHMySQLQueryRequestFactory DELETE:tableName condition:condition];
}

//INSERT获取数据库中表中的数据
-(OHMySQLQueryRequest *)getINSERT_SQLQueryRequestWithTable_name:(NSString *)tableName
                                                            set:(NSDictionary *)set
{
    return [OHMySQLQueryRequestFactory INSERT:tableName set:set];
}



//查询
- (NSArray *)selectTableName:(NSString *)tableName
                   condition:(NSString *)condition
{
    OHMySQLQueryRequest *query = [self getSELECT_SQLQueryRequestWithTable_name:tableName condition:condition];
    
    NSError *error = nil;
    // task用于存放数据库返回的数据
    NSArray *result = [[self connect] executeQueryRequestAndFetchResult:query error:&error];
    if (result != nil) {
//        NSLog(@"%@",result);
    }
    [self disconnect];
    return result;
}

- (BOOL)insertTableName:(NSString *)tableName
                    set:(NSDictionary *)set
{
    OHMySQLQueryRequest *query = [self getINSERT_SQLQueryRequestWithTable_name:tableName set:set];
    
    NSError *error = nil;
    // task用于存放数据库返回的数据
    BOOL result = [[self connect] executeQueryRequest:query error:&error];
    if (result == YES) {
              NSLog(@"插入成功");
    }else{
              NSLog(@"插入失败");
    }
    [self disconnect];
    return result;
}

- (BOOL)deleteTableName:(NSString *)tableName
              condition:(NSString *)condition
{
    
    OHMySQLQueryRequest *query = [self getDELETE_SQLQueryRequestWithTable_name:tableName condition:condition];
    
    NSError *error = nil;
    // task用于存放数据库返回的数据
    BOOL result = [[self connect] executeQueryRequest:query error:&error];
    if (result == YES) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
    [self disconnect];
    return result;
}
- (BOOL)updateTableName:(NSString *)tableName
              condition:(NSString *)condition
                    set:(NSDictionary *)set
{
    OHMySQLQueryRequest *query = [self getUPDATE_SQLQueryRequestWithTable_name:tableName condition:condition set:set];
    
    NSError *error = nil;
    // task用于存放数据库返回的数据
    BOOL result = NO;
    [[self connect] executeQueryRequestAndFetchResult:query error:&error];
    if (!error) {
        result = YES;
        NSLog(@"更新成功");
    }else{
        result = NO;
        NSLog(@"更新失败");
    }
    [self disconnect];
    return result;
}

static CURDAction *_curdAction;
+ (instancetype)shareCURDAction
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _curdAction = [[self alloc] init];
    });
    return _curdAction;
}




@end
