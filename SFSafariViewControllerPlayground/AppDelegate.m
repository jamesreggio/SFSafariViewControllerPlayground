//
//  AppDelegate.m
//  SFSafariViewControllerPlayground
//
//  Created by James Reggio on 9/8/15.
//  Copyright © 2015 Twitter. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Fabric with:@[[Crashlytics class]]];
    return YES;
}

@end
