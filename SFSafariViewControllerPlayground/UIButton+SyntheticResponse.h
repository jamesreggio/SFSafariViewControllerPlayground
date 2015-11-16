//
//  UIButton+SyntheticResponse.h
//  SFSafariViewControllerPlayground
//
//  Created by James Reggio on 9/8/15.
//  Copyright © 2015 Twitter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SyntheticResponse)

@property (nonatomic) NSString *_syn_path;
@property (nonatomic) NSNumber *_syn_wait;
@property (nonatomic) BOOL _syn_modal;

@end
