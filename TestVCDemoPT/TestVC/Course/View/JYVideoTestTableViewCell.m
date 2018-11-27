//
    //  VideoTestViewController.m
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
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.countLb];
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


    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;


    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;

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
    if (!_titleLb) {
    _titleLb = [UILabel new];
    _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;
    }
    return _titleLb;
}

{
    if (!_countLb) {
    _countLb = [UILabel new];
    _countLb.height = 24;
    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;
    }
    return _countLb;
}
@end