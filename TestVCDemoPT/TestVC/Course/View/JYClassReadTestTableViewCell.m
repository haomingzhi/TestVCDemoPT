//
    //  ClassReadTestViewController.m
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
    [self.contentView addSubview:self.detailLb];
    }
    return self;
}

{
    self.titleLb.text = dic[@"titleLb"];

    [self setNeedsLayout];
}

{
    [super layoutSubviews];
       _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;


    _detailLb.width = 160;
    _detailLb.top = 0;
    _detailLb.left = 0;

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
    if (!_detailLb) {
    _detailLb = [UILabel new];
    _detailLb.height = 24;
    _detailLb.width = 160;
    _detailLb.top = 0;
    _detailLb.left = 0;
    }
    return _detailLb;
}
@end