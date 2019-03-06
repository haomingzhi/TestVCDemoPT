//
//  JYHtmlTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYHtmlTableViewCell.h"
@interface JYHtmlTableViewCell()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)NSString *html;
@property(nonatomic)BOOL isFinished;
@end

@implementation JYHtmlTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.webView];
//        self.contentView.backgroundColor =
    }
    return self;
}
-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
        _webView.scrollView.bounces = NO;
    }
    return _webView;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
     self.isFinished = YES;
    [self setNeedsLayout];
    if (_callBack) {
        _callBack(@{@"H":@(self.webView.scrollView.contentSize.height)});
    }
    
}

-(void)refresh:(NSDictionary *)dic
{
//    NSURL *url = [NSURL URLWithString:@"https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_9458306670602662048%22%7D&n_type=0&p_from=1"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
    if ([self.html isEqualToString:dic[@"title"]]) {
        return;
    }
     self.isFinished = NO;
    self.webView.hidden = YES;
    self.html = dic[@"title"];
    [self.webView loadHTMLString:dic[@"title"] baseURL:nil];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.webView.width = self.width - 30;
    self.webView.left = 15;
    self.webView.height = MAX(self.webView.scrollView.contentSize.height, 50);
    self.height = self.webView.height;
    self.webView.top = 0;
    self.webView.hidden = !self.isFinished;
}


@end
