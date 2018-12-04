//
//  DDJYRequesterParser.h
//  DDZX_js
//
//  Created by apple on 2018/8/8.
//  Copyright © 2018年 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDJYRequesterParser : NSObject
+(NSString *)parseGetGroupUpUrl:(NSDictionary *)dic;

+(void)parseArticleListV2:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)parseSchool:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSArray *, NSString *))block;

+(void)parseCity:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL,NSArray *, NSString *))block;
+(void)parseUserInfoData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)parseLogin:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)parseGetIMToken:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(void)parseTestListData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block;

+(void)parseTestAnswerListData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)parseAnswerListData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)parseExpertAnswerListData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)parseGetExperList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)parseAnswerInfo:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block;

+(void)parseAddEvaluate:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block;

+(void)parseAnswerExpertInfo:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block;

+(void)parseDeleteExpertAnswer:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block;

+(void)parseAddExpertAnswer:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block;

+(void)parseSaveExpertAnswer:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success,  NSDictionary * dic, NSString *msg))block;
+(void)parseGetBroadcast:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)parseActivityDetailList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)parseResetPasswordV2:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;
+(void)parseUploadPictures:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block;
+ (void)parseQiNiu:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(void)parseCheckExpert:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseUserRegister:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;
+ (void)parseUploadQiNiu:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(void)parseTutorFeedback:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseGetQuestionTermType:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseSendCode:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;
+(void)parseResetPasswordByTel:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseSaveMobile:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseCollectManageGetList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseGetArticleOrderList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseExpertSign:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseExpertPushList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseGetCareerVideoList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseGetSchoolListV2:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseSaveExpert:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;
+(void)parseGetColumnMerger:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
+(void)parseAppraisalTypeList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block;
+(void)parseAppraisalList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block;
+ (void)parseAppraisalReportList:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(void)parseAppraisalDetail:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block ;
+(void)parseSubmitAppraisal:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+ (void)parseResponseObjectJsonlyWithJson:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *data,NSString *message))block;
+(void)parseStartPage:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block ;
+ (void)parseAddConsultation:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSArray *, NSString *))block;
+(void)parseData:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL, NSDictionary *, NSString *))block;
+(void)parseDefaultDataWithSuccess:(BOOL)success responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
@end
