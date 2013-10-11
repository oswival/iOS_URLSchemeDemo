//
//  ViewController.m
//  URLAppLauncher
//
//  Created by Oskar Wirén on 10/11/13.
//  Copyright (c) 2013 Oskar Wirén. All rights reserved.
//

#import "AppChooserViewController.h"

@implementation AppChooserViewController {
    NSURL *appOneURL;
    NSURL *appTwoURL;
}
@synthesize goToAppOneButton;
@synthesize goToAppTwoButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appOneURL = [NSURL URLWithString:@"appOne://"];
    appTwoURL = [NSURL URLWithString:@"appTwo://"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateButtons)
                                                 name:@"appDidBecomeActive"
                                               object:nil];
    
}

- (void)updateButtons
{
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:appOneURL]) {
        [goToAppOneButton setHidden:NO];
    } else {
        [goToAppOneButton setHidden:YES];
    }
    
    if ([app canOpenURL:appTwoURL]) {
        [goToAppTwoButton setHidden:NO];
    } else {
        [goToAppTwoButton setHidden:YES];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateButtons];
}

- (IBAction)goToAppOne:(id)sender
{
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:appOneURL])
        [app openURL:appOneURL];

}

- (IBAction)goToAppTwo:(id)sender
{
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:appTwoURL])
        [app openURL:appTwoURL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
