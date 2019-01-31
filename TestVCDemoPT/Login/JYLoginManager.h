//
//  JYLoginManager.h
//  TestVCDemoPT
//
//  Created by apple on 2019/1/31.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYUserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol JYLoginDelegate <NSObject>

@optional
-(void)login:(NSDictionary *)dic complete:(void (^)(id data)) callback;

@end

@interface JYLoginManager : NSObject

+ (instancetype)sharedManager;
@property(nonatomic)BOOL isLogin;
@property(nonatomic,strong) id <JYLoginDelegate> delegate;
-(void)login:(NSDictionary *)data complete:(void (^)(id data)) callback;
@end

NS_ASSUME_NONNULL_END
