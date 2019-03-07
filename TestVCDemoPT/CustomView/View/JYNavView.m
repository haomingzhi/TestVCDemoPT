//
//  JYNavView.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYNavView.h"
#import "UILabel+JYStyle.h"
#import "UIButton+JYStyle.h"
@implementation JYNavView

 -(id)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.leftV];
         [self addSubview:self.titleV];
         [self addSubview:self.rightV];
        self.width = UIScreenWidth;
        self.height = NavHeight;
    }
    return self;
}
-(void)setNavLeftView:(UIView *)lv
{
    lv.left = Padding - 0.5;
    lv.top = StateHeight + 22 - lv.height/2.0;
    self.leftV = lv;
        [self addSubview:self.leftV];
}

-(void)setNavRightView:(UIView *)rv
{
    rv.left = self.width - Padding - rv.width - 0.5;
    rv.top = StateHeight + 22 - rv.height/2.0;
    self.rightV = rv;

    [self addSubview:self.rightV];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    if ([self.titleV isKindOfClass:[UILabel class]]) {
        UILabel *lb = (UILabel *)self.titleV;
        lb.text = title;
    }
}

-(UIButton *)setNavLeftBtnImg:(NSString *)img
{
    UIButton *btn = [UIButton newBtn];
    btn.width = 30;
    btn.height = 30;
    [btn setTitle:@"" forState:UIControlStateNormal];
 
        [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [self setNavLeftView:btn];
    return btn;
}
-(UIButton *)setNavLeftBtn
{
    UIButton *btn = [UIButton newNavBackBtn:0];
    [self setNavLeftView:btn];
    return btn;
}

-(UIButton *)setNavRightBtnImg:(NSString *)img
{
    UIButton *btn = [UIButton newBtn];
    btn.width = 30;
    btn.height = 30;
    [btn setTitle:@"" forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [self setNavRightView:btn];
    return btn;
}

-(UIButton *)setNavRightBtn
{
    UIButton *btn = [UIButton newNavShareBtn:0];
    [self setNavRightView:btn];
    return btn;
}

+(JYNavView *)newNavView:(NSString *)title
{
    JYNavView *v = [JYNavView new];
    v.titleV = [UILabel newNavTitleLb:title];
    v.titleV.left = v.width/2.0 - v.titleV.width/2.0;
    v.titleV.top = StateHeight + 22 - v.titleV.height/2.0;
    [v addSubview:v.titleV];
 
    return v;
}

-(UIView *)leftV
{
    if (!_leftV) {
        _leftV = [UIView new];
    }
    return _leftV;
}

-(UIView *)titleV
{
    if (!_titleV) {
        _titleV = [UIView new];
    }
    return _titleV;
}

-(UIView *)rightV
{
    if (!_rightV) {
        _rightV = [UIView new];
    }
    return _rightV;
}

@end
