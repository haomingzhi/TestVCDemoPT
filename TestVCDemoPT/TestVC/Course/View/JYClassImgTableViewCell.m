//
    //  ClassImgViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

    

@property(nonatomic,strong)UIImageView *imgV;

@end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.btn];
    }
    return self;
}

{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];

    [self setNeedsLayout];
}

{
    [super layoutSubviews];
       _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;


    _btn.width = 160;
    _btn.top = 0;
    _btn.left = 0;

}

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

{
    if (!_btn) {
    _btn = [UIButton new];
    _btn.height = 24;
    _btn.width = 160;
    _btn.top = 0;
    _btn.left = 0;
    }
    return _btn;
}
@end