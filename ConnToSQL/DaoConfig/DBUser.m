//
//  DBUser.m
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#import "DBUser.h"

@implementation DBUser

static DBUser *_dbUser;

+ (instancetype)shareDBUser
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       _dbUser = [[self alloc] initWithUserName:DB_USER_NAME password:DB_PASSWORD serverName:DB_SERVER_NAME dbName:DB_NAME port:DB_PORT socket:DB_SOCKET];
    });
    return _dbUser;
}

+ (OHMySQLUser *)getDBUser
{
    return [DBUser shareDBUser];
}
@end
