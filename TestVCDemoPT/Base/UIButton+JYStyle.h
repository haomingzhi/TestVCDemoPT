//
//  UIButton+JYStyle.h
//  QQBtn
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019 WJY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JYStyle)
+(void)createBtns:(NSArray *)arr withBtnsArr:(NSMutableArray *)btnArr withSuperView:(UIView *)supview withSel:(SEL)sel;

+(UIButton *)newBtn;

+(UIButton *)newStyleBtn:(NSString *)text;

+(UIButton *)newFindTeacherBtn;

+(UIButton *)newAskBtn;

+(UIButton *)newZxKfBtn;

+(UIButton *)newNavShareBtn:(NSInteger)type;

+(UIButton *)newNavBackBtn:(NSInteger)type;
-(void)setCommentBtn:(NSInteger)count;
+(UIButton *)newCommentBtn:(NSInteger)count;
+(UIButton *)newMoreBtn:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
