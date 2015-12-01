//
//  UIButton+Playground.m
//  SFSafariViewControllerPlayground
//
//  Created by James Reggio on 9/8/15.
//  Copyright © 2015 Twitter. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButton+Playground.h"

@implementation UIButton (Playground)

@dynamic _play_path;

- (void)set_play_path:(NSString *)path {
    objc_setAssociatedObject(self, @selector(_play_path), path, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)_play_path {
    return objc_getAssociatedObject(self, @selector(_play_path));
}

@dynamic _play_wait;

- (void)set_play_wait:(NSNumber *)wait {
    objc_setAssociatedObject(self, @selector(_play_wait), wait, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)_play_wait {
    return objc_getAssociatedObject(self, @selector(_play_wait));
}

@dynamic _play_modal;

- (void)set_play_modal:(BOOL)modal {
    objc_setAssociatedObject(self, @selector(_play_modal), @(modal), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)_play_modal {
    return [objc_getAssociatedObject(self, @selector(_play_modal)) boolValue];
}

@end
