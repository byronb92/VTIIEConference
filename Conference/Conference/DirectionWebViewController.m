//
//  DirectionWebViewController.m
//  Conference
//
//  Created by Byron Becker on 1/1/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "DirectionWebViewController.h"

@interface DirectionWebViewController ()

@end

@implementation DirectionWebViewController

- (void)viewDidLoad
{
        [self.directionsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.googleMapQuery]]];
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                             @"<html><font size=+2 color='red'><p>An error occurred: %@<br />Possible causes for this error:<br />- No network connection<br />- Wrong URL entered<br />- Server computer is down</p></font></html>",
                             error.localizedDescription];
    [self.directionsWebView loadHTMLString:errorString baseURL:nil];
}


@end
