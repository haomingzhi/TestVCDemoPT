//
//  JYBaseViewModel.h
//  Model
//
//  Created by apple on 2018/10/30.
//  Copyright © 2018 ORANLLC_IOS1. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYBaseViewModel : NSObject
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)NSInteger pageCount;
@property(nonatomic)NSInteger state;
@property(nonatomic,strong)NSArray *dataArr;//总共的
@property(nonatomic,strong)NSArray *nextDataArr;//新加的dataArr
-(void)fetchDataCompletion:(void (^)(BOOL success, NSString *message))block;
-(void)fetchDataDetail:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block;
-(void)fetchNextPageDataCompletion:(void (^)(BOOL success, NSString *message))block;
-(BOOL)hasMore;
-(void)fetchData:(NSDictionary *)parms Completion:(void (^)(BOOL, NSString *))block;
-(void)addData:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block;
-(void)deleteData:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block;
-(void)editData:(NSDictionary *)parms Completion:(void (^)(BOOL success, NSString *message))block;
@end

NS_ASSUME_NONNULL_END
