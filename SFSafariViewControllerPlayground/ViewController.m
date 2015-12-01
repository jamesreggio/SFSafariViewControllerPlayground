//
//  ViewController.m
//  SFSafariViewControllerPlayground
//
//  Created by James Reggio on 9/8/15.
//  Copyright © 2015 Twitter. All rights reserved.
//

#import "UIButton+Playground.h"
#import "ViewController.h"

static NSString *kPlaygroundURLPrefix = @"https://http-playground.herokuapp.com";

@implementation ViewController

- (IBAction)navigateToURL:(id)sender {
    UIButton *button = (UIButton*)sender;

    [self loadSafariViewControllerWithURL:[NSURL URLWithString:button._play_path] asModal:button._play_modal];
}

- (IBAction)navigateToSyntheticResponse:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSString *url = [NSString stringWithFormat:@"%@/synthetic/%@?wait=%@", kPlaygroundURLPrefix, button._play_path, button._play_wait];
    [self loadSafariViewControllerWithURL:[NSURL URLWithString:url] asModal:button._play_modal];
}

- (IBAction)navigateToCrasher:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSString *url = [NSString stringWithFormat:@"%@/crashers/%@", kPlaygroundURLPrefix, button._play_path];
    [self loadSafariViewControllerWithURL:[NSURL URLWithString:url] asModal:button._play_modal];
}

- (void)loadSafariViewControllerWithURL:(NSURL*)url asModal:(BOOL)modal {
    NSLog(@"Navigating to %@", [url absoluteString]);
    SFSafariViewController *controller = [[SFSafariViewController alloc] initWithURL:url];
    
    controller.delegate = self;
    controller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Waiting..." style:UIBarButtonItemStylePlain target:NULL action:NULL];
    
    if (modal) {
        [self presentViewController:controller animated:YES completion:nil];
    } else {
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    controller.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"didCompleteInitialLoad:%@", didLoadSuccessfully ? @"YES" : @"NO"];
}

@end
