//
//  JYTeacherInfoModel.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherInfoModel.h"
#import "JYCommentModel.h"
#import "JYTestDataManager.h"
@implementation JYTeacherInfoModel
-(NSDictionary *)getDic
{
   
    return @{@"job":_job?:@"",@"name":_name?:@"",@"goodAt":_goodAt?:@"",@"img":_img?:@"",@"zx":_timeZx?:@"",@"mark":self.markArr?:@[],@"infoMark":self.mark2Arr?:@[]};
}

-(NSDictionary *)getDic:(NSIndexPath *)indexPath
{
    return [self getDic:indexPath type:0];
}
-(NSDictionary *)getDic:(NSIndexPath *)indexPath type:(NSInteger)type
{
    if(indexPath.section == 0)
    {
        return @{@"img":self.img?:@""};
    }
    else if(indexPath.section == 1)
    {
        if (indexPath.row == 0) {
           
            return @{@"title":_name?:@"",@"mark":_markArr?:@[]};
        }
        else if (indexPath.row == 1)
        {
           
            return @{@"title":_job?:@""};
        }
        else  if (indexPath.row == 2)
        {
           
            return @{@"title":_goodAt?:@""};
        }
        else
        {
           
            return @{@"title":_years?:@"",@"info":_timeZx?:@""};
        }
    }
    else if(indexPath.section == 2)
    {
        if (type == 0)
        {
          
            if (indexPath.row == 0)
            {
                return @{@"title":@"老师说"};
            }
            else
            {
                
                return @{@"title":_teacherSay?:@""};
            }
        }
        else
        {
            
            if (indexPath.row == 0) {
                return @{@"title":@"个人简介"};
            }
            else
            {

                return @{@"title":_intro?:@""};
            }
        }
    }
    else
    {
          if (type == 0)
          {
            return @{@"title":@"咨询方式",@"img":@"咨询方式",@"info":@"24小时  图文+语音/次"};
          }
          else
          {

              if (indexPath.row == 0) {
                  return @{@"title":@"老师故事"};
              }
              else
              {
                 
                  return @{@"title":_teacherStory?:@""};
              }
          }
    }
    
    return @{};
}

-(void)buildTestData
{
//    NSLog(@"%@ %s",@"未实现方法",__func__);
    _job = [NSString stringWithFormat:@"%@",[[JYTestDataManager sharedManager] buildChineseWord:16]];//@"师范大学心理学教授、中国职业规划师";
    _name = [[JYTestDataManager sharedManager] buildName] ;//@"排班密码";
    _goodAt = [NSString stringWithFormat:@"擅长:%@",[[JYTestDataManager sharedManager] buildChineseWord:16]];//@"擅长：学科选择、志愿填报";
    _timeZx = [NSString stringWithFormat:@"%@次咨询",@([[JYTestDataManager sharedManager] buildIntValue:1000])];//@"323次咨询";
    _years =  [NSString stringWithFormat:@"%@年 从业",@([[JYTestDataManager sharedManager] buildIntValue:30])];//@"8年 从业";
    self.markArr = [[JYTestDataManager sharedManager] buildMark];//@[@"强力推荐"];
    self.mark2Arr = [[JYTestDataManager sharedManager] buildInfoMark];//@[@"15分钟恢复",@"名师"];
    _teacherSay = [[JYTestDataManager sharedManager] buildArcArticle];//@"“我一共带过630个孩子填报志愿，其中450个孩子考上了比原定目标更好的大学，180个孩子出国深造，相信你的孩子也能！”";
    _teacherStory = [[JYTestDataManager sharedManager] buildArcArticle];//@"我一共带过630个孩子填报志愿，其中450个孩子考上了比原定目标更好的大学，180个孩子出国深造，相信你的孩子也能！我为您探索微信小程序用户的认知、行为特点，及对未来小程序的使用诉求等。";
    _intro = [[JYTestDataManager sharedManager] buildArcArticle];//@"“我一共带过630个孩子填报志愿，其中450个孩子考上了比原定目标更好的大学，180个孩子出国深造，相信你的孩子也能！”";
}
@end
