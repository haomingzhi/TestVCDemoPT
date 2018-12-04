//
//  DDJYRequesterParser.m
//  DDZX_js
//
//  Created by apple on 2018/8/8.
//  Copyright © 2018年 wjy. All rights reserved.
//

#import "DDJYRequesterParser.h"
#import "UserInfoModel.h"
#import "DDTeacherViewModel.h"

#import <JYLibrary/JYLibrary.h>
@implementation DDJYRequesterParser

+ (id)parseData:(BOOL)responseSuccess responseObject:(id)responseObject error:(NSError *)error dataClass:(Class)dataClass success:(BOOL *)success message:(NSString **)message sessionExpired:(BOOL *)sessionExpired content:(NSString *)content {
    if (sessionExpired) {
        *sessionExpired = NO;
    }
    
    if (!responseSuccess) {
        *success = NO;
        *message = @"请检查网络";
        
        //RJSportErrorLog(@"%@请求响应失败，错误信息: %@", content, error.localizedDescription);
        
        return nil;
    }
    
    //RJSportDebugLog(@"请求响应成功");
    
    if ([XTool isObjectNull:responseObject]) {
        *success = NO;
        if (error) {
            if(error.code == -1009||error.code == -1001)
            {
                *message = @"网络无连接，似乎断网了...";
                return nil;
            }
        }
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@响应数据为空", content);
        return nil;
    }
    
    if (![responseObject isKindOfClass:[NSData class]]) {
        *success = NO;
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@响应数据类型不是NSData，类型为: %@", content, NSStringFromClass([responseObject class]));
        return nil;
    }
    
    NSError *jsonError = nil;
    id jsonResult = [XJsonParser parseJsonWithData:responseObject error:&jsonError];
    
    if ([XTool isObjectNull:jsonResult] || ![XTool isObjectNull:jsonError]) {
        *success = NO;
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@返回数据json解析失败, 失败原因: %@", content, jsonError.localizedDescription);
        return nil;
    }
    
    if (![jsonResult isKindOfClass:[NSDictionary class]]) {
        *success = NO;
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@返回数据解析出的类型不是NSDictionary, 解析出的类型: %@", content, NSStringFromClass([jsonResult class]));
        return nil;
    }
    
    NSDictionary *jsonResultDict = (NSDictionary *)jsonResult;
    
    NSInteger code = [[jsonResultDict objectForKey:@"code"] integerValue];
    NSString *msg = [jsonResultDict objectForKey:@"msg"];
    *message = msg;
    if (code == -99999 || code == -99998) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"tiren" object:nil];
         return nil;
    }
    if (code == -101) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GoEditPersonVCTip" object:nil];
        return nil;
    }
    if (code == 10) {
        *success = NO;
        if (sessionExpired) {
            *sessionExpired = YES;
        }
        
        //RJSportErrorLog(@"%@会话过期，错误信息: %@", content, msg);
        
        return nil;
    }
    if(code == -20010)
    {
       *success = NO;
         *message = @"请输入正确的验证码";
         return nil;
    }
    if (code != 1) {
        *success = NO;
       
        //RJSportErrorLog(@"%@返回数据中code为%d，表示失败，错误信息: %@", content, (int)code, msg);
        
        return nil;
    }
    
    *success = YES;
    
    id data = [jsonResultDict objectForKey:@"data"];
    
    if ([XTool isObjectNull:data]) {
        // RJSportDebugLog(@"%@返回数据中data为空，msg信息: %@", content, msg);
        
        return nil;
    }
    if ([XTool isClassNull:dataClass]) {
        //RJSportDebugLog(@"%@返回数据中data不为空，但开发者未赋予其类型，msg信息: %@", content, msg);
        
        return nil;
    }
    //    if (![data isKindOfClass:dataClass]) {
    //        //RJSportErrorLogAndUpload(@"%@返回数据中data类型非%@, data类型: %@", content, NSStringFromClass(dataClass), NSStringFromClass([data class]));
    //
    //        return nil;
    //    }
    
    
    // RJSportDebugLog(@"%@数据解析成功，data: %@, msg: %@", content, data, msg);
    
    return data;
}

+ (id)parseLoginData:(BOOL)responseSuccess responseObject:(id)responseObject error:(NSError *)error dataClass:(Class)dataClass success:(BOOL *)success code:(NSInteger *)code message:(NSString **)message sessionExpired:(BOOL *)sessionExpired content:(NSString *)content {
    if (sessionExpired) {
        *sessionExpired = NO;
    }
    
    if (!responseSuccess) {
        *success = NO;
        *message = @"请检查网络";
        
        //RJSportErrorLog(@"%@请求响应失败，错误信息: %@", content, error.localizedDescription);
        
        return nil;
    }
    
    //RJSportDebugLog(@"请求响应成功");
    
    if ([XTool isObjectNull:responseObject]) {
        *success = NO;
        if (error) {
            if(error.code == -1009||error.code == -1001)
            {
                *message = @"网络无连接，似乎断网了...";
                return nil;
            }
        }
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@响应数据为空", content);
        return nil;
    }
    
    if (![responseObject isKindOfClass:[NSData class]]) {
        *success = NO;
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@响应数据类型不是NSData，类型为: %@", content, NSStringFromClass([responseObject class]));
        return nil;
    }
    
    NSError *jsonError = nil;
    id jsonResult = [XJsonParser parseJsonWithData:responseObject error:&jsonError];
    
    if ([XTool isObjectNull:jsonResult] || ![XTool isObjectNull:jsonError]) {
        *success = NO;
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@返回数据json解析失败, 失败原因: %@", content, jsonError.localizedDescription);
        return nil;
    }
    
    if (![jsonResult isKindOfClass:[NSDictionary class]]) {
        *success = NO;
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@返回数据解析出的类型不是NSDictionary, 解析出的类型: %@", content, NSStringFromClass([jsonResult class]));
        return nil;
    }
    
    NSDictionary *jsonResultDict = (NSDictionary *)jsonResult;
    
     *code = [[jsonResultDict objectForKey:@"code"] integerValue];
    NSString *msg = [jsonResultDict objectForKey:@"msg"];
    *message = msg;
    if (*code == -99999 || code == -99998) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"tiren" object:nil];
        return nil;
    }
    if (*code == -101) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GoEditPersonVCTip" object:nil];
        return nil;
    }
    if (*code == 10) {
        *success = NO;
        if (sessionExpired) {
            *sessionExpired = YES;
        }
        
        //RJSportErrorLog(@"%@会话过期，错误信息: %@", content, msg);
        
        return nil;
    }
    if(*code == -20010)
    {
        *success = NO;
        *message = @"请输入正确的验证码";
        return nil;
    }
    if (*code != 1) {
        *success = NO;
        
        //RJSportErrorLog(@"%@返回数据中code为%d，表示失败，错误信息: %@", content, (int)code, msg);
        
        return nil;
    }
    
    *success = YES;
    
    id data = [jsonResultDict objectForKey:@"data"];
    
    if ([XTool isObjectNull:data]) {
        // RJSportDebugLog(@"%@返回数据中data为空，msg信息: %@", content, msg);
        
        return nil;
    }
    if ([XTool isClassNull:dataClass]) {
        //RJSportDebugLog(@"%@返回数据中data不为空，但开发者未赋予其类型，msg信息: %@", content, msg);
        
        return nil;
    }
    //    if (![data isKindOfClass:dataClass]) {
    //        //RJSportErrorLogAndUpload(@"%@返回数据中data类型非%@, data类型: %@", content, NSStringFromClass(dataClass), NSStringFromClass([data class]));
    //
    //        return nil;
    //    }
    
    
    // RJSportDebugLog(@"%@数据解析成功，data: %@, msg: %@", content, data, msg);
    
    return data;
}

+(void)parseCity:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL,NSArray *, NSString *))block {
    
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSArray *CitysResult = [self parseData:success responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:NULL content:@"城市列表"];
    
    if (!resultSuccess || [XTool isArrayEmpty:CitysResult]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES, CitysResult, message);
}

+(void)parseSchool:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSArray *, NSString *))block {
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSArray *schoolResult = [self parseData:success responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:NULL content:@"学校列表"];
    
    if (!resultSuccess || [XTool isArrayEmpty:schoolResult]) {
        block(NO, nil, message);
        return;
    }
    
    if (![XTool isObjectNull:schoolResult] && ![schoolResult isKindOfClass:[NSArray class]]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES, schoolResult, message);
    
}

+(void)parseGetExperList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:nil dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"导师列表"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
//    NSMutableArray *dda = [NSMutableArray new];
//    [result[@"list"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSDictionary *d = obj;
//        DDTeacherViewModel *m = [DDTeacherViewModel new];
//        m.img = d[@"pic_url"];
//        m.name = d[@"username"];
//        m.content = d[@"experts_name"];
//        m.accid = d[@"accid"];
//        m.field = d[@"field"];
//        [m setValuesForKeysWithDictionary:d];
//        [dda addObject:m];
//    }];
    //    DDTeacherViewModel *m = [DDTeacherViewModel new];
    //    [dda addObject:m];
    block(YES,@{@"arr":result[@"list"],@"page_num":result[@"page_num"]},message);
}
+(void)parseArticleListV2:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:nil dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"导师列表"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }

    block(YES,@{@"arr":result[@"list"],@"page_num":result[@"page_num"]},message);
}
+(void)parseExpertAnswerListData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"个人问答列表"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}
+(void)parseUserInfoData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"用户信息"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}

+(void)parseGetColumnMerger:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"擅长领域"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}
+(void)parseAnswerListData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"默认问答列表"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}

+(void)parseTestAnswerListData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"测评量表"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}

+(void)parseTestListData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSArray  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:nil content:@"测评量表"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}

+(void)parseAnswerInfo:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"常见问答详情"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}

+(void)parseSaveExpertAnswer:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"修改问答"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}
+(void)parseAddExpertAnswer:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"添加问答"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}

+(void)parseDeleteExpertAnswer:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"删除问答"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}

+(void)parseAnswerExpertInfo:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"专家问答详情"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}


+(void)parseAddEvaluate:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"添加评论"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    block(YES,result,message);
}

+(void)parseGetIMToken:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *loginResult =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"GETIMToken"];
    
    if (!resultSuccess || [XTool isObjectNull:loginResult]) {
        block(NO, nil, message);
        return;
    }
    block(YES,loginResult,message);
}

+(void)parseData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *loginResult =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"GETIMToken"];
    
    if (!resultSuccess || [XTool isObjectNull:loginResult]) {
        block(NO, nil, message);
        return;
    }
    block(YES,loginResult,message);
}

+(void)parseLogin:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSInteger code = 0;
    NSDictionary  *result =  [DDJYRequesterParser parseLoginData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess code:&code message:&message sessionExpired:nil content:@"登录"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    UserInfoModel *info = [UserInfoModel sharedUserInfoModel];
    info.token = result[@"token"];
     info.user_id = result[@"user_id"];
    [info setValuesForKeysWithDictionary:result];
    if (![XTool isStringEmpty:info.phone_tel] && ![XTool isStringEmpty:info.user_name]) {
        UserDefaultSetBOOLForKey(YES, @"isAutoLogin");
    }else {
        UserDefaultSetBOOLForKey(NO, @"isAutoLogin");
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:result];
    dic[@"code"] = @(code);
    block(YES,dic,message);
}

+(void)parseAppraisalDetail:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSDictionary *result = [self parseData:success responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:NULL content:@"测评详情"];
    
    if (!resultSuccess || [XTool isDictionaryEmpty:result]) {
        block(NO , nil, message);
        return;
    }
    block(YES, result, message);
}

#pragma mark - **************** 关注相关

+ (void)parseResponseObjectJsonlyWithJson:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *data,NSString *message))block{
    
    BOOL success = NO;
    NSString *message = nil;
    
    if (error) {
        success = NO;
        message = @"请检查网络";
        block(false, nil, message);
        return;
    }
    if ([XTool isObjectNull:responseObject]) {
        success = NO;
        if (error) {
            if(error.code == -1009||error.code == -1001)
            {
                message = @"网络无连接，似乎断网了...";
                block(false, nil, message);
                return ;
            }
        }
        message = @"出错啦！";
        block(false, nil, message);
        //RJSportErrorLogAndUpload(@"%@响应数据为空", content);
        return ;
    }
    if (!responseObject || [responseObject isKindOfClass:[NSNull class]]) {
        success = NO;
        message = @"出错啦！";
        block(false, nil, message);
        return;
    }
    
    if (![responseObject isKindOfClass:[NSData class]]) {
        success = NO;
        message = @"出错啦！";
        block(false, nil, message);
        return;
    }
    
    NSError *jsonError = nil;
    id jsonResult = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&jsonError];
    
    if (!jsonResult || [jsonResult isKindOfClass:[NSNull class]]) {
        success = NO;
        message = @"出错啦！";
        block(false, nil, message);
        return;
    }
    
    NSDictionary *jsonResultDict = (NSDictionary *)jsonResult;
    if (![jsonResultDict isKindOfClass:[NSDictionary class]]) {
        success = NO;
        message = @"格式出错啦！ 不是dic";
        block(false, nil, message);
        return;
    }
    NSInteger code = [[jsonResultDict objectForKey:@"code"] integerValue];
    NSString *msg = [jsonResultDict objectForKey:@"msg"];
    message = msg;
    
    if (code == 10) {
        success = NO;
    }
    if (code != 1) {
        success = NO;
        msg = [NSString stringWithFormat:@"code error code=%ld msg=%@",code,msg];
        block(false, nil, message);
        return;
    }
    
    success = YES;
    if (block) {
        block(success,jsonResultDict,msg);
    }
    
}


+(void)parseStartPage:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSDictionary *startPageResult = [self parseData:success responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:NULL content:@"启动页"];
    
    if (!resultSuccess || [XTool isObjectNull:startPageResult]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES, startPageResult, message);
}


+(void)parseSubmitAppraisal:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSDictionary *result = [self parseData:success responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:NULL content:@"提交测评"];
    
    if (!resultSuccess || [XTool isDictionaryEmpty:result]) {
        block(NO , nil, message);
        return;
    }
    block(YES, result, message);
}

+ (void)parseAppraisalReportList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSDictionary *result = [self parseData:success responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:NULL content:@"测评历史列表"];
    
    if (!resultSuccess || [XTool isDictionaryEmpty:result]) {
        block(NO , nil, message);
        return;
    }
    block(YES, result, message);
}
+(void)parseAppraisalList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSArray  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:nil content:@"轮播图"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+(void)parseGetBroadcast:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSArray  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:nil content:@"轮播图"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,@{@"arr":result?:@[]},message);
}

+(void)parseCheckExpert:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"获取专家"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}


+(void)parseAppraisalTypeList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSArray  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:nil content:@"获取专家"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+ (void)parseAddConsultation:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSArray *, NSString *))block {
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSDictionary *result = [self parseXData:success responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:NULL content:@"添加咨询"];
    
    if (!resultSuccess || [XTool isDictionaryEmpty:result]) {
        block(NO , nil, message);
        return;
    }
    block(YES, @[result?:@{}], message);
}

+ (void)parseQiNiu:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSDictionary *result = [self parseXData:success responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:NULL content:@"七牛云token"];
    
    if (!resultSuccess || [XTool isDictionaryEmpty:result]) {
        block(NO , nil, message);
        return;
    }
    block(YES, result, message);
}

+ (void)parseUploadQiNiu:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
    BOOL resultSuccess = NO;
    NSString *message = nil;
    NSDictionary *result = [self parseXData:success responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:NULL content:@"上传七牛云"];
    
    if (!resultSuccess || [XTool isDictionaryEmpty:result]) {
        block(NO , nil, message);
        return;
    }
    block(YES, result, message);
}

//+(void)parseUploadPictures:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block {
//
//    BOOL resultSuccess = NO;
//    NSString *message = nil;
//    NSDictionary *result = [self parseData:success responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:NULL content:@"上传图片"];
//
//    if (!resultSuccess || [XTool isDictionaryEmpty:result]) {
//        block(NO , nil, message);
//        return;
//    }
//    block(YES, result, message);
//}

+(void)parseSaveExpert:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"修改资料"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+(void)parseUserRegister:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"注册"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+(void)parseSendCode:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"发送验证码"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+(void)parseResetPasswordV2:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"忘记密码"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+(void)parseGetSchoolListV2:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"学校列表"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,@{@"arr":result?:@[]},message);
}

+(void)parseActivityDetailList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"活动列表"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}


+(void)parseSaveMobile:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"修改手机"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}
+(void)parseResetPasswordByTel:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"修改密码"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}


+(void)parseExpertSign:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"我的签到"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}


+(void)parseGetCareerVideoList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSArray  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:nil content:@"生涯课堂"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,@{@"arr":result?:@[]},message);
}
+(void)parseExpertPushList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"消息通知"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+(void)parseGetArticleOrderList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"我的活动"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+(void)parseGetQuestionTermType:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSArray  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:nil content:@"反馈类型"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,@{@"arr":result?:@[]},message);
}

+(void)parseCollectManageGetList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSArray  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSArray class] success:&resultSuccess message:&message sessionExpired:nil content:@"我的收藏"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,@{@"arr":result},message);
}
+(void)parseTutorFeedback:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:@"问题反馈"];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}

+ (id)parseXData:(BOOL)responseSuccess responseObject:(id)responseObject error:(NSError *)error dataClass:(Class)dataClass success:(BOOL *)success message:(NSString **)message sessionExpired:(BOOL *)sessionExpired content:(NSString *)content {
    if (sessionExpired) {
        *sessionExpired = NO;
    }
    
    if (!responseSuccess) {
        *success = NO;
        *message = @"请检查网络";
        
        //RJSportErrorLog(@"%@请求响应失败，错误信息: %@", content, error.localizedDescription);
        
        return nil;
    }
    
    //RJSportDebugLog(@"请求响应成功");
    
    if ([XTool isObjectNull:responseObject]) {
        *success = NO;
        if (error) {
            if(error.code == -1009||error.code == -1001)
            {
                *message = @"网络无连接，似乎断网了...";
                return nil;
            }
        }
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@响应数据为空", content);
        return nil;
    }
    
    if (![responseObject isKindOfClass:[NSData class]]) {
        *success = NO;
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@响应数据类型不是NSData，类型为: %@", content, NSStringFromClass([responseObject class]));
        return nil;
    }
    
    NSError *jsonError = nil;
    id jsonResult = [XJsonParser parseJsonWithData:responseObject error:&jsonError];
    
    if ([XTool isObjectNull:responseObject]) {
        *success = NO;
        if (error) {
            if(error.code == -1009||error.code == -1001)
            {
                *message = @"网络无连接，似乎断网了...";
                return nil;
            }
        }
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@响应数据为空", content);
        return nil;
    }
    
    if (![jsonResult isKindOfClass:[NSDictionary class]]) {
        *success = NO;
        *message = @"出错啦！";
        
        //RJSportErrorLogAndUpload(@"%@返回数据解析出的类型不是NSDictionary, 解析出的类型: %@", content, NSStringFromClass([jsonResult class]));
        return nil;
    }
    
    NSDictionary *jsonResultDict = (NSDictionary *)jsonResult;
    
    //    NSInteger code = [[jsonResultDict objectForKey:@"code"] integerValue];
    //    NSString *msg = [jsonResultDict objectForKey:@"msg"];
    //    *message = msg;
    //
    //    if (code == 10) {
    //        *success = NO;
    //        if (sessionExpired) {
    //            *sessionExpired = YES;
    //        }
    //
    //        //RJSportErrorLog(@"%@会话过期，错误信息: %@", content, msg);
    //
    //        return nil;
    //    }
    //    if (code != 1) {
    //        *success = NO;
    //
    //        //RJSportErrorLog(@"%@返回数据中code为%d，表示失败，错误信息: %@", content, (int)code, msg);
    //
    //        return nil;
    //    }
    
    *success = YES;
    
    //    id data = [jsonResultDict objectForKey:@"data"];
    //
    //    if ([XTool isObjectNull:data]) {
    //        // RJSportDebugLog(@"%@返回数据中data为空，msg信息: %@", content, msg);
    //
    //        return nil;
    //    }
    //    if ([XTool isClassNull:dataClass]) {
    //        //RJSportDebugLog(@"%@返回数据中data不为空，但开发者未赋予其类型，msg信息: %@", content, msg);
    //
    //        return nil;
    //    }
    //    if (![data isKindOfClass:dataClass]) {
    //        //RJSportErrorLogAndUpload(@"%@返回数据中data类型非%@, data类型: %@", content, NSStringFromClass(dataClass), NSStringFromClass([data class]));
    //
    //        return nil;
    //    }
    
    // RJSportDebugLog(@"%@数据解析成功，data: %@, msg: %@", content, data, msg);
    
    return jsonResultDict;
}

+(void)parseDefaultDataWithSuccess:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block
{
    NSString *message = nil;
    BOOL resultSuccess = NO;
    NSDictionary  *result =  [DDJYRequesterParser parseData:YES responseObject:responseObject error:error dataClass:[NSDictionary class] success:&resultSuccess message:&message sessionExpired:nil content:nil];
    
    if (!resultSuccess || [XTool isObjectNull:result]) {
        block(NO, nil, message);
        return;
    }
    
    block(YES,result,message);
}
@end
