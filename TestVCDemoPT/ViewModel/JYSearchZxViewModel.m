//
//  JYSearchZxViewModel.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYSearchZxViewModel.h"
#import "DDRequestManager.h"
#import "JYCommentModel.h"
#import "NSString+JYTool.h"
#import "JYTestDataManager.h"

@interface JYSearchZxViewModel()
@property(nonatomic,strong)JYBaseViewModel *obj;
@end

@implementation JYSearchZxViewModel
-(void)fetchData:(NSDictionary *)parms Completion:(void (^)(BOOL,NSString *))block
{
    __weak typeof(self) weak_self = self;
    Class c = [[DDRequestManager sharedManager] getClass:@"SearchZx"];
    if(c)//判断是否注册了具体对象 然后调用对象方法
    {
        if (!self.obj) {
            self.obj = [[c alloc] init];
        }
        [self.obj fetchData:parms  Completion:^(BOOL success, NSString * _Nonnull message) {
            NSMutableArray *arr = [NSMutableArray new];
            //            [weak_self.obj.dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //                NSDictionary *d = obj;
            //                JYMoneyInfoModel *m = [JYMoneyInfoModel new];
            //
            //                [arr addObject:m];
            //                [m setValuesForKeysWithDictionary:d];
            //            }];
            weak_self.dataArr = arr;
            weak_self.page = weak_self.obj.page;
            weak_self.pageCount = weak_self.obj.pageCount;
            weak_self.state = 1;
            block(YES,message);
        }];
    }
    else
    {
#ifdef DEBUG
        [[JYTestDataManager sharedManager] buildData:NSClassFromString(@"JYTeacherTypeModel") callBack:^(NSArray * _Nonnull arr) {
            
            //            weak_self.curTab.curLevel.dataArr = arr;
            
            weak_self.dataArr =arr;
            weak_self.state = 1;
            block(YES,@"测试假数据");
        }];
        //        self.dataArr = @[@{},@{},@{},@{},@{},@{},@{},@{}];
        //        NSMutableArray *arr = [NSMutableArray new];
        //        for (NSInteger i = 0;i < 7; i++) {
        //            JYCommentModel *m = [JYCommentModel new];
        //            [arr addObject:m];
        //        }
        //        self.commentList =arr;
        //        block(YES,@"测试假数据");
#else
        NSLog(@"未实现方法%@  %@",[self Class],__cmd);
#endif
    }
}
@end
