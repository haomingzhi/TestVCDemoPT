//
//  JYCommentModel.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYCommentModel.h"
#import "NSString+JYTool.h"
#import "JYTestDataManager.h"
@implementation JYCommentModel
-(NSDictionary *)getDic
{
//    _content = @"你怎样度过自己的一生？我从来不把安逸和享乐看作是生活目的本身。非共带过630个孩子填报志愿，其中450个孩子考上了比原定目标更好的大学，180个";
//    _time = @"2018-09-22";
//    _point = @5;
//    _name = @"排班密码";
    return @{@"title":_content?:@"",@"time":_time?:@"",@"img":@"",@"point":_point?:@0,@"name":_name?:@""};
}

-(CGFloat)contentHeight
{
    if (_contentHeight == 0) {
      CGSize sz = [_content getSize:[UIFont systemFontOfSize:14] size:CGSizeMake(UIScreenWidth - 35, MAXFLOAT)];
        _contentHeight = sz.height;
    }
    return _contentHeight;
//    return 129;
}

#ifdef DEBUG
-(void)buildTestData
{
    self.content = [[JYTestDataManager sharedManager] buildArcArticle];
    self.time = [[JYTestDataManager sharedManager] buildDateTime];
    self.point = [[NSNumber alloc] initWithInteger:[[JYTestDataManager sharedManager] buildPoint]];
    self.name = [[JYTestDataManager sharedManager] buildName];
}
#endif
@end
