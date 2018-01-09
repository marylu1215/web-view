//
//  NSTimer+addition.h
//  TestWKWebView
//
//  Created by khj on 2016/12/2.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (addition)
- (void)pause;
- (void)resume;
- (void)resumeWithTimeInterval:(NSTimeInterval)time;
@end
