//
//  ViewController.m
//  ALResponderChain
//
//  Created by 张远文 on 2019/3/23.
//  Copyright © 2019 张远文. All rights reserved.
//

#import "ViewController.h"
#import "ALWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self printNextResponderWithResponder:self.view];
}

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

#pragma mark - Button事件

- (IBAction)tapAction:(UIButton *)sender {
    NSLog(@"%@\n%s\n%@\n", self, __FUNCTION__, sender);
}

static ALWindow *window;
- (IBAction)changeWindowAction:(UIButton *)sender {
    if (!window) {
        window = [[ALWindow alloc] init];
    }
    [window makeKeyAndVisible];
}

@end
