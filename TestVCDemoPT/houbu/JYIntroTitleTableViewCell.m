//
    //  IntroTitleViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

    

@property(nonatomic,strong)UILabel *titleLb;
@end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.titleLb];
    }
    return self;
}

{
    self.titleLb.text = dic[@"title"];
    [self setNeedsLayout];
}

{
    [super layoutSubviews];
   
    _titleLb.top = 15;
    _titleLb.left = 15;

}

{
    if (!_titleLb) {
    _titleLb = [UILabel new];
    _titleLb.height = 16;
    _titleLb.width = 260;
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = UIColorFromRGB(0x333333);
    _titleLb.top = 0;
    _titleLb.left = 0;
    }
    return _titleLb;
}
@end