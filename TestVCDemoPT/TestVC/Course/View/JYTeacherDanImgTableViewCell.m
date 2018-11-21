//
    //  TeacherDanImgViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYTeacherDanImgTableViewCell.h"
    
@interface JYTeacherDanImgTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@end
@implementation JYTeacherDanImgTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;

}
-(UIImageView *)imgV
{
    if (!_imgV) {
    _imgV = [UIImageView new];
    _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;
    }
    return _imgV;
}
@end