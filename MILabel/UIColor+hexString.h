//
//  UIColor+hexString.h
//  YJS
//
//  Created by 罗壮燊 on 2017/1/13.
//  Copyright © 2017年 zbky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexString)



/**
 转为十六进制字符串值
 */
- (NSString *)hexString;
+ (UIColor *)colorWithHex:(NSString *)hex;
+ (UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha;

@end
