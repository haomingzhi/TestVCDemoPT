//
//  JYTitleView.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTitleView.h"
#import "UILabel+JYStyle.h"
@implementation JYTitleView

-(id)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.titleLb];
        self.backgroundColor = UIColorFromRGB(0xffffff);
    }
    return self;
}

-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel newTitleLb:@""];
//        _titleLb.font = [UIFont boldSystemFontOfSize:17];
//        _titleLb.textColor = UIColorFromRGB(0x333333);
    }
    return _titleLb;
}
+(JYTitleView *)newTitleView:(NSString *)str;
{
    JYTitleView *v = [JYTitleView new];
    v.titleLb.text = str;
//    v.titleLb.width = UIScreenWidth - 35;
//    v.titleLb.height = 30;
  
  [v.titleLb resetSize];
    v.left = 17.5;
    v.top = 17;
    return v;
}
-(void)setTitle:(NSString *)str
{
    self.titleLb.text = str;
//    self.titleLb.width = UIScreenWidth - 35;
//    self.titleLb.height = 30;
    [self.titleLb resetSize];
//    self.left = 17.5;
//    self.top = 0;

    _title = str;
}
@end
