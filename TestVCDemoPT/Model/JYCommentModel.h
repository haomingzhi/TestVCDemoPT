//
//  JYCommentModel.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYCommentModel : NSObject
@property(nonatomic,strong)NSString *img;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSNumber *point;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *time;
@property(nonatomic)CGFloat contentHeight;
-(NSDictionary *)getDic;

@end

NS_ASSUME_NONNULL_END
