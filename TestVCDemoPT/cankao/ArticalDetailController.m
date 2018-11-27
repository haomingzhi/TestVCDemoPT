//
//  ArticalDetailController.m
//  LMSY
//
//  Created by 侯 on 2018/10/22.
//  Copyright © 2018年 DaDaoZhiXing. All rights reserved.
//

#import "ArticalDetailController.h"
#import "ShareView.h"
#import "ArticalDetailModel.h"
#import "ArticalScroller.h"
#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - navBarHei*2)
#define IMAGE_HEIGHT SCREEN_WIDTH/16*9

@interface ArticalDetailController ()<UIWebViewDelegate,UIScrollViewDelegate,YYTextViewDelegate>

@property (strong, nonatomic) ArticalScroller *contentScroller;
@property (strong, nonatomic) UIImageView *headImgV;
@property (strong, nonatomic) UIWebView *webView;

@property(nonatomic,strong)UIView *scrollerContentView;

@property(nonatomic,strong)UIBarButtonItem *shareItem ;

@property(nonatomic,strong)UIBarButtonItem *collectItem;

@property(nonatomic,strong)UIView *bottomView;

@property (nonatomic, strong) ShareView * shareView;

@property(nonatomic,strong)ArticalDetailModel *infoModel;

@property(nonatomic,assign)BOOL showNavi;

@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *commentView;
@property (nonatomic,strong) UIButton *sendBtn;
@property(nonatomic,strong)YYTextView *replyTextView;

@property(nonatomic,assign)BOOL vcCanScroll;

@end

@implementation ArticalDetailController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotify:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotify:) name:UIKeyboardWillHideNotification object:nil];
    
    self.vcCanScroll = true;
    
    [self setNavi];
    
    [self setUpUI];
    
    [self getData];
    
    NSString *url = [NSString stringWithFormat:@"http://share.%@/article.html?type=4&id=%ld",ShareAppendStr,self.articalId];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:6.0];

    DLog(@"articalUrl == %@",url);
    self.webView.delegate = self;
    [self.webView loadRequest:request];
    
//    NSString *url = [NSString stringWithFormat:@"http://share.51lmsy.com/article.html?type=4&id=%ld&cover=%@",self.articalId,@""];
//
//
//    //    NSURLRequest *request= [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://juejin.im/post/5bb1e7df5188255c9c754182"]];
//    self.webView.delegate = self;
//    //    [self.webView loadRequest:request];
//
//
//    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url] options:0 error:nil];
//    [self.webView loadData:data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:url]];
//
//    self.webView.scrollView.scrollEnabled = false;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    
    [JCountManager countPageViewWithKey:[NSString stringWithFormat:@"%@+文章",self.articalTitle]];

}

#pragma mark - keyboard
-(void)keyboardWillChangeFrameNotify:(NSNotification*)notify {
    
    // 0.取出键盘动画的时间
    CGFloat duration = [notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [notify.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 2.计算控制器的view需要平移的距离
    CGFloat transformY = keyboardFrame.size.height;
    
    DLog(@"height == %.2f",keyboardFrame.size.height);
    
    // 3.执行动画
    WeakSelf(self);
    [UIView animateWithDuration:duration animations:^{
        weakself.bgView.frame = CGRectMake(0, SCREEN_HEIGHT - 170 - transformY, SCREEN_WIDTH, 170);
    }];
}

- (void)keyboardWillHideNotify:(NSNotification *)note
{
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    WeakSelf(self);
    [UIView animateWithDuration:duration animations:^{
        
        weakself.bgView.frame = CGRectMake(0, SCREEN_HEIGHT - 170, SCREEN_WIDTH, 170);
    } completion:^(BOOL finished) {
        weakself.commentView.hidden = true;
    }];
    
}

-(void)setNavi{
    [self wr_setNavBarBarTintColor:[UIColor whiteColor]];
    [self wr_setNavBarBackgroundAlpha:0];
    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"分享"] style:UIBarButtonItemStylePlain target:self action:@selector(shareAction)];
    
    self.shareItem = shareItem;
    
//    UIBarButtonItem *collectItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"收藏"] style:UIBarButtonItemStylePlain target:self action:@selector(collectAction)];
//    self.collectItem = collectItem;
//
//    [collectItem setImageInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    
    self.navigationItem.rightBarButtonItems = @[shareItem];
}

-(void)setUpUI{
    [self.view addSubview:self.contentScroller];
    

    [self.contentScroller addSubview:self.headImgV];
    self.headImgV.frame = CGRectMake(0, 0, SCREEN_WIDTH, IMAGE_HEIGHT);
    
    [self.contentScroller addSubview:self.webView];
    self.webView.frame = CGRectMake(0, CGRectGetMaxY(self.headImgV.frame), SCREEN_WIDTH, SCREEN_HEIGHT - 50);

    
    self.contentScroller.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 50 + IMAGE_HEIGHT);
    
    [self addBottomView];
    
    [self wr_setNavBarBackgroundAlpha:0];
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
    [self wr_setNavBarTitleColor:[UIColor whiteColor]];
    [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
    self.title = @"";
    self.showNavi = false;
    self.shareItem.image = [UIImage imageNamed:@"分享"];
}

-(void)getData{
    [SV_DDLoading show];
    WeakSelf(self);
    [LMRequestManager getArticalInfoWithArticalId:self.articalId block:^(BOOL success, NSDictionary *data, NSString *message) {
        if (success) {
            weakself.infoModel = [ArticalDetailModel mj_objectWithKeyValues:[data objectForKey:@"data"]];
//            weakself.collectItem.image = [UIImage imageNamed:(self.infoModel.is_collects ? @"已收藏" : @"未收藏")];
            [weakself.headImgV sd_setImageWithURL:[NSURL URLWithString:weakself.infoModel.head_img] placeholderImage:ArticalPlaceHolderImage];
            [SV_DDLoading dismiss];
        }else{
            [SV_DDLoading dismiss];
            [SV_DDLoading showMessage:message];
        }
    }];
}

-(UIScrollView *)contentScroller{
    if (!_contentScroller) {
        _contentScroller = [[ArticalScroller alloc] initWithFrame:CGRectMake(0, -navBarHei, SCREEN_WIDTH, SCREEN_HEIGHT - 50 - BottomSafeMargin)];
        _contentScroller.showsHorizontalScrollIndicator = false;
        _contentScroller.delegate = self;
        _contentScroller.bounces = false;
    }
    return _contentScroller;
}

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate =self;
        _webView.scalesPageToFit = true;
        _webView.scrollView.delegate = self;
        _webView.scrollView.bounces = false;
    }
    return _webView;
}

-(UIView *)scrollerContentView{
    if (!_scrollerContentView) {
        _scrollerContentView = [[UIView alloc] init];
    }
    return _scrollerContentView;
}

-(UIImageView *)headImgV{
    if (!_headImgV) {
        _headImgV = [[UIImageView alloc] init];
    }
    return _headImgV;
}


#pragma mark - **************** UIScrollerDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;

    if ([scrollView isEqual:self.contentScroller]) {
        
        if(offsetY >= IMAGE_HEIGHT && self.webView.scrollView.contentSize.height > self.webView.frame.size.height){
            self.vcCanScroll = false;
        }
        if (!self.vcCanScroll) {
            [scrollView setContentOffset:CGPointMake(0, IMAGE_HEIGHT)];
        }
        scrollView.showsVerticalScrollIndicator = self.vcCanScroll;

        
        if (offsetY > NAVBAR_COLORCHANGE_POINT)
        {
            CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / navBarHei;
            [self wr_setNavBarBackgroundAlpha:alpha];
            [self wr_setNavBarTintColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
            [self wr_setNavBarTitleColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
            [self wr_setStatusBarStyle:UIStatusBarStyleDefault];
            self.title = @"文章详情";
            self.shareItem.image = [UIImage imageNamed:@"分享-黑色"];
            self.showNavi = true;
            //        self.collectItem.image = [UIImage imageNamed:(self.infoModel.is_collects ? @"已收藏 -黑色" : @"未收藏 -黑色")];
        }
        else
        {
            [self wr_setNavBarBackgroundAlpha:0];
            [self wr_setNavBarTintColor:[UIColor whiteColor]];
            [self wr_setNavBarTitleColor:[UIColor whiteColor]];
            [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
            self.title = @"";
            self.showNavi = false;
            self.shareItem.image = [UIImage imageNamed:@"分享"];
            //        self.collectItem.image = [UIImage imageNamed:@"已收藏"];
        }
    }else{
        if (self.vcCanScroll) {
            [scrollView setContentOffset:CGPointZero];
        }
        if (scrollView.contentOffset.y <= 0) {
            self.vcCanScroll = true;
        }
        scrollView.showsVerticalScrollIndicator = !self.vcCanScroll;
    }
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    float height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"]floatValue]; //此方法获取webview的内容高度（建议使用）
//
//    [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(height);
//    }];
//
//    [self.view layoutIfNeeded];
//    [self.view setNeedsLayout];
//
//    [self.contentScroller setContentSize:CGSizeMake(SCREEN_WIDTH, height + SCREEN_WIDTH/16.0*9)];
}

-(void)addBottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_bottomView];
        
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.offset(0);
            make.bottom.offset(-BottomSafeMargin);
            make.height.mas_equalTo(50);
        }];
        
        UILabel *lab = [[UILabel alloc] init];
        lab.textColor = HexRGB(0xC4C3C9);
        lab.font = [UIFont systemFontOfSize:14];
        lab.text = @"  发表你的评价";
        [_bottomView addSubview:lab];
        lab.layer.cornerRadius = 6;
        lab.layer.masksToBounds = true;
        lab.layer.borderWidth = 0.5;
        lab.layer.borderColor = HexRGB(0xC4C3C9).CGColor;
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(15);
            make.trailing.offset(-15);
            make.centerY.offset(0);
            make.height.offset(30);
        }];
        
        UIButton *sendBtn = [[UIButton alloc] init];
        [sendBtn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:sendBtn];
        
        [sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.bottom.offset(0);
        }];
    }
}


#pragma mark - **************** lazy init
- (ShareView *)shareView {
    if (!_shareView) {
        _shareView = [ShareView getFactoryShareViewWithCallBack:^(JSHAREPlatform platform, JSHAREMediaType type) {
            [self shareLinkWithPlatform:platform];
        }];
        [[UIApplication sharedApplication].delegate.window addSubview:self.shareView];
    }
    return _shareView;
}

- (void)shareLinkWithPlatform:(JSHAREPlatform)platform {
    JSHAREMessage *message = [JSHAREMessage message];
    message.mediaType = JSHARELink;

    NSString *url = [NSString stringWithFormat:@"http://share.%@/Wechat.html?type=4&id=%ld&cover=%@",ShareAppendStr,self.articalId,self.infoModel.head_img];
    if ([XTool isStringEmpty:self.infoModel.head_img]) {
        url = [NSString stringWithFormat:@"http://share.51lmsy.com/Wechat.html?type=4&id=%ld",self.articalId];
    }
    message.url = url;
    NSString *text = @"";
    if (self.infoModel.summary.length > 100) {
        text = [self.infoModel.summary substringToIndex:100];
    }else{
        text = self.infoModel.summary;
    }
    message.text = text;
    message.title = self.infoModel.title;
    message.platform = platform;
    NSString *imageURL = self.infoModel.head_img;
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
    
    message.image = imageData;
    [JSHAREService share:message handler:^(JSHAREState state, NSError *error) {
        DLog(@"err");
    }];
}

-(void)shareAction{
    [self.shareView showWithContentType:3];
}

-(void)collectAction{
    WeakSelf(self);
    [SV_DDLoading show];
    [LMRequestManager addCollectWithRelevant_id:self.articalId type:4 block:^(BOOL success, NSDictionary *data, NSString *message) {
        if (success) {
            BOOL collected = [[[data objectForKey:@"data"] objectForKey:@"is_collects"] boolValue];
            if (weakself.showNavi) {
                weakself.collectItem.image = [UIImage imageNamed:(collected ?  @"已收藏" : @"未收藏")];
            }else{
                weakself.collectItem.image = [UIImage imageNamed:(collected ?  @"已收藏 -黑色" : @"未收藏 -黑色")];
            }
        }
        [SV_DDLoading dismiss];
        [SV_DDLoading showMessage:message];
    }];
}

-(void)sendAction{
    
    DLog(@"弹出输入栏");
    [self addCommentView];
    
    [self.replyTextView becomeFirstResponder];
    self.replyTextView.text = @"";
    
}

-(void)addCommentView{
    if (!_commentView) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        _commentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _commentView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.5];
        [window addSubview:_commentView];
        
        
        UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        clearBtn.backgroundColor = [UIColor clearColor];
        [clearBtn addTarget:self action:@selector(hideTextView) forControlEvents:UIControlEventTouchUpInside];
        [_commentView addSubview:clearBtn];
        
        //高度190
        _bgView.userInteractionEnabled = true;
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 190, SCREEN_WIDTH-72, 35)];
        _bgView.backgroundColor = [UIColor whiteColor];
        [_commentView addSubview:_bgView];
        
        UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(13, 8, SCREEN_WIDTH - 26, 104)];
        borderView.backgroundColor = [UIColor whiteColor];
        [_bgView addSubview:borderView];
        
        borderView.layer.cornerRadius = 4;
        borderView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        borderView.layer.borderWidth = 0.4;
        borderView.layer.masksToBounds = true;
        
        
        self.replyTextView = [[YYTextView alloc] initWithFrame:CGRectMake(15, 10, SCREEN_WIDTH - 30, 100)];
        self.replyTextView.placeholderFont = [UIFont systemFontOfSize:16];
        self.replyTextView.textColor = HexRGB(0xE5E5E5);
        self.replyTextView.delegate = self;
        [_bgView addSubview:self.replyTextView];
        self.replyTextView.textColor = HexRGB(0x3A424D);
        self.replyTextView.font = [UIFont systemFontOfSize:18];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, 0.4)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [_bgView addSubview:lineView];
        
        [_bgView addSubview:self.sendBtn];
        self.sendBtn.frame = CGRectMake(SCREEN_WIDTH - 100, 128, 80, 34);
        self.sendBtn.backgroundColor = HexRGB(0x505050 );
        self.sendBtn.layer.cornerRadius = 4;
        self.sendBtn.layer.masksToBounds = true;
    }
    self.replyTextView.placeholderText = @"发表你的评价";
    self.commentView.hidden = false;
}

#pragma mark - send comment
- (void)sendComment
{
    if ([self.replyTextView.text.stringByTrim isEqualToString:@""]) {
        [SV_DDLoading showMessage:@"请输入您的评论"];
        return;
    }
    
    [SV_DDLoading show];
    WeakSelf(self);
    [LMRequestManager addvideoCommentWithType:4 content:self.replyTextView.text.stringByTrim relative_id:self.articalId block:^(BOOL success, NSDictionary *data, NSString *message) {
        [SV_DDLoading showMessage:message];
        if (success) {
            [weakself hideTextView];
            
            [weakself.webView stringByEvaluatingJavaScriptFromString:@"refreshEvaluation();"];
        }
    }];
}

-(void)hideTextView{
    [self.replyTextView resignFirstResponder];
}

- (UIButton *)sendBtn
{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendBtn setTitle:@"发送" forState:0];
        [_sendBtn setTitleColor:[UIColor whiteColor] forState:0];
        _sendBtn.titleLabel.font = [UIFont systemFontOfSize:19];
        _sendBtn.frame = CGRectMake(SCREEN_WIDTH - 62, 14.5, 50, 27);
        [_sendBtn addTarget:self action:@selector(sendComment) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;
}


@end
