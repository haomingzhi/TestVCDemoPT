//
//  JYTeacherInfoViewModel.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYTeacherInfoModel.h"
#import "JYBaseViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JYTeacherInfoViewModel : JYBaseViewModel
@property(nonatomic,strong)JYTeacherInfoModel *model;
@property(nonatomic)CGFloat jobHeight;
@property(nonatomic)CGFloat teacherSayHeight;
@property(nonatomic)CGFloat teacherIntroHeight;
@property(nonatomic)CGFloat teacherStoryHeight;
@property(nonatomic,strong)NSArray *commentList;
-(NSDictionary*)getCommentDic:(NSIndexPath*)indexPath;
-(CGFloat)getCommentHeight:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
