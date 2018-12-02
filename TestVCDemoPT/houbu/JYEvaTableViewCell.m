//
    //  EvaViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

    #import "JYStarView.h"

@property(nonatomic,strong)UIView *containerView;



@property(nonatomic,strong)JYStarView *starView;
@end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.containerView];
    [self.containerView addSubview:self.imgV];
    [self.containerView addSubview:self.nameLb];
    [self.containerView addSubview:self.timeLb];
    [self.containerView addSubview:self.contentLb];
           [self.containerView addSubview:self.starView];
    }
    return self;
}

{
    



  [self.starView refresh:@{@"count":dic[@"star"]}];
    [self setNeedsLayout];
}

{
    [super layoutSubviews];
   
    _containerView.top = 0;
    _containerView.left = 15;


    _imgV.top = 16;
    _imgV.left = 16;


    _nameLb.top = 17;
    _nameLb.left = 16 + _imgV.width + _imgV.left;

    _starView.left = _nameLb.left;
    _starView.top = 10 + _nameLb.top + _nameLb.height;

    _timeLb.top = 20;
    _timeLb.left = self.containerView.width - 15 - _timeLb.width;


    _contentLb.top = 15 + _imgV.height + _imgV.top;
    _contentLb.left = 15;
    [_contentLb sizeToFit];
}

{
    if (!_containerView) {
    _containerView = [UIView new];
    _containerView.height = 146;
    _containerView.width = UIScreenWidth - 30;
        _containerView.layer.cornerRadius = 6;
                _containerView.layer.masksToBounds = true;
                _containerView.layer.borderWidth = 0.5;
                _containerView.layer.borderColor = UIColorFromRGB(0xdcdcdc).CGColor;
    _containerView.top = 0;
    _containerView.left = 0;
    }
    return _containerView;
}

{
    if (!_imgV) {
    _imgV = [UIImageView new];
    _imgV.height = 40;
    _imgV.width = 40;
    _imgV.top = 0;
    _imgV.left = 0;
    }
    return _imgV;
}

{
    if (!_nameLb) {
    _nameLb = [UILabel new];
    _nameLb.height = 16;
    _nameLb.width = 160;
        _nameLb.font = [UIFont systemFontOfSize:15];
        _nameLb.textColor = UIColorFromRGB(0x333333);
    _nameLb.top = 0;
    _nameLb.left = 0;
    }
    return _nameLb;
}

{
    if (!_timeLb) {
    _timeLb = [UILabel new];
    _timeLb.height = 14;
    _timeLb.width = 120;
        _timeLb.font = [UIFont systemFontOfSize:13];
        _timeLb.textColor = UIColorFromRGB(0x666666);
        _timeLb.textAlignment = NSTextAlignmentRight;
    _timeLb.top = 0;
    _timeLb.left = 0;
    }
    return _timeLb;
}

{
    if (!_contentLb) {
    _contentLb = [UILabel new];
    _contentLb.height = 1000000;
    _contentLb.width = UIScreenWidth - 60;
        _contentLb.numberOfLines = 0;
        _contentLb.lineBreakMode = NSLineBreakByCharWrapping;
        _contentLb.font = [UIFont systemFontOfSize:13];
        _contentLb.textColor = UIColorFromRGB(0x666666);
    _contentLb.top = 0;
    _contentLb.left = 0;
    }
    return _contentLb;
}

-(JYStarView *)starView
{
    if (!_starView) {
        _starView = [JYStarView new];
        _starView.infoHidden = YES;
    }
    return _starView;
}


@end