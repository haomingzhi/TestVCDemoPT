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
#import "JYTestDataManager.h"
@interface JYCommentListViewModel()
@property(nonatomic,strong)JYBaseViewModel *obj;
@end

@implementation JYCommentListViewModel

-(BOOL)hasMore
{
    
    if (self.page >= self.pageCount) {
        return NO;
    }
    return YES;
}

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
//        self.dataArr = @[];
        self.page = 1;
        [[JYTestDataManager sharedManager] buildData:NSClassFromString(@"JYCommentModel") callBack:^(NSArray * _Nonnull arr) {
            
            //            weak_self.curTab.curLevel.dataArr = arr;
            weak_self.pageCount = 3;//(arr.count + 5)/6;
            weak_self.dataArr = [arr subarrayWithRange:NSMakeRange(0, MIN(6, arr.count))];
            weak_self.state = 1;
            block(YES,@"测试假数据");
        }];
//        NSMutableArray *arr = [NSMutableArray new];
//        for (NSInteger i = 0;i < 7; i++) {
//            JYCommentModel *m = [JYCommentModel new];
//            [arr addObject:m];
//        }
//        self.dataArr =arr;
//        block(YES,@"测试假数据");
#else
        NSLog(@"未实现方法%@  %@",[self Class],__cmd);
#endif
    }
}



-(void)fetchNextPageDataCompletion:(void (^)(BOOL success, NSString *message))block
{
    __weak typeof(self) weak_self = self;
    Class c = [[DDRequestManager sharedManager] getClass:@"JYCommentModel"];
    if(c)//判断是否注册了具体对象 然后调用对象方法
    {
        if (!self.obj) {
            self.obj = [[c alloc] init];
        }
        [self.obj fetchNextPageDataCompletion:^(BOOL success, NSString * _Nonnull message) {
            NSMutableArray *arr = [NSMutableArray new];
            //            [weak_self.obj.nextDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //                NSDictionary *d = obj;
            //                JYCheckTeacherViewModel *m = [JYCheckTeacherViewModel new];
            //                m.img = d[@"pic_url"];
            //                m.name = d[@"username"];
            //                m.content = d[@"experts_name"];
            //                m.accid = d[@"accid"];
            //                m.field = d[@"field"];
            //                [arr addObject:m];
            //                [m setValuesForKeysWithDictionary:d];
            //            }];
            //            NSMutableArray *mm = [NSMutableArray new];
            //            [mm addObjectsFromArray:weak_self.dataArr];
            //            [mm addObjectsFromArray:arr];
            //            weak_self.dataArr = mm;
            weak_self.page = weak_self.obj.page;
            weak_self.pageCount = weak_self.obj.pageCount;
            weak_self.state = 1;
            block(YES,message);
        }];
    }
    else
    {
#ifdef DEBUG
        self.page ++;
        [[JYTestDataManager sharedManager] buildData:NSClassFromString(@"JYCommentModel") callBack:^(NSArray * _Nonnull arr) {
            
            //            weak_self.curTab.curLevel.dataArr = arr;
//            weak_self.page = weak_self.obj.page;
            NSMutableArray *ma = [NSMutableArray arrayWithArray:weak_self.dataArr];
            [ma addObjectsFromArray:[arr subarrayWithRange:NSMakeRange(0, MIN(6, arr.count))]];
            weak_self.pageCount = 3;//(ma.count + 5)/6;
            weak_self.dataArr = ma;
            weak_self.state = 1;
            block(YES,@"测试假数据");
        }];
#else
        NSLog(@"未实现方法%@  %@",[self Class],__cmd);
#endif
    }
}
@end
