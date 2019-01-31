//
//  JYLoginManager.m
//  TestVCDemoPT
//
//  Created by apple on 2019/1/31.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYLoginManager.h"

@implementation JYLoginManager
-(void)setIsLogin:(BOOL)isLogin
{
     UserDefaultSetBOOLForKey(isLogin, @"isLogin");
}

-(BOOL)isLogin
{
      return UserDefaultBOOLForKey(@"isLogin");
}
+ (instancetype)sharedManager
{
    static JYLoginManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JYLoginManager alloc] init];
    
    });
    return instance;
}

-(void)login:(id)data complete:(void (^)(id _Nonnull))callback
{
    if (_delegate && [_delegate respondsToSelector:@selector(login:complete:)]) {
        [_delegate login:data complete:^(id  _Nonnull data) {
            callback(data);
        }];
    }
}


@end
