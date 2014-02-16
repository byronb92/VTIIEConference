//
//  FoodDeliveryWebViewController.m
//  Conference
//
//  Created by Byron Becker on 2/8/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "FoodDeliveryWebViewController.h"

@interface FoodDeliveryWebViewController ()
@end

@implementation FoodDeliveryWebViewController

- (void)viewDidLoad
{
    // Currently a dummy URL, waiting for official website to be come online.
    [self.foodMenuWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlToLoad]]];
    [super viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [super viewDidDisappear:animated];
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
    [self.foodMenuWebView loadHTMLString:errorString baseURL:nil];
}

@end
