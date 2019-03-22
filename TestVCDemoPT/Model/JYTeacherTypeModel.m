//
//  JYTeacherTypeModel.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherTypeModel.h"
#import "NSString+JYTool.h"
#import "JYTestDataManager.h"
@implementation JYTeacherTypeModel
-(NSDictionary *)getDic
{
    return @{@"title":_type?:@"",@"level":_level?:@"",@"img":_img?:@""};
    
}
#ifdef DEBUG
-(void)buildTestData
{
    self.type = [[JYTestDataManager sharedManager] buildChineseWord:15];
    self.level = [[JYTestDataManager sharedManager] buildChineseWord:14];
    self.img = [[JYTestDataManager sharedManager] buildImg];
   
}
#endif
@end
