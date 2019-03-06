//
//  JYSearchTipTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYSearchTipTableViewCell.h"
#import "JYTipView.h"
#import "UIView+JYLayerEdit.h"
#import "UIButton+JYStyle.h"
@interface JYSearchTipTableViewCell()
@property(nonatomic,strong)JYTipView *tipAV;
@property(nonatomic,strong)JYTipView *tipBV;
@property(nonatomic,strong)JYTipView *tipCV;
@end
@implementation JYSearchTipTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.tipAV];
           [self.contentView addSubview:self.tipBV];
            [self.contentView addSubview:self.tipCV];
    }
    return self;
}

-(JYTipView *)tipAV
{
    if (!_tipAV) {
        _tipAV = [JYTipView newTipView:@"专业导师快速应答"];
        _tipAV.left = 17.5;
        _tipAV.top = 10;
    }
    return _tipAV;
}

-(JYTipView *)tipBV
{
    if (!_tipBV) {
        _tipBV = [JYTipView newTipView:@"隐私保障，更放心"];
        _tipBV.left = _tipAV.left + _tipAV.width + 16;
        _tipBV.top = 10;
    }
    return _tipBV;
}

-(void)refresh:(NSDictionary *)dic;
{
    [self setNeedsLayout];
}

-(JYTipView *)tipCV
{
    if (!_tipCV) {
        _tipCV = [JYTipView newTipView:@"专家定期跟踪回访"];
        _tipCV.left = _tipBV.left + _tipBV.width + 16;
        _tipCV.top = 10;
    }
    return _tipCV;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _tipAV.left = 17.5;
    _tipAV.top = 10;
    
    _tipBV.left = _tipAV.left + [self getStringSize:@"专业导师快速应答"].width + 16 + 14;
    _tipBV.top = 10;
    
    _tipCV.left = _tipBV.left + [self getStringSize:@"隐私保障，更放心"].width + 16 + 14;
    _tipCV.top = 10;
}

-(CGSize)getStringSize:(NSString *)str
{
    NSString *cc = str;
    
    NSMutableDictionary *tattrDict = [NSMutableDictionary dictionary];
    tattrDict[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    CGSize ccsz = [cc boundingRectWithSize:CGSizeMake(UIScreenWidth, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:tattrDict context:nil].size;
    return ccsz;
}


@end
