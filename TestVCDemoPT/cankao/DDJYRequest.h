//
//  DDJYRequest.h
//  DDZX_js
//
//  Created by apple on 2018/8/8.
//  Copyright © 2018年 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDJYRequest : NSObject
+ (void)getCityListWithParams:(NSDictionary *)parmas completion:(void (^)(BOOL, NSArray *, NSString *))block;

+ (void)getSchoolListWithParams:(NSDictionary *)parmas completion:(void (^)(BOOL, NSArray *, NSString *))block;

+(void)login:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)loginExpert:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+ (void)getIMToken:(NSString *)token completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(NSString *)getGroupUpUrl:(NSDictionary *)dic;

+(NSString *)getTestInfoUrl:(NSDictionary *)dic;

+(NSString *)getUrlForActivity:(NSDictionary *)dic;

+(void)articleInfo:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)getOrderDetail:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)participateActivityDetail:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)addorder:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)supplementOrder:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)getBroadcast:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)checkExpert:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)getActivityDetailList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)getUserInfo:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)getTestListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block;

+(void)getTestAnswerListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)getAnswerListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)getExpertAnswerListData:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;

+(void)getExpertListData:(NSDictionary *)dic completion:(void (^)(BOOL success,NSDictionary *dic, NSString *msg))block;

+(void)addExpertAnswer:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)saveExpertAnswer:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)deleteExpertAnswer:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)addEvaluate:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)addConsultation:(NSDictionary *)dic completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block;

+(void)answerInfo:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)answerExpertInfo:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//忘记密码
+(void)resetPasswordV2:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//注册
+(void)userRegister:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//问题反馈
+(void)tutorFeedback:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//反馈类型
+(void)getQuestionTermType:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//验证码
+(void)sendCode:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;


//修改密码
+(void)resetPasswordByTel:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//修改手机
+(void)saveMobile:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//我的收藏
+(void)collectManageGetList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//我的活动
+(void)getArticleOrderList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//我的签到
+(void)expertSign:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//生涯课堂
+(void)getCareerVideoList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//消息通知
+(void)getExpertPushList:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

//学校列表
+(void)getSchoolListV2:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)getColumnMerger:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
//修改个人资料
+(void)saveExpert:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;
//添加个人资料
+(void)addExpert:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;

+(void)getQiNiuTokenCompletion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(void)updateUserImInfo:(void (^)(BOOL success, NSDictionary *data, NSString *message))block;

+(void)uploadPictures:(NSArray *)pictures uuid:(NSString *)uuid qiNiuToken:(NSString *)qiNiuToken progress:(void (^)(NSProgress *))progress complete:(void (^)(BOOL , NSDictionary *, NSString *))block;
/**获取测评类型

*/
+ (void)getAppraisalTypeListCompletion:(void (^)(BOOL success, NSArray *appraisalTypeList, NSString *message))block;

+(NSString *)getTestResultUrl:(NSDictionary *)dic;

+(void)getAppraisalListWithZone_id:(NSString *)zone_id type:(NSString *)type completion:(void (^)(BOOL, NSArray *, NSString *))block;

+ (void)getAttentionListWithPage:(NSInteger)page pagesize:(NSInteger)pagesize type:(NSInteger)type Completion:(void (^)(BOOL success, NSDictionary *data, NSString *message))block;

+(void)addConsultation:(NSString *)stuAccid teaAccid:(NSString *)teaAccid completion:(void (^)(BOOL success, NSArray *arr, NSString *msg))block;

+ (void)getAppraisalReportListWithUser_id:(NSNumber *)user_id type_id:(NSString *)type_id page:(NSNumber *)page pageSize:(NSNumber *)pageSize completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(void)getAppraisalDetailWithType_id:(NSString *)type_id completion:(void (^)(BOOL, NSDictionary *, NSString *))block ;

+ (void)getStartPageWithParams:(NSDictionary *)parmas completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+ (void)submitAppraisal:(NSString *)answer type_id:(NSString *)type_id completion:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(void)getAboutMyNotiListWithLastMessageId:(NSInteger)lastMessageId pagesize:(NSInteger)pagesize Completion:(void (^)(BOOL success, NSDictionary *data, NSString *message))block;

+(void)getArticleListV2:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *dic, NSString *msg))block;//文章列表

+(NSString *)backTimeinterval;

+(NSString *)backSign:(NSString *)url andDic:(NSDictionary *)dataDic;

+(void)registerDeviceTokenWithToken:(NSString *)token registrationID:(NSString *)registrationID block:(void (^)(BOOL, NSDictionary *, NSString *))block;
+(void)pushLoginOutWithBlock:(void (^)(BOOL, NSDictionary *, NSString *))block;

+(void)addComment:(NSDictionary *)dic completion:(void (^)(BOOL success, NSDictionary *arr, NSString *msg))block;
@end
