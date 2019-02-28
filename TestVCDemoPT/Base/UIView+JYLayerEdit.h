//
//  UIView+JYLayerEdit.h
//  QQBtn
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, CornerType) {
    CornerTypeA = 0,
    CornerTypeB,
    CornerTypeC,
    CornerTypeD
};
@interface UIView (JYLayerEdit)
@property(nonatomic,strong)CAShapeLayer *maskLayer;//面罩图层
@property(nonatomic,strong)CALayer *backgroundLayer;//背景图层



-(void)allCorners:(CGFloat)r;//圆角为r

-(void)allCornerButOne:(CornerType)n withRadius:(CGFloat)r;//只有一个是直角，其他是圆角 CornerTypeA是左上角是直角角，按顺时针位置依次是CornerTypeB，CornerTypeC，CornerTypeD

-(void)allCornerButTwo:(CornerType)n withRadius:(CGFloat)r;//只有两个是直角，其他是圆角 CornerTypeA是左上角和右上角是直角然后按顺时针变换位置位置依次是CornerTypeB，CornerTypeC，CornerTypeD

-(void)onlyOneCorner:(CornerType)n withRadius:(CGFloat)r;//只有一个圆角其他直角 CornerTypeA是左上角是圆角，按顺时针位置依次是CornerTypeB，CornerTypeC，CornerTypeD



-(void)gradientColor:(UIColor *)fromColor toColor:(UIColor *)toColor;//渐变颜色

-(void)gradientColor:(UIColor *)fromColor toColor:(UIColor *)toColor  locations:(NSArray *)locations;

-(void)gradientColors:(NSArray *)colors locations:(NSArray *)locations;//颜色渐变 colors数组是（id）cgcolor对象 locations是小数数值对象

-(void)gradientColors:(NSArray *)colors locations:(NSArray *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;//颜色渐变 colors数组是（id）cgcolor对象 locations是小数数值对象


-(void)borderColor:(UIColor *)color borderWidth:(CGFloat)w;//边框颜色 , 边框宽度

-(void)borderColor:(UIColor *)color;//边框颜色

-(void)borderWidth:(CGFloat)w;//边框宽度


-(void)shadowColor:(UIColor *)color;

-(void)shadowColor:(UIColor *)color shadowOffset:(CGSize )shadowOffset;

-(void)shadowColor:(UIColor *)color shadowOffset:(CGSize )shadowOffset shadowOpacity:(CGFloat)opacity;


-(UIBezierPath *)baseAnyCornerPath:(BOOL)ltC isRTC:(BOOL)rtC isRBC:(BOOL)lbC isLBC:(BOOL)rbC withRadius:(CGFloat)r;


-(void)setMaskLayerWithPath:(UIBezierPath *)path;


+ (UIView *)normalShadow:(UIView *)v;

+ (UIView *)normalShadow:(UIView *)v withShadowOffset:(CGSize)size;

+ (UIView *)normalShadow:(UIView *)v withShadowColor:(UIColor *)color;
-(void)refreshHView;
-(void)refreshVView;
-(void)jy_addVSubview:(UIView *)view;
-(void)jy_addHSubview:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
