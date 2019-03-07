//
//  JYSoonAskTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYSoonAskTableViewCell.h"
#import "UIView+JYLayerEdit.h"
#import "UIButton+JYStyle.h"
@interface JYSoonAskTableViewCell()
@property(nonatomic,strong)UIButton *btn;

@end
@implementation JYSoonAskTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.btn];
        [self.btn shadowColor:UIColorFromRGBA(0x000000, 0.1)];
    }
    return self;
}

-(UIButton *)btn
{
    if (!_btn) {
        _btn = [UIButton newBtn];
        [_btn setTitle:@"快速提问" forState:UIControlStateNormal];
        [_btn setTitleColor:UIColorFromRGB(0x525252) forState:UIControlStateNormal];
        _btn.backgroundColor = UIColorFromRGB(0xffffff);
        _btn.top = 3;
        _btn.width = UIScreenWidth - 35;
        _btn.left = 17.5;
        _btn.height = 44;
        [_btn allCorners:9];
        [_btn borderColor:UIColorFromRGB(0xe8e8e8) borderWidth:LineWidth];
        _btn.userInteractionEnabled = NO;
//        [_btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}






@end
