//
//  UIButton+SyntheticResponse.m
//  SFSafariViewControllerPlayground
//
//  Created by James Reggio on 9/8/15.
//  Copyright © 2015 Twitter. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButton+SyntheticResponse.h"

@implementation UIButton (SyntheticResponse)

@dynamic _syn_path;

- (void)set_syn_path:(NSString *)path {
    objc_setAssociatedObject(self, @selector(_syn_path), path, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)_syn_path {
    return objc_getAssociatedObject(self, @selector(_syn_path));
}

@dynamic _syn_wait;

- (void)set_syn_wait:(NSNumber *)wait {
    objc_setAssociatedObject(self, @selector(_syn_wait), wait, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)_syn_wait {
    return objc_getAssociatedObject(self, @selector(_syn_wait));
}

@dynamic _syn_modal;

- (void)set_syn_modal:(BOOL)modal {
    objc_setAssociatedObject(self, @selector(_syn_modal), @(modal), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)_syn_modal {
    return [objc_getAssociatedObject(self, @selector(_syn_modal)) boolValue];
}

@end
