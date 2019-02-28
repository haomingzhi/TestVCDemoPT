//
//  UIView+JYLayerEdit.m
//  QQBtn
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019 维尼的小熊. All rights reserved.
//

#import "UIView+JYLayerEdit.h"
#import <objc/runtime.h>

@implementation UIView (JYLayerEdit)
static void *maskLayerKey = &maskLayerKey;
static void *backgroundLayerKey = &backgroundLayerKey;
static void *borderLayerKey = &borderLayerKey;
static void *shadowLayerKey = &shadowLayerKey;
static void *contentHeightKey = &contentHeightKey;
static void *contentWidthXKey = &contentWidthXKey;
-(void)setMaskLayer:(CAShapeLayer *)maskLayer
{
    objc_setAssociatedObject(self, maskLayerKey, maskLayer, OBJC_ASSOCIATION_RETAIN);
    self.layer.mask = maskLayer;
    [self resetBorderLayer];
//    [self resetShadowLayer];
}

-(CAShapeLayer *)maskLayer
{
    return objc_getAssociatedObject(self, maskLayerKey);
}

-(CALayer*)backgroundLayer
{
    return objc_getAssociatedObject(self, backgroundLayerKey);
}

-(void)setBackgroundLayer:(CALayer *)backgroundLayer
{
     CALayer *ly = objc_getAssociatedObject(self, backgroundLayerKey);
    if (ly) {
        [ly removeFromSuperlayer];
       
    }
    objc_setAssociatedObject(self, backgroundLayerKey, backgroundLayer, OBJC_ASSOCIATION_RETAIN);
    [self.layer insertSublayer:backgroundLayer atIndex:0];
}

-(void)allCorners:(CGFloat)r
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:r];
//    CAShapeLayer *ly = [CAShapeLayer layer];
//    ly.fillColor = [UIColor whiteColor].CGColor;
//    ly.frame = self.bounds;
//    ly.path = path.CGPath;
//    [self setMaskLayer:ly];
      [self setMaskLayerWithPath:path];
//    self.layer.cornerRadius = r;
////    self.layer.borderWidth = 4;
//    self.layer.masksToBounds = YES;
}

-(void)borderWidth:(CGFloat)w
{
    CAShapeLayer *ly = objc_getAssociatedObject(self, borderLayerKey);
    if (!ly) {
        ly = [CAShapeLayer layer];
        ly.frame = self.bounds;
        objc_setAssociatedObject(self, borderLayerKey, ly, OBJC_ASSOCIATION_RETAIN);
    }
   
    ly.lineWidth = w;
//    ly.borderWidth = w;
//    ly.borderColor = [UIColor greenColor].CGColor;
    [self.layer addSublayer:ly];
}

-(void)borderColor:(UIColor *)color
{
    CAShapeLayer *ly = objc_getAssociatedObject(self, borderLayerKey);
    if (!ly) {
        ly = [CAShapeLayer layer];
        ly.frame = self.bounds;
        objc_setAssociatedObject(self, borderLayerKey, ly, OBJC_ASSOCIATION_RETAIN);
    }
    ly.strokeColor = color.CGColor;
    [self.layer addSublayer:ly];
}

-(void)borderColor:(UIColor *)color borderWidth:(CGFloat)w
{
    [self borderColor:color];
    [self borderWidth:w];
}

-(void)resetBorderLayer
{
    CAShapeLayer *ly = objc_getAssociatedObject(self, borderLayerKey);
    if (!ly) {
        ly = [CAShapeLayer layer];
        ly.frame = self.bounds;
        //    ly.path = self.maskLayer.path;
    }
//    CAShapeLayer *sl = [CAShapeLayer layer];
//    sl.frame = self.bounds;
//    sl.path = self.maskLayer.path;
//    ly.mask = sl;
//    ly.lineWidth = 3;
    ly.path = self.maskLayer.path;//ly.opaque = YES;
    ly.fillColor = [UIColor clearColor].CGColor;
//    ly
//    ly.strokeColor = [UIColor blackColor].CGColor;
    objc_setAssociatedObject(self, borderLayerKey, ly, OBJC_ASSOCIATION_RETAIN);
}

-(void)allCornerButOne:(CornerType)n withRadius:(CGFloat)r//只有一个是直角，其他是圆角
{
    UIBezierPath *path = [self baseCornerPath:n withRadius:r];
    [self setMaskLayerWithPath:path];
}

-(void)setMaskLayerWithPath:(UIBezierPath *)path
{
    CAShapeLayer *ly = [CAShapeLayer layer];
    ly.fillColor = [UIColor whiteColor].CGColor;
    ly.frame = self.bounds;
    ly.path = path.CGPath;
    [self setMaskLayer:ly];
}

-(UIBezierPath *)baseCornerPath:(CornerType)n withRadius:(CGFloat)r
{
     UIBezierPath *path = [UIBezierPath bezierPath];
//    if (n == 0) {
    NSInteger d = n == 0?0:1;
    [path moveToPoint:CGPointMake(r * d, 0)];
    d = n == 1?0:1;
    [path moveToPoint:CGPointMake(r * d, 0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width  - r * d, 0)];
    [path addArcWithCenter:CGPointMake( self.bounds.size.width  - r * d,  r * d) radius:r * d startAngle:-M_PI/2.0 endAngle:0 clockwise:YES];
    d = n == 2?0:1;
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - r * d)];
    [path addArcWithCenter:CGPointMake(self.bounds.size.width - r * d, self.bounds.size.height - r * d) radius:r * d startAngle:0 endAngle:M_PI/2.0 clockwise:YES];
    d = n == 3?0:1;
    [path addLineToPoint:CGPointMake(r * d, self.bounds.size.height)];
    [path addArcWithCenter:CGPointMake( r * d, self.bounds.size.height - r * d) radius:r * d startAngle:M_PI/2.0 endAngle:M_PI clockwise:YES];
    d = n == 0?0:1;
    [path addLineToPoint:CGPointMake(0, r * d)];
    [path addArcWithCenter:CGPointMake(r * d, r * d) radius:r * d startAngle:M_PI endAngle:M_PI/2.0 * 3 clockwise:YES];
    [path closePath];
//    }
    return path;
}

-(UIBezierPath *)baseTwoCornerPath:(CornerType)n withRadius:(CGFloat)r
{
    if (n == 0) {
        return [self baseAnyCornerPath:NO isRTC:NO isRBC:YES isLBC:YES withRadius:r];
    }
    else if(n == 1)
    {
        return [self baseAnyCornerPath:YES isRTC:NO isRBC:NO isLBC:YES withRadius:r];
    }
    else if(n == 2)
    {
        return [self baseAnyCornerPath:YES isRTC:YES isRBC:NO isLBC:NO withRadius:r];
    }
    else
    {
        return [self baseAnyCornerPath:NO isRTC:YES isRBC:YES isLBC:NO withRadius:r];
    }
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    //    if (n == 0) {
//    NSInteger d = n == 0?0:1;
//    [path moveToPoint:CGPointMake(r * d, 0)];
//    d = (n == 1)||(n == 0)?0:1;
//    [path addLineToPoint:CGPointMake(self.bounds.size.width  - r * d, 0)];
//    [path addArcWithCenter:CGPointMake( self.bounds.size.width  - r * d,  r * d) radius:r * d startAngle:-M_PI/2.0 endAngle:0 clockwise:YES];
//    d = (n == 1)||(n == 2)?0:1;
//    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - r * d)];
//    [path addArcWithCenter:CGPointMake(self.bounds.size.width - r * d, self.bounds.size.height - r * d) radius:r * d startAngle:0 endAngle:M_PI/2.0 clockwise:YES];
//    d = (n == 2)||(n == 3)?0:1;
//    [path addLineToPoint:CGPointMake(r * d, self.bounds.size.height)];
//    [path addArcWithCenter:CGPointMake( r * d, self.bounds.size.height - r * d) radius:r * d startAngle:M_PI/2.0 endAngle:M_PI clockwise:YES];
//    d = (n == 3)||(n == 0)?0:1;
//    [path addLineToPoint:CGPointMake(0, r * d)];
//    [path addArcWithCenter:CGPointMake(r * d, r * d) radius:r * d startAngle:M_PI endAngle:M_PI/2.0 * 3 clockwise:YES];
//    [path closePath];
    //    }
//    return path;
}

-(UIBezierPath *)baseAnyCornerPath:(BOOL)ltC isRTC:(BOOL)rtC isRBC:(BOOL)rbC isLBC:(BOOL)lbC withRadius:(CGFloat)r
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    NSInteger a = 0,b = 0,c = 0, d = 0;
    a = ltC?1:0;
    b = rtC?1:0;
    c = rbC?1:0;
    d = lbC?1:0;
    [path moveToPoint:CGPointMake(r * a, 0)];

    [path addLineToPoint:CGPointMake(self.bounds.size.width  - r * b, 0)];
    [path addArcWithCenter:CGPointMake( self.bounds.size.width  - r * b,  r * b) radius:r * b startAngle:-M_PI/2.0 endAngle:0 clockwise:YES];

    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - r * c)];
    [path addArcWithCenter:CGPointMake(self.bounds.size.width - r * c, self.bounds.size.height - r * c) radius:r * c startAngle:0 endAngle:M_PI/2.0 clockwise:YES];
 
    [path addLineToPoint:CGPointMake(r * d, self.bounds.size.height)];
    [path addArcWithCenter:CGPointMake( r * d, self.bounds.size.height - r * d) radius:r * d startAngle:M_PI/2.0 endAngle:M_PI clockwise:YES];
 
    [path addLineToPoint:CGPointMake(0, r * a)];
    [path addArcWithCenter:CGPointMake(r * a, r * a) radius:r * a startAngle:M_PI endAngle:M_PI/2.0 * 3 clockwise:YES];
    [path closePath];
    //    }
    return path;
}

-(void)allCornerButTwo:(CornerType)n  withRadius:(CGFloat)r//只有两个是直角，其他是圆角
{
    UIBezierPath *path = [self baseTwoCornerPath:n withRadius:r];
      [self setMaskLayerWithPath:path];
}

-(void)onlyOneCorner:(CornerType)n withRadius:(CGFloat)r
{
    UIBezierPath *path;// = [UIBezierPath bezierPath];
    if (n == 0) {

        path = [self baseAnyCornerPath:YES isRTC:NO isRBC:NO isLBC:NO withRadius:r];
    }
    else if (n == 1)
    {

         path = [self baseAnyCornerPath:NO isRTC:YES isRBC:NO isLBC:NO withRadius:r];
    }
    else if(n == 2)
    {

         path = [self baseAnyCornerPath:NO isRTC:NO isRBC:YES isLBC:NO withRadius:r];
    }
    else
    {

         path = [self baseAnyCornerPath:NO isRTC:NO isRBC:NO isLBC:YES withRadius:r];
    }

      [self setMaskLayerWithPath:path];
}

-(void)gradientColor:(UIColor *)color toColor:(UIColor *)toColor
{
    [self gradientColor:color toColor:toColor locations:@[@0,@1]];
}

-(void)gradientColor:(UIColor *)color toColor:(UIColor *)toColor  locations:(NSArray *)locations
{
    [self gradientColors:@[(id)color.CGColor,(id)toColor.CGColor] locations:locations];
}

-(void)gradientColors:(NSArray *)colors locations:(NSArray *)locations
{
    [self gradientColors:colors locations:locations startPoint:CGPointMake(1, 0) endPoint:CGPointMake(1, 1)];
}

-(void)gradientColors:(NSArray *)colors locations:(NSArray *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    CAGradientLayer *g = [CAGradientLayer layer];
    g.locations = locations;
    g.startPoint = startPoint;//CGPointMake(1, 0);
    g.endPoint = endPoint;//CGPointMake(1, 1);
    g.colors = colors;//@[(id)UIColorFromRGB(0xFFEF73).CGColor,(id)UIColorFromRGB(0xFDDA3F).CGColor];
    g.frame = self.bounds;
    [self setBackgroundLayer:g];
}
-(void)resetShadowLayer
{
    CAShapeLayer *ly = objc_getAssociatedObject(self, shadowLayerKey);
    if (!ly) {
        ly = [CAShapeLayer layer];
        ly.frame = self.bounds;
            ly.path = self.maskLayer.path;
        
    }
//    CAShapeLayer *sl = [CAShapeLayer layer];
//    sl.frame = self.bounds;
//    sl.path = self.maskLayer.path;
//    ly.mask = sl;
    objc_setAssociatedObject(self, shadowLayerKey, ly, OBJC_ASSOCIATION_RETAIN);
}

-(void)shadowColor:(UIColor *)color
{
    [self shadowColor:color shadowOffset:CGSizeMake(3, 3)];
}

-(void)shadowColor:(UIColor *)color shadowOffset:(CGSize )shadowOffset
{
    [self shadowColor:color shadowOffset:shadowOffset shadowOpacity:0.5];
}

-(void)shadowColor:(UIColor *)color shadowOffset:(CGSize )shadowOffset shadowOpacity:(CGFloat)opacity
{
    UIView *sv             = [UIView new];
    sv.frame               = self.bounds;
    sv.layer.shadowColor   = color.CGColor;
    sv.layer.shadowOffset  = shadowOffset;//CGSizeMake(10, 10);
    sv.layer.shadowOpacity = opacity;
    [self.superview addSubview:sv];
    [sv addSubview:self];
}

-(void)shadowWidthPath:(UIBezierPath *)path
{
    UIView *sv             = [UIView new];
    sv.frame               = self.bounds;
    sv.layer.shadowPath = path.CGPath;
//     sv.layer.shadowColor   = color.CGColor;
    [self.superview addSubview:sv];
    [sv addSubview:self];
}

+ (UIView *)normalShadow:(UIView *)imgv
{
    return   [self normalShadow:imgv withShadowColor: [UIColor lightGrayColor]];
}

+ (UIView *)normalShadow:(UIView *)imgv withShadowColor:(UIColor *)color
{
    return [UIView normalShadow:imgv withShadowOffset:CGSizeMake(3, 3) withShadowOpacity:0.5 withshadowRadius:3 withShadowColor:color];
}

+ (UIView *)normalShadow:(UIView *)imgv withShadowOffset:(CGSize)size
{
  return [UIView normalShadow:imgv withShadowOffset:size withShadowOpacity:0.5];
}

+ (UIView *)normalShadow:(UIView *)imgv withShadowOffset:(CGSize)size withShadowOpacity:(CGFloat)shadowOpacity
{
    return [UIView normalShadow:imgv withShadowOffset:size withShadowOpacity:shadowOpacity withshadowRadius:3];
}

+ (UIView *)normalShadow:(UIView *)imgv withShadowOffset:(CGSize)size withShadowOpacity:(CGFloat)shadowOpacity withshadowRadius:(CGFloat)shadowRadius
{
    return [UIView normalShadow:imgv withShadowOffset:size withShadowOpacity:shadowOpacity withshadowRadius:shadowRadius withShadowColor:[UIColor lightGrayColor]];
}

+ (UIView *)normalShadow:(UIView *)imgv withShadowOffset:(CGSize)size withShadowOpacity:(CGFloat)shadowOpacity withshadowRadius:(CGFloat)shadowRadius withShadowColor:(UIColor *)shadowColor
{
    
    UIView *sv             = [UIView new];
    sv.frame               = imgv.bounds;
    sv.layer.cornerRadius  = imgv.layer.cornerRadius;
    sv.layer.masksToBounds = NO;
    
    sv.layer.shadowColor   = shadowColor.CGColor;
    sv.layer.shadowOffset  = size;
    sv.layer.shadowOpacity = shadowOpacity;
    sv.layer.shadowRadius  = shadowRadius;
    [imgv.superview addSubview:sv];
    [sv addSubview:imgv];
    return sv;
}


-(void)jy_addVSubview:(UIView *)view
{
    id obj = objc_getAssociatedObject(self, contentHeightKey);
   CGFloat h = [obj floatValue];
    h += view.bounds.size.height;
 objc_setAssociatedObject(self, contentHeightKey, @(h), OBJC_ASSOCIATION_RETAIN);
    [self addSubview:view];

    [self.subviews  enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

            if (obj == view) {
            obj.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0 + (h/2.0 - obj.bounds.size.height/2.0));
        }
        else
        {
            obj.center = CGPointMake(obj.center.x , obj.center.y - view.bounds.size.height/2.0);
        }
        
    }];
}

-(void)refreshHView
{
    __block CGFloat w = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        w += obj.bounds.size.width;
    }];
     objc_setAssociatedObject(self, contentWidthXKey, @(w), OBJC_ASSOCIATION_RETAIN);
    __block UIView *preV;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         if (!preV) {
        obj.center = CGPointMake(self.bounds.size.width/2.0 -(w/2.0 - obj.bounds.size.width/2.0), self.bounds.size.height/2.0 );
         }else
         {
                  obj.center = CGPointMake(preV.center.x + preV.bounds.size.width/2.0 + obj.bounds.size.width/2.0, self.bounds.size.height/2.0 );
         }
         preV = obj;
    }];
}

-(void)refreshVView
{
    __block CGFloat h = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        h += obj.bounds.size.height;
    }];
    objc_setAssociatedObject(self, contentHeightKey, @(h), OBJC_ASSOCIATION_RETAIN);
    __block UIView *preV;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!preV) {
            obj.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0 - (h/2.0 - obj.bounds.size.height/2.0));
        }
        else
        {
        obj.center = CGPointMake(self.bounds.size.width/2.0, preV.center.y + preV.bounds.size.height/2.0 + obj.bounds.size.height/2.0);
        }
        preV = obj;
    }];
}

-(void)jy_addHSubview:(UIView *)view
{
    double w = [objc_getAssociatedObject(self, contentWidthXKey) doubleValue];
    w += view.bounds.size.width;
    objc_setAssociatedObject(self, contentWidthXKey, @(w), OBJC_ASSOCIATION_RETAIN);
    [self addSubview:view];

    [self.subviews  enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == view) {
            obj.center = CGPointMake(self.bounds.size.width/2.0 + (w/2.0 - obj.bounds.size.width/2.0), self.bounds.size.height/2.0 );
        }
        else
        {
            obj.center = CGPointMake(obj.center.x - view.bounds.size.width/2.0, obj.center.y );
        }
     
    }];
    
}
@end
