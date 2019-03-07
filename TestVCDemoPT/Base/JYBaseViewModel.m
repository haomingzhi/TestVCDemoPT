//
//  JYBaseViewModel.m
//  Model
//
//  Created by apple on 2018/10/30.
//  Copyright © 2018 ORANLLC_IOS1. All rights reserved.
//

#import "JYBaseViewModel.h"

@implementation JYBaseViewModel
-(void)fetchDataCompletion:(void (^)(BOOL success, NSString *message))block
{
    NSLog(@"%@ %@",@"未实现方法",_cmd);
}

-(void)fetchDataDetail:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block
{
     NSLog(@"%@ %@",@"未实现方法",_cmd);
}

-(void)fetchNextPageDataCompletion:(void (^)(BOOL success, NSString *message))block
{
    NSLog(@"%@ %@",@"未实现方法",_cmd);
}

-(BOOL)hasMore
{
     return NO;
}

-(void)fetchData:(NSDictionary *)parms Completion:(void (^)(BOOL, NSString *))block
{
    NSLog(@"%@ %@",@"未实现方法",_cmd);
}
-(void)addData:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block
{
   NSLog(@"%@ %@",@"未实现方法",_cmd);
}
-(void)deleteData:(NSDictionary *)parms Completion:(void (^)(BOOL succes, NSString *message))block
{
     NSLog(@"%@ %s",@"未实现方法",__func__);
}

-(void)editData:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block
{
   NSLog(@"%@ %@",@"未实现方法",_cmd);
}

-(void)buildTestData
{
    NSLog(@"%@ %@",@"未实现方法",_cmd);
}
@end
