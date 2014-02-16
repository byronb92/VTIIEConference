//
//  SponsorWebViewController.m
//  Conference
//
//  Created by Byron Becker on 2/13/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "SponsorWebViewController.h"

@interface SponsorWebViewController ()

@end

@implementation SponsorWebViewController

- (void)viewDidLoad
{
    // Currently a dummy URL, waiting for official website to be come online.
    [self.sponsorWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlToLoad]]];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    if([error code] == NSURLErrorCancelled) return;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSString *errorString = [NSString stringWithFormat:
                             @"<html><font size=+2 color='red'><p>An error occurred: %@<br />Possible causes for this error:<br />- No network connection</p></font></html>",
                             error.localizedDescription];
    [self.sponsorWebView loadHTMLString:errorString baseURL:nil];
}

@end
