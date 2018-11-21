//
//  imageBtn.m
//  校园在线
//
//  Created by 游 on 2018/5/4.
//  Copyright © 2018年 游. All rights reserved.
//

#import "imageBtn.h"
#import "UIView+shotMethod.h"

@implementation imageBtn

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int imageWidth = 20;
    int imageHegith = 20;
    
    //修改图片的坐标和大小
    self.imageView.frame = CGRectMake(10, (self.YTheight - imageHegith) / 2, imageWidth, imageHegith);
}

@end
