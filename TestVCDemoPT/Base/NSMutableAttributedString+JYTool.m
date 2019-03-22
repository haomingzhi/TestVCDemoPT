//
//  NSMutableAttributedString+JYTool.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "NSMutableAttributedString+JYTool.h"

@implementation NSMutableAttributedString (JYTool)

- (NSInteger)height:(NSString *)content withTextFontSize:(CGFloat)mFontSize
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = 10;  // 段落高度
    
    NSMutableAttributedString *attributes = [[NSMutableAttributedString alloc] initWithString:content];
    
    [attributes addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:mFontSize] range:NSMakeRange(0, content.length)];
    [attributes addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, content.length)];
    
    CGSize attSize = [attributes boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
    return attSize.height;
}

+(NSMutableAttributedString *)newImgAtt:(NSString *)img
{
    NSTextAttachment *imgAtt = [[NSTextAttachment alloc] init];
    imgAtt.image = [UIImage imageNamed:img];
    imgAtt.bounds = CGRectMake(0, 0, 20, 20);
    NSAttributedString *attstr = [NSAttributedString attributedStringWithAttachment:imgAtt];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithAttributedString:attstr];
    return att;
}

-(void)addImg:(NSString *)img
{
    NSTextAttachment *imgAtt = [[NSTextAttachment alloc] init];
    imgAtt.image = [UIImage imageNamed:img];
    NSAttributedString *attstr = [NSAttributedString attributedStringWithAttachment:imgAtt];
    [self appendAttributedString:attstr];
}
@end
