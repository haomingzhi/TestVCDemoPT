//
//  DDJYApi.h
//  DDZX_js
//
//  Created by apple on 2018/8/8.
//  Copyright © 2018年 wjy. All rights reserved.
//

#ifndef DDJYApi_h
#define DDJYApi_h
#define isTestV YES //是否测试
#define isDisV  YES //是否发布
#define isUseTestData NO//是否使用自定义本地假数据

#define WXUrlSchemes @""   //微信应用id
#define AliUrlSchemes @"JSPay"

#define encryptionKey @"JF0XMw6XhwU8jXHH"
#define IPhoneX   ((UIScreenHeight == 812)? YES:NO)

#define weexDev_Url isTestV  ? @"http://weex.dadaodata.com" : isDisV ? @"https://weex.zgxyzx.net" : @"http://weex.dadaozx.com"
#define imDev_Url isTestV  ? @"http://api.dadaodata.com" : isDisV ? @"https://api.zgxyzx.net" : @"http://api.dadaozx.com"
#define imWeexDev_Url isTestV  ? @"http://api.dadaodata.com/" : isDisV ? @"https://api.zgxyzx.net/" : @"http://api.dadaozx.com/"


//user_id 过滤多余tag
#define USERID_Fix  isTestV  ?  @"test" :  isDisV ? @"ddzx" : @"demo"
#define TOUSERID_Fix  isTestV  ?  @"lmtt" :  isDisV ? @"lmzx" : @"lmdm"
//推送证书名称
#define PushCer isTestV ? @"devExpert" : isDisV ?  @"ddzxExpert": @"devExpert"
//im的app key
#define NIMAppKey  @"d3a6fbafd398e87e20477d2f4fcfb116"

#define apiCommentAddComment @"/school/api/Comment/addComment"//添加评论
#define articleManageArticleInfo @"/ddzx/Api/app.ArticleManage/articleInfo"//文章详情
#define articleManagegetArticleListV2 @"/ddzx/api/app.ArticleManage/getArticleListV2"//文章列表
#define payApiAddorder @"/pay/api/addorder"//付款
#define apiActivityDetailSupplementOrder @"/expert/api/ActivityDetail/supplementOrder"//订单内容补充
#define apiActivityDetailParticipateActivityDetail @"/expert/api/ActivityDetail/participateActivityDetail"//参与活动（实际是生成订单）
#define apiActivityDetailGetOrderDetail  @"/expert/api/ActivityDetail/getOrderDetail"//订单详情
#define getAboutMyNotiList @"/school/api/comment/getCommentMessageList"//关于我的通知列表
#define getCityList @"/student2/api/publics/getCityList"//获取城市列表
#define getSchoolList @"/student2/api/publics/getSchoolList"//获取高中学校列表
#define apiLogin @"/base/api/user/login"
#define apiLoginExpert @"/base/api/Login/LoginExpert"
#define apiTokenWithIM @"/expert/im/chat/getToken"
#define apiGetTestListData @"/expert/api/evaluate/getlist"
#define apiScaleSolutionList @"/expert/api/ScaleSolution/scaleSolutionList"
#define apiGetExpertList @"/expert/api/Expert/getExpertList"
#define  apiGetExpertAnswerList @"/expert/api/Answer/getExpertAnswerList" // 获取个人问答列表
#define  apiGetAnswerList @"/expert/api/Answer/getAnswerList" // 获取默认问答列表
#define  apiAnswerDeleteExpertAnswer @"/expert/api/Answer/deleteExpertAnswer"  //删除个人问答
#define  apiAnswerAddExpertAnswer @"/expert/api/Answer/addExpertAnswer" // 添加个人问答
#define  apiAnswerSaveExpertAnswer  @"/expert/api/Answer/saveExpertAnswer" // 修改个人问答
#define  apiEvaluateAddEvaluate  @"/expert/api/Evaluate/addEvaluate"  // 添加导师评价
#define  apiConsultationAddConsultation  @"/expert/api/Consultation/addConsultation"//  是否当天第一次聊天，直接请求，不关心返回
#define  apiAnswerAnswerInfo @"/expert/api/Answer/answerInfo" //获取参考问答详情
#define  apiAnswerAnswerExpertInfo @"/expert/api/Answer/answerExpertInfo" //获取导师问答详情
#define  apiUserGetUserInfo @"/expert/api/User/getUserInfo"
#define  apiMypj @"/dist/mypj.js" //我的评价
#define  apiActivityDetailGetBroadcast @"/expert/api/ActivityDetail/getBroadcast"//首页轮播图
#define  apiActivityDetailActivityDetailList @"/expert/api/ActivityDetail/activityDetailList"//活动列表
#define  apiDistMyEvedetails @"/dist/myEvedetails.js" //活动详情
#define  apiExpertCheckExpert @"/expert/api/Expert/checkExpert"
#define  apiExpertExpertPushList @"/expert/api/Expert/expertPushList" //消息通知
#define  apiActivityDetailArticleOrderList  @"/expert/api/ActivityDetail/articleOrderList"//我的活动
#define  apiCollectManageGetList  @"/student2/api/CollectManage/getList" //我的收藏
#define  apiExpertExpertSign @"/expert/api/Expert/expertSign"//签到
#define  apiSmsSendCode @"/base/api/sms/sendCode"//发送验证码
#define  apiUserSaveMobile @"/student2/api/user/saveMobile"//修改手机号
#define  apiUserResetPasswordByTel @"/student2/api/user/resetPasswordByTel"//修改密码
#define  apiQiniuGetToken @"/base/api/Qiniu/getToken"//七牛
#define  apiFeedbackGetQuestionTermType  @"/ddzx/api/school.Feedback/getQuestionTermType"//反馈类型
#define  apiFeedbackTutorFeedback  @"/ddzx/api/school.Feedback/tutorFeedback"//问题反馈
#define  apiUserRegister   @"/base/api/user/register"//注册、
#define  apiUserResetPasswordV2  @"/base/api/user/resetPasswordV2"//忘记密码、
#define  apiAioTopicCareerVideoList @"/ddzx/Api/aio.AioTopic/careerVideoList"//生涯课堂
#define  apiPublicsGetSchoolListV2 @"/student2/api/publics/getSchoolListV2"
#define  apiExpertSaveExpert @"/expert/api/Expert/saveExpert"//修改用户资料
#define  apiExpertAddExpert @"/expert/api/Expert/addExpert"//添加用户资料
#define  apiActivityColumnMerger @"/expert/api/Activity/columnMerger"
#define DDapiGetAppraisalTypeList @"/api/Question/getZone" //测评类型
#define DDapiAppraisalList @"/api/Question/getList"//获取测评题目列表
#define DDapiGetResultList @"/api/Result/getList" //测评历史列表  //bao
#define DDappraisalPostAnswer @"/api/Evaluate/addInfo"//提交测评
#define DDapiGetAppraisalDetail @"/api/Question/getInfoV2" //测评详情
#define apiGetStartPage @"/ddzx/Api/app.Slide/getStartPage" //app启动页
#define GetAttentionList @"/school/api/FollowManage/getList"//关注列表
#define  apiConsultationddConsultation @"/expert/api/Consultation/addConsultation"//im添加咨询
#define  apiUpdateUser @"/expert/im/chat/apiUpdateUser"//更新IM信息接口
#define  apiuserAgreement @"/dist/userAgreement.js"


//推送相关
#define RegisterDeviceToken @"/message/app/user/regJpush"
#define PushLoginOut @"/message/app/user/logOutJpush"//注销推送


//#define
#endif /* DDJYApi_h */
