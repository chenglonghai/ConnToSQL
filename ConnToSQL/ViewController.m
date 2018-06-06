//
//  ViewController.m
//  ConnToSQL
//
//  Created by 柳钰柯 on 2017/1/4.
//  Copyright © 2017年 柳钰柯. All rights reserved.
//

#import "ViewController.h"
#import <OHMySQL.h>
#import "DBQueryContext.h"
#import "CURDAction.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //查询
//    NSArray *result = [[CURDAction shareCURDAction] selectTableName:@"tb_area" condition:@"area_id=1"];
    
    //增加
//    NSDictionary *dict = @{
//                           @"area_id" :@"5",
//                           @"area_name" :@"shanghai",
//                           @"create_time" : @"2018-08-05",
//                           @"last_edit_time" : @"2018-08-05",
//                           @"priority": @2
//                           };
//
//     BOOL result = [[CURDAction shareCURDAction] insertTableName:@"tb_area" set:dict];
    
    //删除
//    BOOL result = [[CURDAction shareCURDAction] deleteTableName:@"tb_area" condition:@"area_id"];
    //更新
   BOOL result=  [[CURDAction shareCURDAction] updateTableName:@"tb_area" condition:@"area_id=5" set:@{@"area_name":@"hanzi"}];
   NSLog(@"==%d", result);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
