//
//  VCManager.m
//  TestVCDemoPT
//
//  Created by apple on 2018/11/21.
//  Copyright © 2018 wjy. All rights reserved.
//

#import "VCManager.h"

@interface VCManager()
@property(nonatomic,strong)NSMutableDictionary *dic;
@end

@implementation VCManager
+ (instancetype)sharedManager
{
    static VCManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[VCManager alloc] init];
        instance.dic = [NSMutableDictionary new];
    });
    return instance;
}
-(void)regsisterClass:(NSString *)noticename obj:(NSString*)objName type:(NSInteger )viewType
{
    
}
-(void)regsisterClass:(NSString *)noticename obj:(NSString*)objName
{
    if([[NSBundle mainBundle] classNamed:objName])
    {
        Class c = [[NSBundle mainBundle] classNamed:objName];
        _dic[noticename] = c;
    }
    else
    {
        NSLog(@"未实行Request对象");
    }
    
}
-(Class)getClass:(NSString *)noticename
{
    return _dic[noticename];
}
@end
