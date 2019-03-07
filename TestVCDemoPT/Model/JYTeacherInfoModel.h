//
//  JYTeacherInfoModel.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JYTeacherInfoModel : JYBaseModel
@property(nonatomic,strong)NSString *img;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *marks;
@property(nonatomic,strong)NSArray *markArr;
@property(nonatomic,strong)NSString *job;
@property(nonatomic,strong)NSString *goodAt;
@property(nonatomic,strong)NSString *years;
@property(nonatomic,strong)NSString *timeZx;
@property(nonatomic,strong)NSString *teacherSay;
@property(nonatomic,strong)NSString *intro;
@property(nonatomic,strong)NSString *teacherStory;
@property(nonatomic,strong)NSString *mark2s;
@property(nonatomic,strong)NSArray *mark2Arr;
-(NSDictionary *)getDic;
-(NSDictionary *)getDic:(NSIndexPath *)indexPath;
-(NSDictionary *)getDic:(NSIndexPath *)indexPath type:(NSInteger)type;
@end

NS_ASSUME_NONNULL_END
