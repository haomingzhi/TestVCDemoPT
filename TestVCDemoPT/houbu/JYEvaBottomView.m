//
//  JYEvaBottomView.m
//  TestVCDemoPT
//
//  Created by air on 2018/12/2.
//  Copyright © 2018年 wjy. All rights reserved.
//

#import "JYEvaBottomView.h"

@interface JYEvaBottomView()
@property(nonatomic,strong)UIButton *editBtn;

@property(nonatomic,strong)UIButton *btn;

@end


@implementation JYEvaBottomView

-(UIButton *)editBtn
{
    if (!_editBtn) {
        _editBtn = [UIButton new];
        _editBtn.height = 25;
        _editBtn.width = 24;
        _editBtn.centerY = self.height/2.0;
        _editBtn.left = 15;
        [_editBtn setImage:[UIImage imageNamed:@"评价(1)"] forState:UIControlStateNormal];
    }
    return _editBtn;
}

-(id)init
{
    self = [super init];
    if(self)
    {
        self.height = 66;
        self.width = UIScreenWidth;
        [self addSubview:self.editBtn];
        
        [self addSubview:self.btn];
        
    }
    return self;
}

-(UIButton *)btn
{
    if (!_btn) {
        _btn = [UIButton new];
        _btn.height = 41;
        _btn.width = 251;
        _btn.top = 13;
        _btn.left = UIScreenWidth - 15 - _btn.width;
        _btn.layer.cornerRadius = _btn.height/2.0;
        _btn.layer.masksToBounds = YES;
        _btn.backgroundColor = UIColorFromRGB(0x8b80f1);
        [_btn setTitleColor:UIColorFromRGB(0xf6f6f6) forState:UIControlStateSelected];
        _btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_btn setTitle:@"继续测试" forState:UIControlStateNormal];
    }
    return _btn;
}

@end
