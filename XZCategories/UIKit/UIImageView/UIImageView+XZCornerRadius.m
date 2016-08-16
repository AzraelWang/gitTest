//
//  UIImageView+XZCornerRadius.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/15.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIImageView+XZCornerRadius.h"
#import <objc/runtime.h>

// http://zyden.vicp.cc/zycornerradius/

const char kProcessedImage;//image对象绑定的标识符，目的是为了防止一些情况下，刷新重绘时把圆角效果覆盖掉

@interface UIImageView ()

@property (assign, nonatomic) CGFloat xzRadius;
@property (assign, nonatomic) UIRectCorner roundingCorners;
@property (assign, nonatomic) CGFloat xzBorderWidth;
@property (strong, nonatomic) UIColor *xzBorderColor;
@property (assign, nonatomic) BOOL xzHadAddObserver;//标识是否已经添加了KVO监听
@property (assign, nonatomic) BOOL xzIsRounding;//标识是否需要四角全部圆角

@end

@implementation UIImageView (XZCornerRadius)


/**
 * @brief init the Rounding UIImageView, no off-screen-rendered
 */
- (instancetype)initWithRoundingRectImageView {
    self = [super init];
    if (self) {
        [self xz_cornerRadiusRoundingRect];
    }
    return self;
}

/**
 * @brief init the UIImageView with cornerRadius, no off-screen-rendered
 */
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self = [super init];
    if (self) {
        [self xz_cornerRadiusAdvance:cornerRadius rectCornerType:rectCornerType];
    }
    return self;
}

/**
 * @brief attach border for UIImageView with width & color
 */
- (void)xz_attachBorderWidth:(CGFloat)width color:(UIColor *)color {
    self.xzBorderWidth = width;
    self.xzBorderColor = color;
}

#pragma mark - Kernel
/**
 * @brief clip the cornerRadius with image, UIImageView must be setFrame before, no off-screen-rendered
 */
- (void)xz_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.image = processedImage;
}

/**
 * @brief clip the cornerRadius with image, draw the backgroundColor you want, UIImageView must be setFrame before, no off-screen-rendered, no Color Blended layers
 */
- (void)xz_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType backgroundColor:(UIColor *)backgroundColor {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    UIBezierPath *backgroundRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [backgroundColor setFill];
    [backgroundRect fill];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.image = processedImage;
}

/**
 * @brief set cornerRadius for UIImageView, no off-screen-rendered
 */
- (void)xz_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self.xzRadius = cornerRadius;
    self.roundingCorners = rectCornerType;
    self.xzIsRounding = NO;
    
    if (!self.xzHadAddObserver) {
        [[self class] swizzleDealloc];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.xzHadAddObserver = YES;
    }
}

/**
 * @brief become Rounding UIImageView, no off-screen-rendered
 */
- (void)xz_cornerRadiusRoundingRect {
    self.xzIsRounding = YES;
    
    if (!self.xzHadAddObserver) {
        [[self class] swizzleDealloc];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.xzHadAddObserver = YES;
    }
}

#pragma mark - Private
- (void)drawBorder:(UIBezierPath *)path {
    if (0 != self.xzBorderWidth && nil != self.xzBorderColor) {
        [path setLineWidth:2 * self.xzBorderWidth];
        [self.xzBorderColor setStroke];
        [path stroke];
    }
}

- (void)xz_dealloc {
    if (self.xzHadAddObserver) {
        [self removeObserver:self forKeyPath:@"image"];
    }
    [self xz_dealloc];
}

- (void)validateFrame {
    if (self.frame.size.width == 0) {
        [self.class swizzleLayoutSubviews];
    }
}

+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel {
    Method oneMethod = class_getInstanceMethod(self, oneSel);
    Method anotherMethod = class_getInstanceMethod(self, anotherSel);
    method_exchangeImplementations(oneMethod, anotherMethod);
}

+ (void)swizzleDealloc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:NSSelectorFromString(@"dealloc") anotherMethod:@selector(xz_dealloc)];
    });
}

+ (void)swizzleLayoutSubviews {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviews) anotherMethod:@selector(xz_LayoutSubviews)];
    });
}

- (void)xz_LayoutSubviews {
    [self xz_LayoutSubviews];
    if (self.xzIsRounding) {
        [self xz_cornerRadiusWithImage:self.image cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
    } else if (0 != self.xzRadius && 0 != self.roundingCorners && nil != self.image) {
        [self xz_cornerRadiusWithImage:self.image cornerRadius:self.xzRadius rectCornerType:self.roundingCorners];
    }
}

#pragma mark - KVO for .image
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[NSKeyValueChangeNewKey];
        if ([newImage isMemberOfClass:[NSNull class]]) {
            return;
        } else if ([objc_getAssociatedObject(newImage, &kProcessedImage) intValue] == 1) {
            return;
        }
        [self validateFrame];
        if (self.xzIsRounding) {
            [self xz_cornerRadiusWithImage:newImage cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
        } else if (0 != self.xzRadius && 0 != self.roundingCorners && nil != self.image) {
            [self xz_cornerRadiusWithImage:newImage cornerRadius:self.xzRadius rectCornerType:self.roundingCorners];
        }
    }
}

#pragma mark property
- (CGFloat)xzBorderWidth {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setxzBorderWidth:(CGFloat)xzBorderWidth {
    objc_setAssociatedObject(self, @selector(xzBorderWidth), @(xzBorderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)xzBorderColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setxzBorderColor:(UIColor *)xzBorderColor {
    objc_setAssociatedObject(self, @selector(xzBorderColor), xzBorderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)xzHadAddObserver {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setxzHadAddObserver:(BOOL)xzHadAddObserver {
    objc_setAssociatedObject(self, @selector(xzHadAddObserver), @(xzHadAddObserver), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)xzIsRounding {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setxzIsRounding:(BOOL)xzIsRounding {
    objc_setAssociatedObject(self, @selector(xzIsRounding), @(xzIsRounding), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIRectCorner)roundingCorners {
    return [objc_getAssociatedObject(self, _cmd) unsignedLongValue];
}

- (void)setRoundingCorners:(UIRectCorner)roundingCorners {
    objc_setAssociatedObject(self, @selector(roundingCorners), @(roundingCorners), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)xzRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setxzRadius:(CGFloat)xzRadius {
    objc_setAssociatedObject(self, @selector(xzRadius), @(xzRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end
