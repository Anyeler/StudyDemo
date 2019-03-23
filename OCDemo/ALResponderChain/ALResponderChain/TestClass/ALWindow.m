//
//  ALWindow.m
//  ALResponderChain
//
//  Created by 张远文 on 2019/3/24.
//  Copyright © 2019 张远文. All rights reserved.
//

#import "ALWindow.h"

@interface ALWindow ()



@end

@implementation ALWindow

- (instancetype)init
{
    self = [super initWithFrame:UIScreen.mainScreen.bounds];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
//    self.rootViewController = [[UIViewController alloc] init];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self createExchangeButton];
//    [self printNextResponderWithResponder:self.rootViewController.view];
    [self printNextResponderWithResponder:self];
}

- (void)createExchangeButton {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 200, 80, 40)];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [button setTitle:@"切换窗口" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:0.15 green:0.17 blue:0.56 alpha:1.0];
    [button addTarget:self action:@selector(dissmissWindow) forControlEvents:UIControlEventTouchUpInside];
//    [self.rootViewController.view addSubview:button];
    [self addSubview:button];
}

- (void)dissmissWindow {
    UIWindow *win = [UIApplication sharedApplication].delegate.window;
    [win makeKeyAndVisible];
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

#pragma mark - 打印相关

- (void)printNextResponderWithResponder:(UIResponder *)lastResponder {
    NSMutableString *mutStr = [NSMutableString stringWithFormat:@"ResponderChain:\n<%@: %p>", NSStringFromClass([lastResponder class]), lastResponder];
    UIResponder *responder = lastResponder.nextResponder;
    while (responder) {
        NSString *printStr = [NSString stringWithFormat:@" --> <%@: %p>", NSStringFromClass([responder class]), responder];
        [mutStr appendString:printStr];
        responder = responder.nextResponder;
    }
    NSLog(@"%@", mutStr);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ : %p> Tag = %@", NSStringFromClass([self class]), self, @(self.tag)];
}

@end
