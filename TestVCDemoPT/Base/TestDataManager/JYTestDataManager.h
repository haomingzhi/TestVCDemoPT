//
//  JYTestDataManager.h
//  DDZX_js
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYTestDataManager : NSObject
+ (instancetype)sharedManager;
-(void)buildData:(Class)obj callBack:(void (^)( NSArray *arr))block;
-(NSString *)buildChineseWord:(NSInteger)length;
-(NSString *)getFamilyName;
-(NSString *)buildDateTime;
-(NSString *)buildDate;
-(NSString *)buildArcArticle;
-(NSString *)buildArticle:(NSInteger )length;
-(NSString *)buildTitle:(NSInteger )length;
-(NSString *)buildName;
-(NSInteger)buildPoint;
-(NSInteger)buildIntValue;
-(CGFloat)buildFloatValue;
-(CGFloat)buildFloatValue:(NSInteger)i;
-(NSInteger)buildIntValue:(NSInteger)i;
-(NSArray *)buildMark;
-(NSArray *)buildMarks:(NSArray *)arr;
-(NSArray *)buildInfoMark;
-(NSString *)buildImg;
@end

NS_ASSUME_NONNULL_END
