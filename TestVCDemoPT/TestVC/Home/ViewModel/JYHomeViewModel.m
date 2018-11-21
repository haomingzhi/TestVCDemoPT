//
    //  HomeViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYHomeViewModel.h"
#import "DDRequestManager.h"

@interface JYHomeViewModel()
@property(nonatomic,strong)JYBaseViewModel *obj;
@end
@implementation JYHomeViewModel
-(void)fetchDataDetail:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block
{
    __weak typeof(self) weak_self = self;
    Class c = [[DDRequestManager sharedManager] getClass:@"Home"];
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
    Class c = [[DDRequestManager sharedManager] getClass:@"Home"];
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
    Class c = [[DDRequestManager sharedManager] getClass:@"Home"];
    if(c)//判断是否注册了具体对象 然后调用对象方法
    {
        if (!self.obj) {
            self.obj = [[c alloc] init];
        }
        [self.obj fetchData:parms  Completion:^(BOOL success, NSString * _Nonnull message) {
            NSMutableArray *arr = [NSMutableArray new];
//            [weak_self.obj.dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
//            weak_self.dataArr = arr;
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


-(void)fetchNextPageDataCompletion:(void (^)(BOOL success, NSString *message))block
{
    __weak typeof(self) weak_self = self;
    Class c = [[DDRequestManager sharedManager] getClass:@"Home"];
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
        self.dataArr = @[@{},@{},@{},@{},@{},@{},@{},@{}];
        block(YES,@"测试假数据");
#else
        NSLog(@"未实现方法");
#endif
    }
}
-(void)addData:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block
{
    Class c = [[DDRequestManager sharedManager] getClass:@"Home"];
    if(c)//判断是否注册了具体对象 然后调用对象方法
    {
        if (!self.obj) {
            self.obj = [[c alloc] init];
        }
        [self.obj addData:parms  Completion:^(BOOL success, NSString * _Nonnull message) {
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
-(void)deleteData:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block
{
    Class c = [[DDRequestManager sharedManager] getClass:@"Home"];
    if(c)//判断是否注册了具体对象 然后调用对象方法
    {
        if (!self.obj) {
            self.obj = [[c alloc] init];
        }
        [self.obj deleteData:parms  Completion:^(BOOL success, NSString * _Nonnull message) {
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

-(void)editData:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block
{
    Class c = [[DDRequestManager sharedManager] getClass:@"Home"];
    if(c)//判断是否注册了具体对象 然后调用对象方法
    {
        if (!self.obj) {
            self.obj = [[c alloc] init];
        }
        [self.obj editData:parms  Completion:^(BOOL success, NSString * _Nonnull message) {
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
@end