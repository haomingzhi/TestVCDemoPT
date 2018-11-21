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
@property(nonatomic,strong)NSMutableDictionary *cellDic;
@property(nonatomic,strong)NSMutableDictionary *dialogDic;
@property(nonatomic,strong)NSMutableDictionary *viewDic;
@end

@implementation VCManager
+ (instancetype)sharedManager
{
    static VCManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[VCManager alloc] init];
        instance.dic = [NSMutableDictionary new];
        instance.cellDic = [NSMutableDictionary new];
         instance.dialogDic = [NSMutableDictionary new];
         instance.viewDic = [NSMutableDictionary new];
    });
    return instance;
}
-(void)regsisterClass:(NSString *)noticename obj:(NSString*)objName type:(NSInteger )viewType
{
    if([[NSBundle mainBundle] classNamed:objName])
    {
        Class c = [[NSBundle mainBundle] classNamed:objName];
        _dic[noticename] = c;
    }
    else
    {
        if (viewType == 0) {
             _dic[noticename] = [UIViewController new];
        }
        else if (viewType == 1)
        {
            _cellDic[noticename] = [UITableViewCell new];
        }
        else if (viewType == 2)
        {
            _dialogDic[noticename] = [UIView new];
        }
        else
        {
             _viewDic[noticename] = [UIView new];
        }
       
        NSLog(@"未实行Request对象");
    }
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
         _dic[noticename] = [UIViewController new];
        NSLog(@"未实行Request对象");
    }
    
}
-(Class)getClass:(NSString *)noticename
{
    return _dic[noticename];
}
@end
