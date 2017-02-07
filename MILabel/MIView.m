//
//  MILabel.m
//  MILabel
//
//  Created by 罗壮燊 on 2017/2/6.
//  Copyright © 2017年 罗壮燊. All rights reserved.
//

#import "MIView.h"
#import "UIColor+hexString.h"



@interface MIView ()

@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@end

@implementation MIView

/**
 水平方向上的动画
 */
- (void)animation
{
    [self.gradientLayer removeAllAnimations];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.duration = 2;
    anim.keyPath = @"transform.translation.x";
    anim.values = @[@(0), @(self.maskLabel.bounds.size.width + MIGradientLayerWidth)];
    anim.repeatCount = MAXFLOAT;
    [self.gradientLayer addAnimation:anim forKey:nil];
}


- (void)setMaskLabel:(UILabel *)maskLabel
{
    _maskLabel = maskLabel;
    [_maskLabel sizeToFit];
    _maskLabel.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    self.backgroundColor = _maskLabel.textColor;
    self.layer.mask = maskLabel.layer;
    //添加动画
    [self animation];
}

- (void)setMiColor:(UIColor *)miColor
{
    _miColor = miColor;
    NSString *miColorHex = self.miColor.hexString;
    self.gradientLayer.colors = @[(id)[UIColor colorWithHex:miColorHex alpha:0].CGColor, (id)[UIColor colorWithHex:miColorHex alpha:0.8].CGColor,(id)[UIColor colorWithHex:miColorHex alpha:0].CGColor];
}




- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        //水平方向
        _gradientLayer.startPoint = CGPointMake(0.0, 0.5);
        _gradientLayer.endPoint = CGPointMake(1.0, 0.5);
        
        _gradientLayer.frame = CGRectMake(self.maskLabel.frame.origin.x - MIGradientLayerWidth, 0, MIGradientLayerWidth, self.bounds.size.height);
        // 设置渐变层的颜色，随机颜色渐变
        _gradientLayer.colors = @[(id)[UIColor colorWithWhite:1 alpha:0].CGColor, (id)[UIColor colorWithWhite:1 alpha:0.8].CGColor,(id)[UIColor colorWithWhite:1 alpha:0].CGColor];
        [self.layer addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

@end
