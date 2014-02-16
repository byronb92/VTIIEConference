//
//  SponsorViewController.m
//  Conference
//
//  Created by Byron Becker on 2/10/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "SponsorViewController.h"
#import "SponsorWebViewController.h"

@interface SponsorViewController ()
@property (strong, atomic) NSMutableDictionary *sponsorUrls;
@end

@implementation SponsorViewController

- (void)viewDidLoad
{
    [self.sponsorScrollViw setScrollEnabled:YES];
    [self.sponsorScrollViw setContentSize:CGSizeMake(320,3000)];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SponsorURLs" ofType:@"plist"];
    self.sponsorUrls = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)lowesButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"LowesWebView" sender:self];
}

- (IBAction)upsButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"UPSWebView" sender:self];
}

- (IBAction)pepsicoButtonClicked:(UIButton *)sender {
        [self performSegueWithIdentifier:@"PepsicoWebView" sender:self];
}

- (IBAction)deloitteButtonClicked:(UIButton *)sender {
        [self performSegueWithIdentifier:@"DeloitteWebView" sender:self];
}

- (IBAction)newportNewsButtonClicked:(UIButton *)sender {
            [self performSegueWithIdentifier:@"NewportNewsWebView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"UPSWebView"])
    {
        SponsorWebViewController *sponsorWebViewController = [segue destinationViewController];
        sponsorWebViewController.urlToLoad = [self.sponsorUrls objectForKey:@"UPS"];
        sponsorWebViewController.title = @"UPS";
    }
    
    if ([[segue identifier] isEqualToString:@"LowesWebView"])
    {
        SponsorWebViewController *sponsorWebViewController = [segue destinationViewController];
        sponsorWebViewController.urlToLoad = [self.sponsorUrls objectForKey:@"Lowes"];
        sponsorWebViewController.title = @"Lowe's";
    }
    
    if ([[segue identifier] isEqualToString:@"PepsicoWebView"])
    {
        SponsorWebViewController *sponsorWebViewController = [segue destinationViewController];
        sponsorWebViewController.urlToLoad = [self.sponsorUrls objectForKey:@"Pepsico"];
        sponsorWebViewController.title = @"Pepsico";
    }
    
    if ([[segue identifier] isEqualToString:@"DeloitteWebView"])
    {
        SponsorWebViewController *sponsorWebViewController = [segue destinationViewController];
        sponsorWebViewController.urlToLoad = [self.sponsorUrls objectForKey:@"Deloitte"];
        sponsorWebViewController.title = @"Deloitte";
    }
    
    if ([[segue identifier] isEqualToString:@"NewportNewsWebView"])
    {
        SponsorWebViewController *sponsorWebViewController = [segue destinationViewController];
        sponsorWebViewController.urlToLoad = [self.sponsorUrls objectForKey:@"Newport News"];
        sponsorWebViewController.title = @"Newport News Publishing";
    }
}

@end
