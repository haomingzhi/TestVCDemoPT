//
//  NSMutableAttributedString+JYTool.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (JYTool)
-(void)addImg:(NSString *)img;
+(NSMutableAttributedString *)newImgAtt:(NSString *)img;
- (NSInteger)height:(NSString *)content withTextFontSize:(CGFloat)mFontSize;
@end

NS_ASSUME_NONNULL_END
