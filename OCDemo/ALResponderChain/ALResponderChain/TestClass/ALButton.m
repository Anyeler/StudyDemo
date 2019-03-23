//
//  ALButton.m
//  ALResponderChain
//
//  Created by 张远文 on 2019/3/24.
//  Copyright © 2019 张远文. All rights reserved.
//

#import "ALButton.h"
#import "ALTapGestureRecognizer.h"

@interface ALButton ()<UIGestureRecognizerDelegate>

@end

@implementation ALButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    [self addTapGestureRecognizer];
}

#pragma mark - 手势相关

- (void)addTapGestureRecognizer {
    ALTapGestureRecognizer *tap = [[ALTapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapActionWithGestureRecognizer:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

- (void)handleTapActionWithGestureRecognizer:(ALTapGestureRecognizer *)recognizer {
    NSLog(@"%@\n%s\n%@\n", self, __FUNCTION__, recognizer);
}

#pragma mark - Touch事件

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touches, event);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touches, event);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touches, event);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touches, event);
}

#pragma mark - UIControl事件

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event {
    BOOL isBegin = [super beginTrackingWithTouch:touch withEvent:event];
    NSString *isBeginStr = isBegin?@"YES":@"NO";
    NSLog(@"%@\n%s\nIsBegin = %@\n%@\n%@\n", self, __FUNCTION__, isBeginStr, touch, event);
    return isBegin;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event {
    BOOL isContinue = [super continueTrackingWithTouch:touch withEvent:event];
    NSString *isContinueStr = isContinue?@"YES":@"NO";
    NSLog(@"%@\n%s\nisContinue = %@\n%@\n%@\n", self, __FUNCTION__, isContinueStr, touch, event);
    return isContinue;
}

// touch is sometimes nil if cancelTracking calls through to this.
- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
    NSLog(@"%@\n%s\n%@\n%@\n", self, __FUNCTION__, touch, event);
}

- (void)cancelTrackingWithEvent:(nullable UIEvent *)event {
    [super cancelTrackingWithEvent:event];
    NSLog(@"%@\n%s\n%@\n", self, __FUNCTION__, event);
}

#pragma mark - 点击区域判断

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isPointInside = [super pointInside:point withEvent:event];
    NSString *isPointInsideStr = isPointInside?@"YES":@"NO";
    NSLog(@"%@\n%s\nIsPointInside = %@\n%@\n%@\n", self, __FUNCTION__, isPointInsideStr, @(point), event);
    return isPointInside;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    NSLog(@"%@\n%s\nHitView =\n%@%@\n%@\n", self, __FUNCTION__, hitView, @(point), event);
    return hitView;
}

#pragma mark - UIGestureRecognizerDelegate

// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"%@\n%s\n%@\n", self, __FUNCTION__, gestureRecognizer);
    return YES;
}

// called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
// return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
//
// note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"%@\n%s\nGestureRecognizer = %@\nOtherGestureRecognizer = %@\n", self, __FUNCTION__, gestureRecognizer, otherGestureRecognizer);
    return YES;
}

// called once per attempt to recognize, so failure requirements can be determined lazily and may be set up between recognizers across view hierarchies
// return YES to set up a dynamic failure requirement between gestureRecognizer and otherGestureRecognizer
//
// note: returning YES is guaranteed to set up the failure requirement. returning NO does not guarantee that there will not be a failure requirement as the other gesture's counterpart delegate or subclass methods may return YES
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"%@\n%s\nGestureRecognizer = %@\nOtherGestureRecognizer = %@\n", self, __FUNCTION__, gestureRecognizer, otherGestureRecognizer);
    return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"%@\n%s\nGestureRecognizer = %@\nOtherGestureRecognizer = %@\n", self, __FUNCTION__, gestureRecognizer, otherGestureRecognizer);
    return YES;
}

// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    NSLog(@"%@\n%s\nGestureRecognizer = %@\n%@\n", self, __FUNCTION__, gestureRecognizer, touch);
    return YES;
}

// called before pressesBegan:withEvent: is called on the gesture recognizer for a new press. return NO to prevent the gesture recognizer from seeing this press
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press {
    NSLog(@"%@\n%s\nGestureRecognizer = %@\n%@\n", self, __FUNCTION__, gestureRecognizer, press);
    return YES;
}

#pragma mark - 打印相关

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ : %p> Tag = %@", NSStringFromClass([self class]), self, @(self.tag)];
}

@end
