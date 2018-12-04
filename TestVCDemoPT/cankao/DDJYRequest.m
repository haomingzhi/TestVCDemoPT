//
//  DDJYRequest.m
//  DDZX_js
//
//  Created by apple on 2018/8/8.
//  Copyright © 2018年 wjy. All rights reserved.
//

#import "DDJYRequest.h"
#import "DDJYRequesterParser.h"
#import "NSString+MD5.h"
#import "UserInfoModel.h"
//#import "Api.h"
#import "DDJYApi.h"
#import <JYLibrary/JYLibrary.h>
#import <AFNetworking/AFNetworking.h>

@implementation DDJYRequest

+ (void)getCityListWithParams:(NSDictionary *)parmas completion:(void (^)(BOOL, NSArray *, NSString *))block {
    
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, getCityList];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionaryWithDictionary:parmas];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseCity:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseCity:NO responseObject:nil error:error completion:block];
        
    }];
}

+ (void)getSchoolListWithParams:(NSDictionary *)parmas completion:(void (^)(BOOL, NSArray *, NSString *))block {
    
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, getSchoolList];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionaryWithDictionary:parmas];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:@"" andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseSchool:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseSchool:NO responseObject:nil error:error completion:block];
        
    }];
}


+(void)addExpertAnswer:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiAnswerAddExpertAnswer];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    parDic[@"expert_id"] = [UserInfoModel sharedUserInfoModel].user_id;
    parDic[@"school_id"] = UserInfoModel.sharedUserInfoModel.school_id;
    parDic[@"ustype"] = UserInfoModel.sharedUserInfoModel.utype;
    parDic[@"token"] = [UserInfoModel sharedUserInfoModel].token;
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseAddExpertAnswer:YES responseObject:responseObject error:nil
                                       completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseAddExpertAnswer:NO responseObject:nil error:error
                                       completion:block];
        
    }];
}

+(void)saveExpertAnswer:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiAnswerSaveExpertAnswer];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseSaveExpertAnswer:YES responseObject:responseObject error:nil
                                        completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseSaveExpertAnswer:NO responseObject:nil error:error
                                        completion:block];
        
    }];
}

+(void)deleteExpertAnswer:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiAnswerDeleteExpertAnswer];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    parDic[@"token"] = [UserInfoModel sharedUserInfoModel].token;
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseDeleteExpertAnswer:YES responseObject:responseObject error:nil
                                          completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseDeleteExpertAnswer:NO responseObject:nil error:error
                                          completion:block];
        
    }];
}

+(void)addEvaluate:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiEvaluateAddEvaluate];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseAddEvaluate:YES responseObject:responseObject error:nil
                                   completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseAddEvaluate:NO responseObject:nil error:error
                                   completion:block];
        
    }];
}

+(void)addComment:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiCommentAddComment];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
        [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseAddEvaluate:YES responseObject:responseObject error:nil
                                   completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseAddEvaluate:NO responseObject:nil error:error
                                   completion:block];
        
    }];
}

+(void)addConsultation:(NSDictionary *)dic completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiConsultationAddConsultation];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        //                [DDJYRequesterParser parseAnswerListData:YES responseObject:responseObject error:nil
        //                                              completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        //                [DDJYRequesterParser parseAnswerListData:NO responseObject:nil error:error
        //                                              completion:block];
        
    }];
}

+(void)answerInfo:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiAnswerAnswerInfo];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseAnswerInfo:YES responseObject:responseObject error:nil
                                  completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseAnswerInfo:NO responseObject:nil error:error
                                  completion:block];
        
    }];
}

+(void)answerExpertInfo:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiAnswerAnswerExpertInfo];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseAnswerExpertInfo:YES responseObject:responseObject error:nil
                                        completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseAnswerExpertInfo:NO responseObject:nil error:error
                                        completion:block];
        
    }];
}

+(void)getUserInfo:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiUserGetUserInfo];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseUserInfoData:YES responseObject:responseObject error:nil
                                    completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseUserInfoData:NO responseObject:nil error:error
                                    completion:block];
        
    }];
}

+(void)getColumnMerger:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiActivityColumnMerger];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
//    [parDic setValue:[self backTimeinterval] forKey:@"time"];
//    parDic[@"token"] = [UserInfoModel sharedUserInfoModel].token;
//    parDic[@"platform"] = @"iOS";
//    parDic[@"sign"] = [self backSign:nil andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:nil forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        NSLog(@"url == %@",task.response.URL);
        [DDJYRequesterParser parseGetColumnMerger:YES responseObject:responseObject error:nil
                                       completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseGetColumnMerger:NO responseObject:nil error:error
                                       completion:block];
        
    }];
}

+(void)getAnswerListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiGetAnswerList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseAnswerListData:YES responseObject:responseObject error:nil
                                      completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseAnswerListData:NO responseObject:nil error:error
                                      completion:block];
        
    }];
}

+(void)getAboutMyNotiListWithLastMessageId:(NSInteger)lastMessageId pagesize:(NSInteger)pagesize Completion:(void (^)(BOOL success, NSDictionary *data, NSString *message))block{
    NSString *URL = [NSString stringWithFormat:@"%@%@",imDev_Url, getAboutMyNotiList];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    
    [parDic setObject:@(lastMessageId) forKey:@"id"];
    [parDic setObject:@(pagesize) forKey:@"pagesize"];
    
    [parDic setValue:[NSString stringWithFormat:@"V%@",[XTool getCurrentAppVersion]] forKey:@"version"];
    
    
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:getAboutMyNotiList andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseAnswerListData:YES responseObject:responseObject error:nil
                            completion:block];
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseAnswerListData:NO responseObject:nil error:error
                            completion:block];
    }];
}

+(void)getExpertAnswerListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiGetExpertAnswerList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseExpertAnswerListData:YES responseObject:responseObject error:nil
                                            completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseExpertAnswerListData:NO responseObject:nil error:error
                                            completion:block];
        
    }];
}

+(void)getExpertListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiGetExpertList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseGetExperList:YES responseObject:responseObject error:nil
                                    completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseGetExperList:NO responseObject:nil error:error
                                    completion:block];
        
    }];
}

+(void)articleInfo:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, articleManageArticleInfo];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseData:YES responseObject:responseObject error:nil
                                     completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseData:NO responseObject:nil error:error
                                     completion:block];
        
    }];
}
+(void)getArticleListV2:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, articleManagegetArticleListV2];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseArticleListV2:YES responseObject:responseObject error:nil
                                    completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseArticleListV2:NO responseObject:nil error:error
                                    completion:block];
        
    }];
}


+(void)getTestAnswerListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiScaleSolutionList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseTestAnswerListData:YES responseObject:responseObject error:nil
                                          completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseTestAnswerListData:NO responseObject:nil error:error
                                          completion:block];
        
    }];
}

+(void)getTestListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiGetTestListData];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager POST:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseTestListData:YES responseObject:responseObject error:nil
                                    completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseTestListData:NO responseObject:nil error:error
                                    completion:block];
        
    }];
}

#pragma mark - Private
+(void)login:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiLogin];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    NSString *tempStr = [URL stringByAppendingString:@"?"];
    for (NSString *key in parDic.allKeys) {
        tempStr = [tempStr stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",key,[parDic objectForKey:key]]];
    }
    DLog(@"fullUrl = %@",tempStr);
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseLogin:YES responseObject:responseObject error:nil
                             completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseLogin:NO responseObject:nil error:error
                             completion:block];
        
    }];
}

+(void)supplementOrder:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiActivityDetailSupplementOrder];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
       [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseData:YES responseObject:responseObject error:nil
                            completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseData:NO responseObject:nil error:error
                            completion:block];
        
    }];
}

+(void)addorder:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, payApiAddorder];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
      [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseData:YES responseObject:responseObject error:nil
                            completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseData:NO responseObject:nil error:error
                            completion:block];
        
    }];
}

+(void)participateActivityDetail:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiActivityDetailParticipateActivityDetail];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
       [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOs" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseData:YES responseObject:responseObject error:nil
                            completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseData:NO responseObject:nil error:error
                            completion:block];
        
    }];
}

+(void)getOrderDetail:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiActivityDetailGetOrderDetail];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
        [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:nil forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseData:YES responseObject:responseObject error:nil
                             completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseData:NO responseObject:nil error:error
                             completion:block];
        
    }];
}


+(void)loginExpert:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiLoginExpert];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseLogin:YES responseObject:responseObject error:nil
                             completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseLogin:NO responseObject:nil error:error
                             completion:block];
        
    }];
}

+(void)getBroadcast:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiActivityDetailGetBroadcast];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseGetBroadcast:YES responseObject:responseObject error:nil
                                    completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseGetBroadcast:NO responseObject:nil error:error
                                    completion:block];
        
    }];
}

+(void)getSchoolListV2:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiPublicsGetSchoolListV2];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseGetSchoolListV2:YES responseObject:responseObject error:nil
                                       completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseGetSchoolListV2:NO responseObject:nil error:error
                                       completion:block];
        
    }];
}

+(void)getActivityDetailList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiActivityDetailActivityDetailList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseActivityDetailList:YES responseObject:responseObject error:nil
                                          completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseActivityDetailList:NO responseObject:nil error:error
                                          completion:block];
        
    }];
}

+(void)getArticleOrderList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiActivityDetailArticleOrderList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseGetArticleOrderList:YES responseObject:responseObject error:nil
                                           completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseGetArticleOrderList:NO responseObject:nil error:error
                                           completion:block];
        
    }];
    
}
+(void)getExpertPushList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiExpertExpertPushList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseExpertPushList:YES responseObject:responseObject error:nil
                                      completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseExpertPushList:NO responseObject:nil error:error
                                      completion:block];
        
    }];
    
}
+(void)getCareerVideoList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiAioTopicCareerVideoList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    //    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    //    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseGetCareerVideoList:YES responseObject:responseObject error:nil
                                          completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseGetCareerVideoList:NO responseObject:nil error:error
                                          completion:block];
        
    }];
    
}

+(void)expertSign:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiExpertExpertSign];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].user_id forKey:@"exper_id"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseExpertSign:YES responseObject:responseObject error:nil
                                  completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseExpertSign:NO responseObject:nil error:error
                                  completion:block];
        
    }];
    
}

+ (void)getAppraisalTypeListCompletion:(void (^)(BOOL, NSArray *, NSString *))block {
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, DDapiGetAppraisalTypeList];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    
    
    [parDic setValue:@"2" forKey:@"term_type"];
    
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseAppraisalTypeList:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseAppraisalTypeList:NO responseObject:nil error:error completion:block];
        
    }];
}


+(void)getAppraisalListWithZone_id:(NSString *)zone_id type:(NSString *)type completion:(void (^)(BOOL, NSArray *, NSString *))block {
    
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, DDapiAppraisalList];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    
    [parDic setValue:zone_id forKey:@"zone_id"];
    [parDic setValue:[NSNumber numberWithInteger:[type integerValue]] forKey:@"type"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseAppraisalList:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseAppraisalList:NO responseObject:nil error:error completion:block];
        
    }];
}
+(void)getQuestionTermType:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiFeedbackGetQuestionTermType];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseGetQuestionTermType:YES responseObject:responseObject error:nil
                                           completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseGetQuestionTermType:NO responseObject:nil error:error
                                           completion:block];
        
    }];
    
}


+(void)collectManageGetList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiCollectManageGetList];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseCollectManageGetList:YES responseObject:responseObject error:nil
                                            completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseCollectManageGetList:NO responseObject:nil error:error
                                            completion:block];
        
    }];
    
}

+(void)tutorFeedback:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiFeedbackTutorFeedback];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseTutorFeedback:YES responseObject:responseObject error:nil
                                     completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseTutorFeedback:NO responseObject:nil error:error
                                     completion:block];
        
    }];
    
}

+ (void)getAppraisalReportListWithUser_id:(NSNumber *)user_id type_id:(NSString *)type_id page:(NSNumber *)page pageSize:(NSNumber *)pageSize completion:(void (^)(BOOL, NSDictionary *, NSString *))block{
    
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, DDapiGetResultList];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    
    [parDic setValue:user_id forKey:@"user_id"];
    [parDic setValue:type_id forKey:@"type_id"];
    [parDic setValue:page forKey:@"page"];
    [parDic setValue:pageSize forKey:@"page_size"];
    
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseAppraisalReportList:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseAppraisalReportList:NO responseObject:nil error:error completion:block];
        
    }];
}


+(void)saveMobile:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiUserSaveMobile];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseSaveMobile:YES responseObject:responseObject error:nil
                                  completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseSaveMobile:NO responseObject:nil error:error
                                  completion:block];
        
    }];
    
}

+(void)resetPasswordByTel:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiUserResetPasswordByTel];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseResetPasswordByTel:YES responseObject:responseObject error:nil
                                          completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseResetPasswordByTel:NO responseObject:nil error:error
                                          completion:block];
        
    }];
    
}


+(void)sendCode:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiSmsSendCode];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseSendCode:YES responseObject:responseObject error:nil
                                completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseSendCode:NO responseObject:nil error:error
                                completion:block];
        
    }];
}

+(void)userRegister:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiUserRegister];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    //    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseUserRegister:YES responseObject:responseObject error:nil
                                    completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseUserRegister:NO responseObject:nil error:error
                                    completion:block];
        
    }];
}

+ (void)getAttentionListWithPage:(NSInteger)page pagesize:(NSInteger)pagesize type:(NSInteger)type Completion:(void (^)(BOOL success, NSDictionary *data, NSString *message))block{
    NSString *URL = [NSString stringWithFormat:@"%@%@",imDev_Url, GetAttentionList];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    
    [parDic setValue:@(page) forKey:@"page"];
    [parDic setValue:@(pagesize) forKey:@"pagesize"];
    [parDic setValue:@(type) forKey:@"type"];
    
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    NSString *tempStr = [URL stringByAppendingString:@"?"];
    for (NSString *key in parDic.allKeys) {
        tempStr = [tempStr stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",key,[parDic objectForKey:key]]];
    }
    NSLog(@"fullUrl = %@",tempStr);
    
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseResponseObjectJsonlyWithJson:responseObject error:nil completion:block];
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseResponseObjectJsonlyWithJson:nil error:error completion:block];
    }];
}
+ (void)getStartPageWithParams:(NSDictionary *)parmas completion:(void (^)(BOOL, NSDictionary *, NSString *))block{
    
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiGetStartPage];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionaryWithDictionary:parmas];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    [parDic setValue:@(2) forKey:@"term_type"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseStartPage:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseStartPage:NO responseObject:nil error:error completion:block];
        
    }];
    
}
+ (void)submitAppraisal:(NSString *)answer type_id:(NSString *)type_id completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, DDappraisalPostAnswer];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    
    [parDic setValue:answer forKey:@"answer"];
    [parDic setValue:type_id forKey:@"type_id"];
    
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseSubmitAppraisal:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseSubmitAppraisal:NO responseObject:nil error:error completion:block];
        
    }];
}
+(void)getAppraisalDetailWithType_id:(NSString *)type_id completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, DDapiGetAppraisalDetail];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setValue:@"1" forKey:@"type"];
    [parDic setValue:type_id forKey:@"type_id"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseAppraisalDetail:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseAppraisalDetail:NO responseObject:nil error:error completion:block];
        
    }];
    
}

+(void)saveExpert:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiExpertSaveExpert];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id forKey:@"school_id"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseSaveExpert:YES responseObject:responseObject error:nil
                                  completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseSaveExpert:NO responseObject:nil error:error
                                  completion:block];
        
    }];
}

+(void)addExpert:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiExpertAddExpert];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id forKey:@"school_id"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseSaveExpert:YES responseObject:responseObject error:nil
                                  completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseSaveExpert:NO responseObject:nil error:error
                                  completion:block];
        
    }];
}

+(void)resetPasswordV2:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiUserResetPasswordV2];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setDictionary:dic];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseResetPasswordV2:YES responseObject:responseObject error:nil
                                       completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseResetPasswordV2:NO responseObject:nil error:error
                                       completion:block];
        
    }];
}

+(void)updateUserImInfo:(void (^)(BOOL success, NSDictionary *data, NSString *message))block{
    NSString *URL = [NSString stringWithFormat:@"%@%@",imDev_Url, apiUpdateUser];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].experts_name?:@"" forKey:@"nickname"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype?:@0 forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id?:@"0" forKey:@"school_id"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].experts_name?:@"" forKey:@"name"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].pic_url?:@"" forKey:@"icon"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    NSString *sign = [self backSign:nil andDic:parDic];
    [parDic setValue:sign forKey:@"sign"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseResetPasswordV2:YES responseObject:responseObject error:nil
                                       completion:block];
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseResetPasswordV2:NO responseObject:nil error:error
                                       completion:block];
    }];
}

+(void)checkExpert:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiExpertCheckExpert];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseCheckExpert:YES responseObject:responseObject error:nil
                                   completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseCheckExpert:NO responseObject:nil error:error
                                   completion:block];
        
    }];
}

+(void)getQiNiuTokenCompletion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiQiniuGetToken];
    
    NSMutableDictionary *parDic = [NSMutableDictionary dictionaryWithDictionary:@{@"type":@"image"}];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].utype forKey:@"ustype"];
    [parDic setValue:@1 forKey:@"is_key"];
    [parDic setValue:[UserInfoModel sharedUserInfoModel].school_id forKey:@"school_id"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        [DDJYRequesterParser parseQiNiu:YES responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        
        [DDJYRequesterParser parseQiNiu:NO responseObject:nil error:error completion:block];
        
    }];
}

+(void)uploadPictures:(NSArray *)pictures uuid:(NSString *)uuid qiNiuToken:(NSString *)qiNiuToken progress:(void (^)(NSProgress *))progress complete:(void (^)(BOOL , NSDictionary *,NSString * ))block {
    
    NSString *URL = [NSString stringWithFormat:@"%@", @"http://upload-z2.qiniup.com"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    for (UIImage *picture in pictures) {
        
        /*
         图片处理
         
         */
        [manager POST:URL parameters:@{@"token":qiNiuToken} constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
            NSString *time = [self backTimeinterval];
            [formData appendPartWithFileData:UIImageJPEGRepresentation(picture, 0.4) name:@"file" fileName:[NSString stringWithFormat:@"%@.png",time] mimeType:@"application/octet-stream"];
            
        } progress:progress
              success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                  [DDJYRequesterParser parseUploadQiNiu:YES responseObject:responseObject error:nil completion:block];
              }
              failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                  [DDJYRequesterParser parseUploadQiNiu:NO responseObject:nil error:error completion:block];
              }];
    }
    
}



+(NSString *)getTestInfoUrl:(NSDictionary *)dic
{
    NSString *wurl = @"/evaluate2/api/Question/getInfoV2";
    NSString *time = [self backTimeinterval] ;
    NSString *token = [UserInfoModel sharedUserInfoModel].token;
    NSString *type_id = [NSString stringWithFormat:@"%ld",[dic[@"type_id"] integerValue]];
    NSString *type = [NSString stringWithFormat:@"%ld",[dic[@"type"] integerValue]];
    NSMutableDictionary *md = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    NSString *sign = [self backSign:@"" andDic:dic];
    md[@"sign"] = sign;
    NSString *url = [NSString stringWithFormat:@"%@%@?sign=%@&time=%@&token=%@&type_id=%@&type=%@",imDev_Url,wurl,sign,time,token,type_id,type];
    //   @"http://api.dadaodata.com/evaluate2/api/Question/getInfoV2?sign=d321e293b71e68c615e7c555e739b88d&time=1533864001890&token=44b74437204711bbde23cf087da388a42bc31f0f5b6c1b48004eb&type_id=0&type=1"
    return url;
}


+(NSDictionary *)getDic:(NSString *)p
{
    NSArray *a = [p componentsSeparatedByString:@"&"];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [a enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *s = obj;
        NSArray *b = [s componentsSeparatedByString:@"="];
        
        dic[b[0]] = b[1];
    }];
    return dic;
}


+(NSString *)getGroupUpUrl:(NSDictionary *)dic
{
    NSString *wurl = dic[@"weex"];
    NSString *fromim = dic[@"fromim"];
    NSString *school_term_name = dic[@"school_term_name"];
    NSString *token = [UserInfoModel sharedUserInfoModel].token;
    NSString *up_down_flag = [NSString stringWithFormat:@"%ld",[dic[@"up_down_flag"] integerValue]];
    NSString *user_id = dic[@"user_id"];//[NSString stringWithFormat:@"%ld",[[UserInfoModel sharedUserInfoModel].user_id integerValue]];
    NSString *time = [self backTimeinterval];
    NSString *url = [NSString stringWithFormat:@"%@%@?fromim=%@&school_term_name=%@&token=%@&up_down_flag=%@&user_id=%@&time=%@",weexDev_Url,wurl,fromim,school_term_name,token,up_down_flag,user_id,time];
    //    url = [url string ByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "]];
    return url;
}
+(NSString *)getTestResultUrl:(NSDictionary *)dic
{
    NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:dic];
    NSString *wurl = dic[@"url"];
    NSString *fromim = dic[@"fromim"];
    NSString *token = [UserInfoModel sharedUserInfoModel].token;
    mdic[@"token"] = token;
    NSString *result_id = dic[@"result_id"];//[NSString stringWithFormat:@"%ld",[[UserInfoModel sharedUserInfoModel].user_id integerValue]];
    NSString *time = [self backTimeinterval];
    NSString *show_type = dic[@"show_type"];
    mdic[@"time"] = time;
    mdic[@"url"] = nil;
    NSString *sign = [self backSign:nil andDic:mdic];
    NSString *url = [NSString stringWithFormat:@"%@%@?fromim=%@&result_id=%@&token=%@&time=%@&show_type=%@&sign=%@",imDev_Url,wurl,fromim,result_id,token,time,show_type,sign];
    //    url = [url string ByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "]];
    return url;
}

+(void)addConsultation:(NSString *)stuAccid teaAccid:(NSString *)teaAccid completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block
{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiConsultationddConsultation];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    
    parDic[@"student_id"] = stuAccid;
    [parDic setValue:[UserInfoModel sharedUserInfoModel].token forKey:@"token"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"expert_id"] = teaAccid;
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager POST:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseAddConsultation:YES responseObject:responseObject error:nil
                                       completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseAddConsultation:NO responseObject:nil error:error
                                       completion:block];
        
    }];
}

+(NSString *)getUrlForActivity:(NSDictionary *)dic
{
    NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:dic];
    NSString *wurl = dic[@"weex"];
    NSInteger activity_detail_id = [dic[@"activity_detail_id"] integerValue];
    NSInteger activity_id = [dic[@"activity_id"] integerValue];
    NSString *fromim = dic[@"fromim"];
    NSInteger fee = [dic[@"fee"] integerValue];
    NSString *region = dic[@"region"];
    NSString *token = [UserInfoModel sharedUserInfoModel].token;
    NSString *time = [self backTimeinterval];
    mdic[@"token"] = token;
    mdic[@"time"] = time;
    mdic[@"weex"] = nil;
    NSString *sign = [DDJYRequest backSign:nil andDic:dic];
    NSInteger type = [dic[@"type"] integerValue];
    NSNumber *order_id = dic[@"order_id"];
    NSString *url = [NSString stringWithFormat:@"%@%@?activity_detail_id=%ld&activity_id=%ld&fee=%ld&fromim=%@&region=%@&sign=%@&time=%@&token=%@&type=%ld&order_id=%@",weexDev_Url,wurl,activity_detail_id,activity_id,fee,fromim,region,sign,time,token,type,order_id];
    return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

#pragma mark 获取IMToken
+ (void)getIMToken:(NSString *)token completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url, apiTokenWithIM];
    NSLog(@"请求地址:%@",URL);
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setValue:token forKey:@"token"];
    [parDic setValue:@"0" forKey:@"school_id"];
    [parDic setValue:UserInfoModel.sharedUserInfoModel.utype forKey:@"ustype"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager GET:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseGetIMToken:YES responseObject:responseObject error:nil
                                  completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseGetIMToken:NO responseObject:nil error:error
                                  completion:block];
    }];
}

+(void)pushLoginOutWithBlock:(void (^)(BOOL, NSDictionary *, NSString *))block{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url,PushLoginOut];
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    NSString *token = [UserInfoModel sharedUserInfoModel].token;
    [parDic setObject:token forKey:@"token"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    [manager POST:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseDefaultDataWithSuccess:true responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseDefaultDataWithSuccess:false responseObject:nil error:error completion:block];
        
    }];

}

+(void)registerDeviceTokenWithToken:(NSString *)token registrationID:(NSString *)registrationID block:(void (^)(BOOL, NSDictionary *, NSString *))block{
    NSString *URL = [NSString stringWithFormat:@"%@%@", imDev_Url,RegisterDeviceToken];
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    [parDic setValue:@"2" forKey:@"platform"];
    [parDic setValue:registrationID forKey:@"reg_id"];
    
    [parDic setValue:UIDevice.currentDevice.deviceModelName forKey:@"model_name"];
    [parDic setValue:[self backTimeinterval] forKey:@"time"];
    parDic[@"sign"] = [self backSign:@"" andDic:parDic];
    
    NSString *deviceToken = [UserInfoModel sharedUserInfoModel].token;
    [parDic setObject:deviceToken forKey:@"token"];
    
    AFHTTPSessionManager *manager = [self manager];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    
    NSString *tempStr = [URL stringByAppendingString:@"?"];
    for (NSString *key in parDic.allKeys) {
        tempStr = [tempStr stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",key,[parDic objectForKey:key]]];
    }
    DLog(@"fullUrl = %@",tempStr);
    [manager POST:URL parameters:parDic progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [DDJYRequesterParser parseDefaultDataWithSuccess:true responseObject:responseObject error:nil completion:block];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [DDJYRequesterParser parseDefaultDataWithSuccess:false responseObject:nil error:error completion:block];
        
    }];
}

static AFHTTPSessionManager *afmanager;
+ (AFHTTPSessionManager *)manager {
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];
    //    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    //
    //    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[NSSet setWithObject:cerData]];
    //    [manager setSecurityPolicy:policy];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        afmanager = [AFHTTPSessionManager manager];
        afmanager.requestSerializer.timeoutInterval = 10.0;
        
    });
    
 
    [afmanager.requestSerializer setTimeoutInterval:30];
    [afmanager.securityPolicy setAllowInvalidCertificates:YES];
    [afmanager.securityPolicy setValidatesDomainName:NO];
    [afmanager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    return afmanager;
}

//获取时间戳
+(NSString *)backTimeinterval{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] * 1000;
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)interval];
    return timeStr;
}

//签名
+(NSString *)backSign:(NSString *)url andDic:(NSDictionary *)dataDic{
    NSString *md5Str = @"";
    NSArray *ary = [dataDic.allKeys sortedArrayUsingSelector:@selector(compare:)];
    for (int i=0; i<ary.count; i++) {
        md5Str = [md5Str stringByAppendingString:[NSString stringWithFormat:@"%@",ary[i]]];
        md5Str = [md5Str stringByAppendingString:@"="];
        md5Str = [md5Str stringByAppendingString:[NSString stringWithFormat:@"%@",[dataDic valueForKey:ary[i]]]];
        if (i<(ary.count-1)) {
            md5Str = [md5Str stringByAppendingString:@"&"];
        }
    }
    md5Str = [md5Str stringByAppendingString:encryptionKey];
    return [md5Str stringToMD5:md5Str];
}
@end
