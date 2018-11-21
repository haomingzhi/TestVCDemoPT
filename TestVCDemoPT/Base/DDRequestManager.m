//
//  DDRequestManager.m
//  DDIMsdk
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018 wjy. All rights reserved.
//

#import "DDRequestManager.h"
@interface DDRequestManager()
@property(nonatomic,strong)NSMutableDictionary *dic;
@end


@implementation DDRequestManager

+ (instancetype)sharedManager
{
    static DDRequestManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DDRequestManager alloc] init];
        instance.dic = [NSMutableDictionary new];
    });
    return instance;
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
