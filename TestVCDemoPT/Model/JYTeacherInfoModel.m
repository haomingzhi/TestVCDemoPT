//
//  JYTeacherInfoModel.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherInfoModel.h"
#import "JYCommentModel.h"
@implementation JYTeacherInfoModel
-(NSDictionary *)getDic
{
    _job = @"师范大学心理学教授、中国职业规划师";
    _name = @"排班密码";
    _goodAt = @"擅长：学科选择、志愿填报";
    _timeZx = @"323次咨询";
    self.markArr = @[@"强力推荐"];
    self.mark2Arr = @[@"15分钟恢复",@"名师"];
    return @{@"job":_job?:@"",@"name":_name?:@"",@"goodAt":_goodAt?:@"",@"img":_img?:@"",@"zx":_timeZx?:@"",@"mark":self.markArr?:@[],@"infoMark":self.mark2Arr?:@[]};
}
-(NSDictionary *)getDic:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return @{@"img":self.img?:@""};
    }
    else if(indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            _name = @"林佳";
            _markArr = @[@"强力推荐"];
            return @{@"title":_name?:@"",@"mark":_markArr?:@[]};
        }
        else if (indexPath.row == 1)
        {
            _job = @"师范大学心理学教授\n中国职业规划师\n校园在线教育顾问";
            return @{@"title":_job?:@""};
        }
        else  if (indexPath.row == 2)
        {
            _goodAt = @"擅长：升学、选科、志愿填报";
            return @{@"title":_goodAt?:@""};
        }
        else
        {
            _years = @"8年 从业";
            _timeZx = @"231次 咨询";
            return @{@"title":_years?:@"",@"info":_timeZx?:@""};
        }
    }
    else if(indexPath.section == 2)
    {
        _teacherSay = @"“我一共带过630个孩子填报志愿，其中450个孩子考上了比原定目标更好的大学，180个孩子出国深造，相信你的孩子也能！”";
        return @{@"title":_teacherSay?:@""};
    }
    
    return @{};
}
@end
