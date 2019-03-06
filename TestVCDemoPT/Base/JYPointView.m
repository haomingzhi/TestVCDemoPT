//
//  JYPointView.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYPointView.h"

@interface JYPointView()
@property(nonatomic,strong)NSMutableArray *imgVArr;
@end

@implementation JYPointView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)init
{
    self = [super init];
    if (self) {
        self.width = 80;
        self.height = 12;
        self.imgVArr = [NSMutableArray new];
        [self createImgVs];
    }
    return self;
}

-(void)createImgVs
{
    for (NSInteger i = 0; i < 5; i ++) {
        UIImageView *imgv = [UIImageView new];
        imgv.tag = 100 + i;
        imgv.width = 11.75;
        imgv.height = 10.4;
        imgv.left = 1 + i * (imgv.width + 5.25);
        imgv.top = 1;
        imgv.image = [UIImage imageNamed:@"已点赞"];
        [self addSubview:imgv];
        [self.imgVArr addObject:imgv];
    }
}

+(JYPointView *)newPointView:(NSInteger)point
{
    JYPointView *p = [JYPointView new];
    p.point = point;
    return p;
}

-(void)setPoint:(NSInteger)point
{
    _point = point;
    NSInteger c = 5 - point;
    for (NSInteger i = 0; i < 5; i++) {
         UIImageView *iv = _imgVArr[i];
        if (i < c) {
            iv.hidden = YES;
        }
        else
        {
            iv.hidden = NO;
        }
    }
}

@end
