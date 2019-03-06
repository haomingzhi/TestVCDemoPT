//
//  DDExNoDataView.m
//  NIM
//
//  Created by apple on 2018/7/26.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "DDExNoDataView.h"
#import "UIView+JYExFrame.h"
//#import "DDExKitConfig.h"
@interface DDExNoDataView()


@end

@implementation DDExNoDataView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imgV];
        [self addSubview:self.stateLb];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)layoutSubviews
{
   
    
    
    _imgV.layer.cornerRadius = _imgV.height/2.0;
    _imgV.centerX = UIScreenWidth * .5f;
    
    _stateLb.height = 24;
    _stateLb.width = UIScreenWidth - 36;
    _stateLb.top = _imgV.top + _imgV.height + 18;
    _stateLb.left = 18;
    _stateLb.textAlignment = NSTextAlignmentCenter;
    
}

-(void)setTip:(NSString *)tip
{
    _stateLb.text = tip;
}

-(NSString *)tip
{
    return _stateLb.text;
}

-(UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [UIImageView new];
        _imgV.image = [UIImage imageNamed:@"空白页表情"];
        _imgV.top = 93;
        _imgV.width = 120;
        _imgV.height = 120;
        _imgV.top = 43;
    }
    return _imgV;
}

-(UILabel *)stateLb
{
    if (!_stateLb) {
        _stateLb = [UILabel new];
        _stateLb.text = @"暂无数据";
        _stateLb.textColor = UIColorFromRGB(0xA2A3A7);
        _stateLb.font = [UIFont systemFontOfSize:17];
        
    }
    return _stateLb;
}
@end
