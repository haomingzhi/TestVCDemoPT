//
//  JYTeacherInfoViewModel.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherInfoViewModel.h"
#import "DDRequestManager.h"
#import "JYCommentModel.h"
#import "NSString+JYTool.h"
#import "JYTestDataManager.h"
@interface JYTeacherInfoViewModel()
@property(nonatomic,strong)JYBaseViewModel *obj;
@end


@implementation JYTeacherInfoViewModel


-(JYTeacherInfoModel*)model
{
    if (!_model) {
        _model = [JYTeacherInfoModel new];
    }
    return _model;
}

-(NSDictionary*)getCommentDic:(NSIndexPath*)indexPath
{
    JYCommentModel *m = self.commentList[indexPath.row];
    return [m getDic];
}

-(CGFloat)jobHeight
{
   CGSize sz = [self.model.job getSize:[UIFont systemFontOfSize:14] size:CGSizeMake(UIScreenWidth - 35, MAXFLOAT)];
    return sz.height;
//    return 49;
}

-(CGFloat)teacherSayHeight
{
    CGSize sz = [self.model.teacherSay getSize:[UIFont systemFontOfSize:14] size:CGSizeMake(UIScreenWidth - 35, MAXFLOAT)];
    return sz.height + 18;
//    return 66;
}

-(CGFloat)getCommentHeight:(NSIndexPath *)indexPath
{
    JYCommentModel *m = self.commentList[indexPath.row];
    return [m contentHeight] + 87;
//    return 129;
}



-(CGFloat)teacherIntroHeight
{
    if (_teacherIntroHeight == 0) {
        return 50;
    }
    return _teacherIntroHeight;
}

-(CGFloat)teacherStoryHeight
{
    if (_teacherStoryHeight == 0) {
         return 50;
    }
    return _teacherStoryHeight;
}

-(void)fetchDataDetail:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block
{
    __weak typeof(self) weak_self = self;
    Class c = [[DDRequestManager sharedManager] getClass:@"TeacherInfo"];
    if(c)//判断是否注册了具体对象 然后调用对象方法
    {
        if (!self.obj) {
            self.obj = [[c alloc] init];
        }
        [self.obj fetchDataDetail:parms Completion:^(BOOL success, NSString * _Nonnull message) {
            if (weak_self.obj.dataArr.count == 0) {
                return ;
            }
            NSMutableArray *arr = [NSMutableArray new];
            //            NSDictionary *d = weak_self.obj.dataArr[0];
            //            JYCheckTeacherViewModel *m = [JYCheckTeacherViewModel new];
            //            m.img = d[@"pic_url"];
            //            m.name = d[@"username"];
            //            m.content = d[@"experts_name"];
            //            m.accid = d[@"accid"];
            //            m.field = d[@"field"];
            //            [arr addObject:m];
            //            [m setValuesForKeysWithDictionary:d];
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
        self.dataArr = @[@{},@{},@{},@{},@{},@{},@{},@{}];
        block(YES,@"测试假数据");
#else
        NSLog(@"未实现方法");
#endif
    }
}

-(void)fetchDataCompletion:(void (^)(BOOL success, NSString *message))block
{
    __weak typeof(self) weak_self = self;
    Class c = [[DDRequestManager sharedManager] getClass:@"MoneyInfo"];
    if(c)//判断是否注册了具体对象 然后调用对象方法
    {
        if (!self.obj) {
            self.obj = [[c alloc] init];
        }
        [self.obj fetchDataCompletion:^(BOOL success, NSString * _Nonnull message) {
            
            weak_self.dataArr = weak_self.obj.dataArr;
            weak_self.page = weak_self.obj.page;
            weak_self.pageCount = weak_self.obj.pageCount;
            block(YES,message);
        }];
    }
    else
    {
#ifdef DEBUG
        self.dataArr = @[@{},@{},@{},@{},@{},@{},@{},@{}];
        block(YES,@"测试假数据");
#else
        NSLog(@"未实现方法");
#endif
    }
}

-(void)fetchData:(NSDictionary *)parms Completion:(void (^)(BOOL,NSString *))block
{
    __weak typeof(self) weak_self = self;
    Class c = [[DDRequestManager sharedManager] getClass:@"TeacherInfo"];
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
        [[JYTestDataManager sharedManager] buildData:NSClassFromString(@"JYCommentModel") callBack:^(NSArray * _Nonnull arr) {
            
            //            weak_self.curTab.curLevel.dataArr = arr;
            
            weak_self.commentList =arr;
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
