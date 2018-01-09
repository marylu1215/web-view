//
//  KJWebProgressLayer.h
//  TestWKWebView
//
//  Created by khj on 2016/12/2.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface KJWebProgressLayer : CAShapeLayer
- (void)finishedLoad;
- (void)startLoad;

- (void)closeTimer;
- (instancetype)initWithStrokeColor:(UIColor *)color;
@end
