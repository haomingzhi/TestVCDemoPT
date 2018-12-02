//
//  JYDirectHeadView.m
//  TestVCDemoPT
//
//  Created by air on 2018/12/2.
//  Copyright © 2018年 wjy. All rights reserved.
//

#import "JYDirectHeadView.h"
@interface JYDirectHeadView()
@property(nonatomic,strong)UILabel *titleLb;

@property(nonatomic,strong)UIButton *btn;

@end

@implementation JYDirectHeadView
-(id)init
{
    self = [super init];
    if(self)
    {
        self.height = 41;
        self.width = UIScreenWidth;
        [self addSubview:self.titleLb];
        
        [self addSubview:self.btn];
        self.backgroundColor = UIColorFromRGB(0xffffff);
    }
    return self;
    
}
-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.height = 16;
        _titleLb.width = 260;
        _titleLb.centerY = self.height/2.0;
        _titleLb.left = 15;
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = UIColorFromRGB(0x222222);
    }
    return _titleLb;
}

-(void)setTitle:(NSString *)title
{
    _titleLb.text = title;
    _title = title;
}

-(UIButton *)btn
{
    if (!_btn) {
        _btn = [UIButton new];
        _btn.height = 30;
        _btn.width = 30;
        _btn.centerY = self.height/2.0;
        _btn.left = UIScreenWidth - 10 -_btn.width;
        [_btn setImage:[UIImage imageNamed:@"上"] forState:UIControlStateNormal];
    }
    return _btn;
}


@end
