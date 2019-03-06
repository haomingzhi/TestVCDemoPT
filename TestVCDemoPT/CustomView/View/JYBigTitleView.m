//
//  JYBigTitleView.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYBigTitleView.h"
#import "UILabel+JYStyle.h"


@implementation JYBigTitleView

-(id)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.titleLb];
        [self addSubview:self.markV];
    }
    return self;
}

-(JYMarkView *)markV
{
    if (!_markV) {
        _markV = [JYMarkView newMarkView:0];//[UILabel newMarkStyleLabel:@"强力推荐"];
    }
    return _markV;
}

-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel newTitleLb:@""];
        _titleLb.font = [UIFont boldSystemFontOfSize:18];
    }
    return _titleLb;
}

+(JYBigTitleView *)newTitleView:(NSString *)str;
{
    JYBigTitleView *v = [JYBigTitleView new];
    v.titleLb.text = str;
    v.titleLb.width = UIScreenWidth - 35;
    v.titleLb.height = 30;
    [v.titleLb sizeToFit];
    v.titleLb.top = 2;
    v.left = 17.5;
    v.top = 0;
    v.markV.top = 0;
    v.markV.left = v.titleLb.width + v.titleLb.left + 5;
    return v;
}

-(void)setTitle:(NSString *)str
{
    self.titleLb.text = str;
    self.titleLb.width = UIScreenWidth - 35;
    self.titleLb.height = 30;
    [self.titleLb sizeToFit];
    self.left = 17.5;
    self.top = 0;
    self.markV.top = 0;
    self.markV.left = self.titleLb.width + self.titleLb.left + 5;
    _title = str;
}

-(void)setMarks:(NSArray *)marks
{
    self.markV.titleArr = marks;
    _marks = marks;
}

@end
