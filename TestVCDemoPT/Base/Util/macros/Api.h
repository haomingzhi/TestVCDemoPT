//
//  Api.h
//  JYZX
//
//  Created by yc on 2017/4/14.
//  Copyright © 2017年 Outsourcing. All rights reserved.
//

#ifndef Api_h
#define Api_h
#define CHANGECOLLECT @"changecollect"

#define dev_Url @"http://api.dadaodata.com/student2/"
#define pro_Url @"https://api.zgxyzx.net/student2/"
#define yanshi_Url @"http://api.dadaozx.com/student2/"
#define kaifa_Url @"https://api.test.com/student2/"


#define collegeDomainTest @"https://api.dadaodata.com/college/"//院校端测试环境
#define collegeDomainYanshi @"https://api.dadaozx.com/college/"//院校端演示环境
#define collegeDomainZhengshi @"https://api.zgxyzx.net/college/"//院校端正式环境


#define testDev_Url @"http://api.dadaodata.com/evaluate2/"
#define testPro_Url @"https://api.zgxyzx.net/evaluate2/"
#define testYanshi_Url @"https://api.dadaozx.com/evaluate2/"
#define testKiifa_Url @"https://api.test.com/evaluate/"

#define newSanduanDev_Url @"https://api.dadaodata.com/school/"
#define newSanduanPro_Url @"https://api.zgxyzx.net/school/"
#define newSanduanYanshi_Url @"https://api.dadaozx.com/school/"

#define operationsDev_Url @"https://api.dadaodata.com/ddzx/"
#define operationsPro_Url @"https://api.zgxyzx.net/ddzx/"
#define operationsYanshi_Url @"https://api.dadaozx.com/ddzx/"

#define baseApiDev_Url @"https://api.dadaodata.com/base/"
#define baseApiPro_Url @"https://api.zgxyzx.net/base/"
#define baseApiYanshi_Url @"https://api.dadaozx.com/base/"

#define testPublicSurvice_Url @"https://api.dadaodata.com/"
#define ZhentshiPublicSurvice_Url @"https://api.zgxyzx.net/"
#define YanshiPublicSurvice_Url @"https://api.dadaozx.com/"

#define imxDev_Url @"http://api.dadaodata.com/expert/"
#define imPro_Url @"https://api.zgxyzx.net/expert/"
#define imYanshi_Url @"https://api.dadaozx.com/expert/"
#define imKaifa_Url @""

#define isTest isTestV
#define isYanshi !isDisV

#define homeUrl isTest ? dev_Url: isYanshi ? yanshi_Url: pro_Url
#define textUrl isTest ? testDev_Url: isYanshi ? testYanshi_Url: testPro_Url
#define imURL isTest ? imxDev_Url: isYanshi ? imYanshi_Url : imPro_Url
#define collegeUrl isTest ? collegeDomainTest: isYanshi ? collegeDomainYanshi: collegeDomainZhengshi
#define newSanduanUrl isTest ? newSanduanDev_Url: isYanshi ? newSanduanYanshi_Url :  newSanduanPro_Url
#define operationsUrl isTest ? operationsDev_Url: isYanshi ? operationsYanshi_Url :  operationsPro_Url
#define baseApi isTest ? baseApiDev_Url: isYanshi ? baseApiYanshi_Url :  baseApiPro_Url
#define publicSurviceUrl isTest ? testPublicSurvice_Url: isYanshi ? YanshiPublicSurvice_Url : ZhentshiPublicSurvice_Url

#define encryptionKey @"JF0XMw6XhwU8jXHH"

#pragma mark - public
#define apiRegisterWithTourist @"/api/user/studentAppUserRegister"//游客注册
#define apiLoginWithTourist @"/api/user/login"//游客登录
//#define apiLogin @"/api/publics/login"//用账号密码登录
#define apiLoginWithCode @"/api/publics/loginCode"//用手机验证码登录
#define getCityList @"/api/publics/getCityList"//获取城市列表
#define getSchoolList @"/api/publics/getSchoolList"//获取高中学校列表
#define apiSendSms @"/api/publics/sendSms"//获取验证码
#define apiIfNeedUpdate @"/api/publics/proUpdate"//app是否需要更新
//#define apiTokenWithIM @"/im/chat/getToken"//获取im的token
#define apiJudgeIsMinhan @"/api/index/isShowJohari"//判断是否是闵行二中
#define apiGetZHLCInfo @"archives/StudentData/getJohari"//获取周哈利创详情
#define apiGetFourDimensional @"archives/StudentData/getFourDim"//四维评价

//#define getCommentList @""//获取评论列表
//院校的视频详情
#define collecVideoDetail @"/api/college/collegeVideoInfo"
//生涯课堂等
#define publicVideoDetail @"/api/school/schoolVideoInfo"
//视频链接
#define apiGetVideoList @"/api/qiniu/getVideoUrl"

#pragma mark - user
#define getUserInfo @"/api/user/getMessage"
#define apiUserChangePasswd @"/api/user/resetPasswordByPwd"//更改密码
#define apiUserChangePasswdByTel @"/api/user/resetPasswordByTel"//通过手机号码改密码
#define apiUserBindTel @"/api/user/saveMobile"//绑定手机号
#define apiResetPassword @"/api/publics/resetPassword"//重置密码
#define apiChangeBirthday @"/api/user/saveBirthday"//修改生日
#define apiChangeIcon @"/api/user/savePic"//修改头像
#define apiChangeGender @"/api/user/saveGender" //修改性别
#define apiUpdateImUserInfo @"/im/chat/apiUpdateUser"//同步用户的im信息

#pragma mark - user.parents
#define apiGetParentsList @"/api/Parents/getParentList"//parents's list
#define apiAddParents @"/api/Parents/addParent"//user add parents
#define apiModifyParentsPhone @"/api/Parents/updateParent"//users modify their parents' phone
#define apiModifyParentsInfo @"/api/Parents/updateParentData"//users modify their parents' info
#define apiUnbindParents @"/api/Parents/cleanParent"//user unbind their parents'
#define apiGetUserVolunteerRecord @"/archives/will/getSumData"//志愿精测数据
#define apiGetUserVolunteerRecordList @"/archives/will/getList"//志愿精测记录列表
/***
 notification
 */
#define apiGetNotificationList @"/api/pushList/getList"//notification list
#define apiGetReplyList @"/api/pushList/getCommentinfo"//reply list
#define apiGetNotificationListWithCource @"/api/pushList/getStartClassinfo"//上课提醒列表
#define apiGetNotiWithHomeworkList @"/api/pushList/getHomeworkList"//通知里的作业列表
#define apiGetNotiWithReviewHomeworkList @"/api/pushList/getTeacherHomeworkList"//通知里批阅的作业列表
#define apiGetNotiWithHonourList @"/api/pushList/getHonorinfo"//通知里的荣誉列表
#define apiGetCollegeNotiList @"/api/pushList/getSchoolNoticeinfo"//通知里的校园通知
#define apiGetNotiWithQuestionnaireList @"/api/pushList/getEduQuestioninfo"//问卷通知列表
#define apiGetNotiWithEduList @"/api/pushList/getEduSchoolNoticeinfo"//教育局通知列表
#define apiGetNotiWithQueDetail @"/service/api/Research/getQuestion"//问卷通知里的详情
#define apiSubmitNotiWithQue @"/service/api/Research/answerQuestion"//提交通知问卷
#define apiGetOverAnswerList @"/service/api/Research/lookOverQuestion"//问卷通知查看问卷





#pragma mark - collect

#define getCollectWithArctcal @"/api/CollectManage/getList"//收藏列表
#define apiAddCollect @"/api/CollectManage/addInfo"//点击收藏
#define apiCollectDelInfo @"/api/CollectManage/delInfo"//取消收藏




#pragma mark - school

#define apiSchoolCareerVideo @"/api/school/careerVideo"
#define apiSchoolVideoClass @"/api/school/videoClass"
#define apiSchoolSchoolVideo @"/api/school/schoolVideo"

#pragma mark - 测评
#define appraisalTextV2 @"/evaluate2/api/Question/getInfoV2"//获取测评题目
#define appraisalText @"/api/Question/getInfo"//获取测评题目
#define appraisalPostAnswer @"/api/Evaluate/addInfo"//提交测评
#define appraisalList @"/api/Question/getList"//获取测评题目列表
#define appraisalResult @"/api/Result/getInfo"//测评详情
#define apiGetResultList @"/api/Result/getList" //测评历史列表  //bao
#define apiQuestionGetInfo @"/api/Question/getInfo"


#pragma mark - course 生涯选科
#define apiGetCourseList @"/api/Courses/getTaskList"//选科列表
#define apiGetCourseDetail @"/api/Courses/getTaskData"//选科详情
#define apiSubmitCourse @"/api/Courses/selectSubmit"//提交选科
#define apiOhtersCourse @"/api/Courses/selectCount"//学生选择统计
#define apiGetStudentCourse @"/api/Courses/getStuSelect"//获取学生选择

#pragma mark - classroom
#define apicourse @"/api/Interaction/getContentList"//课程
#define apiteachClass @"/api/Interaction/toCourse" //上课日程
#define apiClassroomHomeworkList @"/api/Interaction/homeworkList"//课堂作业列表
#define apiLessonQuestionList @"/api/Interaction/getQuestionList"//学生获取回答问题列表
#define apiSingByNum @"/api/Interaction/numberSign"//数字码签到
#define apiclassroomHome @"/api/Classroom/index" //课堂首页数据
#define apiClassroomList2 @"/student/Lesson/getList"
#define apiClassroomList @"/student/Lesson/getListContent"
#define apigetInfoDetail @"/api/Article/getInfo"//资讯详情
#define apigetClassInfoDetail @"Api/lessonplan.TeacherUse/prepareDetailMain"//课堂资讯资讯详情
#define apiGetClassWebInfoDetail @"api/lessonplan.TeacherUse/prepareArticle"//课堂资讯详情web
#define apiSankuVideo @"/Api/College/videoInfo"//三库视频详情
#define apiclassroomHomework @"/api/Classroom/getHomework"//
#define apiclassroomHomeworkMark @"/api/Classroom/readOverList"//作业批阅情况
#define apigetQINIUToken @"/api/Qiniu/getToken"//获取七牛云token
#define apipostImageToQINIU @"/api/Image/upload" //上传图片
#define apiclassroomAddHomework @"/api/Classroom/addHomework"//课堂添加作业
#define apiSubmitAnswer @"/api/Interaction/stuInsertQuestion"//提交提问 讨论
#define apiSubmitPic @"/api/Interaction/insertPicOnWord"//提交照片上墙
#define apiClassroomHomeworkInfo @"/api/Interaction/homeworkContent"//课堂作业内容
#define apiClassroomFinishList @"/api/Interaction/remarkList"//批阅记录
#define apiDoHomeworkForClassroom @"/api/Interaction/homeworkSubmit"//提交课堂作业
#define apiJudgeLessonStart @"/api/Interaction/tchStarInteract" //判断课程互动是否开始
#define apiJudgeHasVideoCommentRecord @"api/TempJobExperience/chkFinish"//判断是否已经填写视频评论
#define apiSendScanVideoCommentRecord @"api/TempJobExperience/addComment"//扫码填写视频评论

#pragma mark - comment
#define apigetCommentList @"/api/CommentManage/getList"//评论列表
#define ApisendComment @"/api/CommentManage/addInfo"//添加评论
#define apiMixCommentList @"/api/CommentManage/getMixedList"//混合评论列表
//#define apiSendMixComment @"/api/CommentManage/addInfo"//发送混合评论

#pragma makr - 三库
#define apiSurveyCollege @"/api/will/getSchool"//志愿精测

#define apiApplyVideoList @"/Api/aio.AioTopic/videoList"//应用视频列表
#define apiApplyVideoType @"/Api/aio.AioTopic/srhtermcategoryList"//应用视频分类列表
#define apiApplyAppraisalList @"/api/Question/getList"//应用测评列表数据
#define apiApplyMainList @"/Api/College/getAppList"//应用首页列表数据
#define apiAboutArticleList @"/Api/College/getArticleList"//相关文章
#define apiAboutVidelList @"/Api/College/getVideoList"//相关视频
#define apiSelectMenu @"/api/ElectiveManage/getBaseInfo"//选科菜单
#define apigetAppCollegeOrMajor @"/api/ElectiveManage/getAppCollegeOrMajor"//选科查询专业或者大学
#define apiHadEvaluateRecord @"/api/Evaluate/evaluate_result"//是否完成过mbti测评
#define apiGetChooseSectionProvince @"/api/ElectiveManage/region"//选科里的省份信息
#define apiGetMBTIResult @"/api/Evaluate/evaluate_result"//获取mbti结果
#define apiGetMBTIJobList @"/api/Evaluate/getresult"//获取目标诊断里职业栏
#define apiGetReformSubjectInfo @"/index/CollegeElective/getSubject"//获取改革省份里的选科科目
#define apiGetRecommendCollege @"/api/ElectiveManage/getSchoolByWlApp"//目标诊断里推荐的院校

/**
 @pragma school
 ***/
#define apiGetCollegeInfo @"/api/College/getCollegeInfo"//获取学校信息
#define apiGetCollegeList @"/api/College/getCollegeList"//获取学校列表
#define apiGetHotCollegeList @"/api/College/hotCollege"//热门院校列表
#define apiGetCollegeSearch @"/three/LibraryData/searchItemV2"//院校的筛选列表数据
#define apiGetCollegeScore @"/api/College/getCollegeScoreInfo"//分数线
#define apiSiftScore @"/api/College/SearchList"//分数线筛选
#define apiGetCollegeMajor @"/api/College/getAioCollegeMajorList"//院校对应的专业列表
#define apiGetCollegePicList @"/api/College/getCollegePicList"//院校风光列表
/**
 @pragma job
 ***/
#define apiGetJobList @"/api/College/occupationList"//获取职业列表
#define apiGetHotJobList @"/api/College/hotOccupation"//获取热门职业列表
#define apiGetJobInfo @"/api/College/occupationInfo"//获取职业详情
#define apiGetJobMajorList @"/Api/College/occupationMajorList"//职业下对应的专业列表
#define apiGetJobType @"/Api/College/occupationTypeList"//职业大分类数据
/**
 @pragma major
 ***/
#define apiGetMajorSearch @"/api/College/majorAllList"//专业搜索列表
#define apiGetMajorInfo @"/api/College/majorInfo"//专业详情
#define apiGetMajorList @"/api/College/getLevelMajorList"//全部专业列表
#define apiGetMajorCollegeList @"/api/College/majorCollegeList"//专业下对应的院校列表

/**
 @pragma attention
 **/
#define apiAddAttention @"/api/FollowManage/addInfo"//添加关注
#define apiCancelAttention @"/api/FollowManage/delInfo"//取消关注
#define apiGetAttentionList @"/school/api/FollowManage/getList"//关注列表

/**
 @pragma consult
 **/
#define apiGetExpertInfo @"/im/experts/getExpertById"//专家详情
#define apiAddExpertHelpPeople @"/im/experts/addHelpPeople"//专家咨询人数加一
#define apiConsultTopInfo @"/im/experts/getBaseInfo"
#define apiConsultTopExpert @"/im/experts/getExperts"//推荐的专家
#define apiExpertList @"/im/experts/getExperts"//专家列表
#define apiExpertInfo @""//专家详情
#define apiConsultType @"/im/experts/getAioTagsList"//咨询类型
#define apiConsultArticle @"/im/Commentary/getArticleList" //咨询文章


/**
  Record
 */
#define apiGetHomeworkRecord @"/archives/report/getHomeworkData"//学生作业统计
#define apiGetClassRecord @"/student/StuInteraction/getLessSum"//学生上课统计
#define apiGetClassRecordList @"/student/StuInteraction/getLessList"//学生上课记录列表
#define apiGetTermSummary @"/archives/StudentData/getTrimSummed"//学生学期总结
#define apiGetTermInfo @"/archives/StudentData/getSchoolTerm"//当前学期信息
#define apiAddTermSummary @"/archives/StudentData/addTrimSummed"//添加学期总结
#define apiGetTermList @"/archives/StudentData/getTermList"//学期列表
#define apiGetStudentSumScore @"/archives/score/getSumScore"//学生成绩统计
#define apiGetHonnourList @"/archives/report/getHonerList"//荣誉列表

/***
    target and careerTree
 **/
#define apiGetUserAllTarget @"/api/GoalManage/getInfo"//用户所有的目标
#define apiSetTarget @"/api/GoalManage/addInfo"//设置目标
#define apiGetTargetMajorList @"/three/LibraryData/job2Major"//设置完职业的专业列表
#define apiGetTargetCollegetList @"/index/Major/collegeListByNumber"//设置完职业专业下的院校列表
#define apiGetCareerTreeInfo @"/api/CareerTreeManage/getList"//生涯树数据
#define apiAddTreeMark  @"/api/CareerTreeManage/addTreeMark"//打卡
#define apiGetTreeMarkRecord @"/api/CareerTreeManage/getTopList"//打卡记录

#pragma mark - home URL
//首页接口
#define apiGetHomeSlideList @"/api/pai.ArticleManage/getSlideList"//获取轮播图列表数据，这里轮播图和轮播图广告会一起整合获取
#define apiGetHomeJournalCover @"/Api/pai.ArticleManage/getJournalInfo"//首页校刊封面
#define apiGetHomeJournalList @"/Api/pai.ArticleManage/journalList" //校刊列表
#define apiGetHomeJournalInfo @"/Api/pai.ArticleManage/journalInfo"//期刊详情
#define apiGetHomeCategoryList @"/Api/pai.ArticleManage/categoryList"//分类列表
#define apiGetHomeAllArticleList @"/Api/pai.ArticleManage/articleList"//文章列表
#define apiGetHomeArticleList @"/Api/pai.ArticleManage/getArticleList"//相关文章列表
#define apiGetHomeNewArticleList @"/Api/pai.ArticleManage/getNewArticleList"//最新文章列表
#define apiGetHomeSlide @"Api/app.Index/getSlide"//座右铭
#define apiGetPeriodicalList @"Api/wechat.WechatTopic/journalCoverList"//期刊列表
#define apiGetLookHorizonList @"Api/app.index/topicCoverList" //看视界列表
#define apiGetLookHorizonDetail @"/Api/app.Index/topicHeadList" //专题详情
#define apiGetRecommendTopJob @"/api/evaluate/occupationList"//首页推荐的职业
#define apiGetPeriodicalImageDetail @"/Api/aio.AioTopic/journalInfo" //点击查看期刊图片详情


#pragma 包树枫 新接口

#define submitActiveURL @"http://ddzx.api.zgxyzx.net/" //提交订单的URL

#define collegeURL @"http://api.dadaodata.com//college/" //查选课使用


#pragma 登录
#define apiGetBaseModules @"/api/edu.EduArticle/getBaseModules" //获取学校套餐模块列表
#define apiGetSchoolList @"/api/gw.GwIndex/getSchoolList" //获取学校名称
#define apiGetGuidePage @"/Api/app.Slide/getGuidePage" //app引导页
//#define apiGetStartPage @"/Api/app.Slide/getStartPage" //app启动页
#define apiGetSlideList @"/Api/app.Slide/getSlideList" //app轮播图

#pragma 生涯作业
#define apiGetHomeworkFinishedUnFinishedNum @"/api/Career/getHomeworkFinishedUnFinishedNum" //作业完成未完成数目
#define apiGetHomeworkList @"/api/Career/getHomeworkList" //作业列表
#define apiGethomeworkContent @"/api/Interactions/homeworkContent" //作业内容

#pragma 生涯学习
#define apiGetVideoStudyProgress @"/api/Career/getVideoStudyProgress" //历史学习
#define apiGetBookVideoList @"/api/Career/getBookVideoList" //视频列表
#define apiGetBooks @"/Api/app.Theme/getBooks" //教材列表
#define apiGetVideoDetail @"/api/Career/videoDetail" //视频详情

#define apiGetRelatedVideoList @"/api/lessonplan.TeacherUse/getList" //相关视频

#define apiAddStudyLog @"/api/Career/addStudyLog" //新增学习记录

#pragma mark 测评

#define apiGetAppraisalTypeList @"/api/Question/getZone" //测评类型

#define apiGetAppraisalList @"/api/Question/getList" //测评列表

#define apiGetAppraisalDetail @"/api/Question/getInfoV2" //测评详情

#define apiSubmitAppraisal @"/api/Evaluate/addInfo" //提交测评

#pragma mark 生涯实践

#define apiGetActiveList @"/Api/active.ActiveManage/getActiveList" //获取活动标签

#define apiGetActiveInfo  @"/Api/active.ActiveManage/getActiveInfo" //活动详情

#define apiaddOrderGoods @"/Api/active.ActiveManage/addOrderGoods" //提交活动报名

#define apiCheckStuActiveAttending @"/Api/active.ActiveManage/checkStuActiveAttending"//检测当前活动是否可以报名

#define paiCheckParentList @"/api/Parents/getParentList" //检测是否绑定家长

#define apiGetMyActive @"/Api/active.ActiveManage/myActive" //获取我的活动

#define apiGetProvince  @"/three/LibraryData/searchItemV2" //获取查选科的省份

#define apiGetReformProvince @"/api/ElectiveManage/getBaseInfo" //获取改革后的省份

#define apiGetAppCollegeOrMajor @"/api/ElectiveManage/getAppCollegeOrMajor" //

#pragma mark 生涯选科

#define  apiGetHistoryTaskList @"/api/Courses/getHistoryTaskList" //获取生涯选科历史记录


#define  apiGetCurrentCourse @"/api/Career/getCurrentCourse?"//获取生涯课堂状态

#define  apiGetCurrentTermHistoryCourse @"/api/Career/getCurrentTermHistoryCourse?" //生涯课堂历史课堂

#define  apiGetCurrentCourseContentList  @"/api/Interaction/getContentList?" //生涯课堂内容

#endif /* Api_h */
