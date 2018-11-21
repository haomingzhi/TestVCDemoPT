//
//  JYOrderTabBar.m
//  DDZX_js
//
//  Created by apple on 2018/11/20.
//  Copyright © 2018 wjy. All rights reserved.
//

#import "JYOrderTabBar.h"
//#import "UIView+NTES.h"
//#import "DDZXConfig.h"

@interface JYOrderTabBar()
@property(nonatomic,strong)UIButton *tabABtn;
@property(nonatomic,strong)UIButton *tabBBtn;
@property(nonatomic,strong)UIButton *tabCBtn;
@property(nonatomic,strong)UIButton *tabDBtn;
@property(nonatomic,strong)UILabel *checkLineLb;
@property(nonatomic,strong)UILabel *lineLb;
@end
@implementation JYOrderTabBar

-(id)init
{
    self = [super init];
    if(self)
    {
        [self addSubview:self.checkLineLb];
        [self addSubview:self.tabABtn];
        [self addSubview:self.tabBBtn];
        [self addSubview:self.tabCBtn];
           [self addSubview:self.tabDBtn];
        self.height = 36;
        self.width = UIScreenWidth;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.lineLb];
        //        _checkLineTop = -1;
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self addSubview:self.checkLineLb];
        [self addSubview:self.tabABtn];
        [self addSubview:self.tabBBtn];
        [self addSubview:self.tabCBtn];
          [self addSubview:self.tabDBtn];
        self.height = 36;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.lineLb];
        //        _checkLineTop = -1;
    }
    return self;
    
}

-(void)setTitles:(NSArray *)titles
{
    _titles = titles;
    if(titles.count > 0)
    {
        [_tabABtn setTitle:titles[0] forState:UIControlStateNormal];
        if(_titles.count > 1)
        {
            [_tabBBtn setTitle:titles[1] forState:UIControlStateNormal];
            if (_titles.count > 2) {
                [_tabCBtn setTitle:titles[2] forState:UIControlStateNormal];
                if (_titles.count > 3) {
                    [_tabDBtn setTitle:titles[3] forState:UIControlStateNormal];
                }
            }
        }
    }
}
-(void)layoutSubviews
{
    //    if (self.layoutTabA.bottom !=0)
    //    {
    //        self.tabABtn.width = self.layoutTabA.bottom;
    //    }
    //    else
    //    {
    //        self.tabABtn.width = 66;
    //    }
    //
    //    if (self.layoutTabB.bottom !=0)
    //    {
    //        self.tabBBtn.width = self.layoutTabB.bottom;
    //    }
    //    else
    //    {
    //        self.tabBBtn.width = 66;
    //    }
    //
    //    if (self.layoutTabC.bottom !=0)
    //    {
    //        self.tabCBtn.width = self.layoutTabC.bottom;
    //    }
    //    else
    //    {
    //        self.tabCBtn.width = 66;
    //    }
    //
    //    if (self.layoutTabA.right !=0)
    //    {
    //        self.tabABtn.height = self.layoutTabA.right;
    //    }
    //    else
    //    {
    //        self.tabABtn.height = 23;
    //    }
    //
    //    if (self.layoutTabB.right !=0)
    //    {
    //        self.tabBBtn.height = self.layoutTabB.right;
    //    }else
    //    {
    //        self.tabBBtn.height = 23;
    //    }
    //
    //    if (self.layoutTabC.right !=0)
    //    {
    //        self.tabCBtn.height = self.layoutTabC.right;
    //    }else
    //    {
    //        self.tabCBtn.height = 23;
    //    }
    
    self.tabABtn.left = 15;
    self.tabABtn.top = 8;
    
    self.tabBBtn.centerX = UIScreenWidth/2.0 - 45;
    self.tabBBtn.top = self.tabABtn.top;
    
    self.tabCBtn.centerX = UIScreenWidth/2.0 + 45;
    self.tabCBtn.top = self.tabABtn.top;
    
    self.tabDBtn.left = UIScreenWidth - 15 - self.tabDBtn.width;
    self.tabDBtn.top = self.tabABtn.top;
    
    if(self.checkIndex == 0)
    {
        [_tabABtn setTitleColor:UIColorFromRGB(0x3A424D) forState:UIControlStateNormal];
        [_tabBBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        [_tabCBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
         [_tabDBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        _checkLineLb.left = _tabABtn.left + 1;
        _checkLineLb.width = _tabABtn.width - 2;
    }
    else if(self.checkIndex == 1)
    {
        [_tabABtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        [_tabBBtn setTitleColor:UIColorFromRGB(0x3A424D) forState:UIControlStateNormal];
        [_tabCBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
         [_tabDBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        _checkLineLb.left = _tabBBtn.left + 1;
        _checkLineLb.width = _tabBBtn.width - 2;
    }
    else if(self.checkIndex == 2)
    {
        [_tabCBtn setTitleColor:UIColorFromRGB(0x3A424D) forState:UIControlStateNormal];
        [_tabBBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        [_tabABtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
         [_tabDBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        _checkLineLb.left = _tabCBtn.left + 1;
        _checkLineLb.width = _tabCBtn.width - 2;
    }
    else if(self.checkIndex == 3)
    {
        [_tabCBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        [_tabBBtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        [_tabABtn setTitleColor:UIColorFromRGB(0xA2A3A7) forState:UIControlStateNormal];
        [_tabDBtn setTitleColor:UIColorFromRGB(0x3A424D) forState:UIControlStateNormal];
        _checkLineLb.left = _tabDBtn.left + 1;
        _checkLineLb.width = _tabDBtn.width - 2;
    }
    if (_checkLineTop == -1) {
        _checkLineLb.top = _tabABtn.top + _tabABtn.height + 2;
    }
    else
    {
        _checkLineLb.top = _tabABtn.top + _tabABtn.height + _checkLineTop;
    }
    _lineLb.top = self.height - 0.5;
}


-(UILabel *)checkLineLb
{
    if(!_checkLineLb)
    {
        _checkLineLb = [[UILabel alloc] initWithFrame:CGRectZero];
        _checkLineLb.backgroundColor = _checkLineColor?: UIColorFromRGB(0x8B80F1);
        _checkLineLb.height = 3;
        _checkLineLb.width = 60;
        _checkLineLb.layer.cornerRadius = 1.5;
        _checkLineLb.layer.masksToBounds = YES;
    }
    return _checkLineLb;
}

-(UILabel *)lineLb
{
    if(!_lineLb)
    {
        _lineLb = [[UILabel alloc] initWithFrame:CGRectZero];
        _lineLb.backgroundColor = UIColorFromRGB(0xf5f5f5);
        _lineLb.height = 0.5;
        _lineLb.width = UIScreenWidth;
    }
    return _lineLb;
}

-(UIButton *)tabDBtn
{
    if(!_tabDBtn)
    {
        _tabDBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        _tabDBtn.tag = 103;
        _tabDBtn.width = 64;
        _tabDBtn.height = 24;
        [_tabDBtn setTitleColor:UIColorFromRGB(0x505050) forState:UIControlStateNormal];
        _tabDBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_tabDBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tabDBtn;
}

-(UIButton *)tabCBtn
{
    if(!_tabCBtn)
    {
        _tabCBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        _tabCBtn.tag = 102;
        _tabCBtn.width = 64;
        _tabCBtn.height = 24;
        [_tabCBtn setTitleColor:UIColorFromRGB(0x505050) forState:UIControlStateNormal];
        _tabCBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_tabCBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tabCBtn;
}

-(UIButton *)tabBBtn
{
    if(!_tabBBtn)
    {
        _tabBBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        _tabBBtn.tag = 101;
        _tabBBtn.width = 60;
        _tabBBtn.height = 24;
        [_tabBBtn setTitleColor:UIColorFromRGB(0x505050) forState:UIControlStateNormal];
        _tabBBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_tabBBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tabBBtn;
}

-(UIButton *)tabABtn
{
    if(!_tabABtn)
    {
        _tabABtn = [[UIButton alloc] initWithFrame:CGRectZero];
        _tabABtn.tag = 100;
        _tabABtn.width = 64;
        _tabABtn.height = 24;
        [_tabABtn setTitleColor:UIColorFromRGB(0x505050) forState:UIControlStateNormal];
        _tabABtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_tabABtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tabABtn;
}

-(void)onClick:(UIButton *)btn
{
    if(btn.tag == 100)
    {
        self.checkIndex = 0;
        
    }
    else  if(btn.tag == 101)
    {
        self.checkIndex = 1;
    }
    else  if(btn.tag == 102)
    {
        self.checkIndex = 2;
    }
    else
    {
        self.checkIndex = 3;
    }
    if (_callBack) {
        _callBack(@{@"tag":@(self.checkIndex)});
    }
    
}

-(void)setCheckIndex:(NSInteger)checkIndex
{
    _checkIndex = checkIndex;
    [self setNeedsLayout];
}

-(void)setCheckLineColor:(UIColor *)checkLineColor
{
    _checkLineColor = checkLineColor;
    _checkLineLb.backgroundColor = checkLineColor;
}

-(void)setCheckLineTop:(CGFloat)checkLineTop
{
    _checkLineTop = checkLineTop;
    [self setNeedsLayout];
}

-(void)setAFont:(UIFont *)aFont
{
    _tabABtn.titleLabel.font = aFont;
}

-(void)setBFont:(UIFont *)bFont
{
    _tabBBtn.titleLabel.font = bFont;
}

@end
