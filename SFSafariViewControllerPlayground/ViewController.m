//
//  ViewController.m
//  SFSafariViewControllerPlayground
//
//  Created by James Reggio on 9/8/15.
//  Copyright © 2015 Twitter. All rights reserved.
//

@import SafariServices.SFSafariViewController;

#import "UIButton+SyntheticResponse.h"
#import "ViewController.h"

static NSString *kDNSFailureURL = @"https://www.thiswillnoresolve.co";
static NSString *kSyntheticURLPrefix = @"https://http-playground.herokuapp.com/synthetic/";

@implementation ViewController

- (IBAction)navigateToDNSFailure:(id)sender {
    NSLog(@"Navigating to DNS failure");
    [self loadSafariViewControllerWithURL:[NSURL URLWithString:kDNSFailureURL] asModal:NO];
}

- (IBAction)navigateToSyntheticResponse:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSLog(@"Navigating with %@ delay to %@", button._syn_wait, button._syn_path);
    NSString *url = [NSString stringWithFormat:@"%@%@?wait=%@", kSyntheticURLPrefix, button._syn_path, button._syn_wait];
    [self loadSafariViewControllerWithURL:[NSURL URLWithString:url] asModal:button._syn_modal];
}

- (void)loadSafariViewControllerWithURL:(NSURL*)url asModal:(BOOL)modal {
    SFSafariViewController *controller = [[SFSafariViewController alloc] initWithURL:url];
    
    controller.delegate = self;
    controller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Waiting..." style:UIBarButtonItemStylePlain target:NULL action:NULL];
    
    if (modal) {
        [self presentViewController:controller animated:YES completion:nil];
    } else {
        UINavigationController *parent = (UINavigationController*)self.parentViewController;
        [parent pushViewController:controller animated:YES];
    }
}

- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    controller.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"didCompleteInitialLoad:%@", didLoadSuccessfully ? @"YES" : @"NO"];
}

@end
