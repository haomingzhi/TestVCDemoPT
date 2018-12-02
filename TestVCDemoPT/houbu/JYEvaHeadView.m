//
//  JYEvaHeadView.m
//  TestVCDemoPT
//
//  Created by air on 2018/12/2.
//  Copyright © 2018年 wjy. All rights reserved.
//

#import "JYEvaHeadView.h"
#import "JYMStarView.h"
@interface JYEvaHeadView()
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)JYMStarView *starView;
@end
@implementation JYEvaHeadView

-(id)init
{
    self = [super init];
    if(self)
    {
        self.height = 50;
        self.width = UIScreenWidth;
        [self addSubview:self.starView];
           [self addSubview:self.titleLb];
        self.backgroundColor = UIColorFromRGB(0xffffff);
    }
    return self;
}

-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.height = 17;
        _titleLb.width = 160;
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.textColor = UIColorFromRGB(0x222222);
        _titleLb.centerY = self.height/2.0;
        _titleLb.left = 15;
        _titleLb.text = @"全部评价";
    }
    return _titleLb;
}

-(void)refresh:(NSDictionary *)dic
{
    [self.starView refresh:@{@"count":dic[@"star"]}];
}
-(JYMStarView *)starView
{
    if (!_starView) {
        _starView = [JYMStarView new];
        _starView.centerY = self.height/2.0;
        _starView.left = UIScreenWidth - 15 - _starView.width;
    }
    return _starView;
}
@end
