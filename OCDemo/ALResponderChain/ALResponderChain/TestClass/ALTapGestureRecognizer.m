//
//  ALTapGestureRecognizer.m
//  ALResponderChain
//
//  Created by 张远文 on 2019/3/24.
//  Copyright © 2019 张远文. All rights reserved.
//

#import "ALTapGestureRecognizer.h"

@interface ALTapGestureRecognizer ()

@end

@implementation ALTapGestureRecognizer

#pragma mark - Touch事件

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touches, event);
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touches, event);
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touches, event);
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touches, event);
    [super touchesCancelled:touches withEvent:event];
}

@end
