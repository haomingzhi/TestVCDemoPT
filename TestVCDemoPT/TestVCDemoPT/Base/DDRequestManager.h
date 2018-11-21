//
//  DDRequestManager.h
//  DDIMsdk
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYBaseViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DDRequestManager : NSObject
+ (instancetype)sharedManager;
-(void)regsisterClass:(NSString *)noticename obj:(NSString*)objName;
-(Class)getClass:(NSString *)noticename;
@end

NS_ASSUME_NONNULL_END
