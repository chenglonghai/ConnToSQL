//
//  DBUser.h
//  ConnToSQL
//
//  Created by longhai on 2018/6/5.
//  Copyright © 2018年 柳钰柯. All rights reserved.
//

#import "OHMySQLUser.h"

@interface DBUser : OHMySQLUser
+ (OHMySQLUser *)getDBUser;
@end
