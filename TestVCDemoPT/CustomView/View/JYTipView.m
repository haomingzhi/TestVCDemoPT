//
//  JYTipView.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTipView.h"
#import "UILabel+JYStyle.h"
#import "UIView+JYLayerEdit.h"
@interface JYTipView()
@property(nonatomic,strong)UIView *v;
@property(nonatomic,strong)UILabel *titleLb;
@end

@implementation JYTipView
-(id)init
{
    self = [super init];
    if(self)
    {
        [self addSubview:self.v];
        [self addSubview:self.titleLb];
    }
    return self;
}

-(UIView *)v
{
    if (!_v) {
        _v = [UIView new];
        _v.height = 7;
        _v.width = 7;
        _v.backgroundColor = UIColorFromRGB(0xFED935);
        [_v allCorners:_v.height/2.0];
    }
    return _v;
}

-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel newLabel];
        _titleLb.font = [UIFont systemFontOfSize:11];
        _titleLb.textColor = UIColorFromRGB(0x525252);
        if (UIScreenWidth == 320) {
                _titleLb.font = [UIFont systemFontOfSize:10];
        }
        _titleLb.width = 200;
        _titleLb.height = 15;
    }
    return _titleLb;
}


+(JYTipView *)newTipView:(NSString *)title
{
    JYTipView *v = [JYTipView new];
    v.titleLb.text = title;
    [v.titleLb resetSize];
    [v setNeedsLayout];
    return v;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _v.left = 0;
    _v.top = 3;
    
    _titleLb.left = 4 + _v.left + _v.width;
    
    self.height = 15;
    self.width = _v.width + 4 + _titleLb.width + 3;
}

@end
