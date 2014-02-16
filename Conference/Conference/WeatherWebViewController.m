//
//  WeatherWebViewController.m
//  Conference
//
//  Created by Byron Becker on 2/14/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "WeatherWebViewController.h"

@interface WeatherWebViewController ()

@end

@implementation WeatherWebViewController

- (void)viewDidLoad
{
    NSString *urlToLoad = @"http://www.weather.com";
    [self.weatherWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlToLoad]]];
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
    // THROW AN APPLE ALERT
    if([error code] == NSURLErrorCancelled) return;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSString *errorString = [NSString stringWithFormat:
                             @"<html><font size=+2 color='red'><p>An error occurred: %@<br />Possible causes for this error:<br />- No network connection</p></font></html>",
                             error.localizedDescription];
    [self.weatherWebView loadHTMLString:errorString baseURL:nil];
}


@end
