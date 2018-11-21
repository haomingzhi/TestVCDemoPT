//
//  VCManager.h
//  TestVCDemoPT
//
//  Created by apple on 2018/11/21.
//  Copyright © 2018 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCManager : NSObject
+ (instancetype)sharedManager;
-(void)regsisterClass:(NSString *)noticename obj:(NSString*)objName type:(NSInteger )viewType;
-(void)regsisterClass:(NSString *)noticename obj:(NSString*)objName;
-(Class)getClass:(NSString *)noticename;
@end

NS_ASSUME_NONNULL_END
