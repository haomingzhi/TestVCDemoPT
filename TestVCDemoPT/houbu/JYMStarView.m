//
//  JYMStarView.m
//  TestVCDemoPT
//
//  Created by air on 2018/12/2.
//  Copyright © 2018年 wjy. All rights reserved.
//

#import "JYMStarView.h"
@interface JYMStarView()
@property(nonatomic,strong)UIImageView *aaImgV;

@property(nonatomic,strong)UIImageView *bbImgV;

@property(nonatomic,strong)UIImageView *ccImgV;

@property(nonatomic,strong)UIImageView *ddImgV;

@property(nonatomic,strong)UIImageView *eeImgV;

@property(nonatomic,strong)UILabel *iinfoLb;
@end
@implementation JYMStarView

-(id)init
{
    self = [super init];
    if(self)
    {
        self.height = 21;
        self.width = 192;
        self.aaImgV = [self valueForKey:@"aImgV"];
        self.bbImgV = [self valueForKey:@"bImgV"];
        self.ccImgV = [self valueForKey:@"cImgV"];
        self.ddImgV = [self valueForKey:@"dImgV"];
        self.eeImgV = [self valueForKey:@"eImgV"];
        self.iinfoLb = [self valueForKey:@"infoLb"];
        self.iinfoLb.textColor = UIColorFromRGB(0x999999);
        self.iinfoLb.font = [UIFont systemFontOfSize:16];
        self.iinfoLb.width = 43;
    }
    return self;
    
}

-(void)refresh:(NSDictionary *)dic
{
    self.iinfoLb.text = [NSString stringWithFormat:@"%@星",dic[@"count"]];
    NSInteger count = [dic[@"count"] integerValue];
    for (NSInteger i = 0; i < count; i++) {
        UIImageView *imv = [self viewWithTag:100 + i];
        imv.height = 19;
        imv.width = 20;
        imv.highlighted = YES;
    }
    for (NSInteger i = count ;i< 5; i ++) {
        UIImageView *imv = [self viewWithTag:100 + i];
        imv.height = 19;
        imv.width = 20;
        imv.highlighted = NO;
    }
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _aaImgV.top = 1;
    _aaImgV.left = 55;
    
    _bbImgV.top = 1;
    _bbImgV.left = 10 + _aaImgV.width + _aaImgV.left;
    
    _ccImgV.top = 1;
    _ccImgV.left = 10 + _bbImgV.width + _bbImgV.left;
    
    _ddImgV.top = 1;
    _ddImgV.left = 10 + _ccImgV.width + _ccImgV.left;
    
    _eeImgV.top = 1;
    _eeImgV.left = 10 + _ddImgV.width + _ddImgV.left;
    _iinfoLb.left = 0;
    _iinfoLb.height = 19;
    _iinfoLb.top = 2;
}


@end
