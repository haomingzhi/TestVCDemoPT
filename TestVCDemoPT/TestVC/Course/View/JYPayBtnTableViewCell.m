//
    //  PayBtnViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

    

@property(nonatomic,strong)UIButton *btn;
@end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.btn];
    }
    return self;
}

{
    [self.btn setTitle:dic[@"title"] forState:UIControlStateNormal];
    [self setNeedsLayout];
}

{
    [super layoutSubviews];
       _btn.height = 24;
    _btn.width = 160;
    _btn.top = 0;
    _btn.left = 0;

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