//
//  JYCommentListViewModel.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYCommentListViewModel.h"
#import "DDRequestManager.h"
#import "JYCommentModel.h"
#import "NSString+JYTool.h"
@interface JYCommentListViewModel()
@property(nonatomic,strong)JYBaseViewModel *obj;
@end

@implementation JYCommentListViewModel


-(CGFloat)getCommentHeight:(NSIndexPath *)indexPath
{
  JYCommentModel *m = self.dataArr[indexPath.row];
    return 87 + m.contentHeight;
}

-(void)fetchData:(NSDictionary *)parms Completion:(void (^)(BOOL,NSString *))block
{
    __weak typeof(self) weak_self = self;
    Class c = [[DDRequestManager sharedManager] getClass:@"CommentList"];
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
//        self.dataArr = @[@{},@{},@{},@{},@{},@{},@{},@{}];
        NSMutableArray *arr = [NSMutableArray new];
        for (NSInteger i = 0;i < 7; i++) {
            JYCommentModel *m = [JYCommentModel new];
            [arr addObject:m];
        }
        self.dataArr =arr;
        block(YES,@"测试假数据");
#else
        NSLog(@"未实现方法%@  %@",[self Class],__cmd);
#endif
    }
}
@end