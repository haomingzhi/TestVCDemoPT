//
//  JYImgTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYImgTableViewCell.h"
#import "UIView+JYLayerEdit.h"
//#import "FLAnimatedImageView+WebCache.h"
#import "UIImageView+WebCache.h"
@interface JYImgTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UIView *shapeView;
@end

@implementation JYImgTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgV];
        [self.contentView addSubview:self.shapeView];
    }
    return self;
}

-(UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [UIImageView new];
        _imgV.width = UIScreenWidth;
        _imgV.height = 160/375.0 * UIScreenWidth;
//        _imgV.backgroundColor = [UIColor blueColor];
    }
    return _imgV;
}

-(UIView *)shapeView
{
    if (!_shapeView) {
        _shapeView = [UIView new];
        _shapeView.width = UIScreenWidth;
        _shapeView.height = 15.5;
        [_shapeView allCornerButTwo:CornerTypeC withRadius:7];
        _shapeView.backgroundColor = UIColorFromRGB(0xffffff);
        _shapeView.top = _imgV.height - 15;
    }
    return _shapeView;
}

-(void)refresh:(NSDictionary *)dic
{
//    [ _imgV sd_setImageWithURL:[NSURL URLWithString:dic[@"img"]]] ;
    _imgV.contentMode = UIViewContentModeCenter;
    __weak typeof(self) weak_self = self;
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:dic[@"img"]] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image) {
            weak_self.imgV.contentMode = UIViewContentModeScaleToFill;
        }

    }];
    [self setNeedsLayout];
}
@end
