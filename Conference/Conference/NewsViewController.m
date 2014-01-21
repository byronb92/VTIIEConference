//
//  NewsViewController.m
//  Conference
//
//  Created by Byron Becker on 1/3/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad
{
    // Currently a dummy URL, waiting for official website to be come online.
    NSString *urlToLoad = @"http://vtiie.org/iieconference/index.php/news";
    [self.newsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlToLoad]]];
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
                             @"<html><font size=+2 color='red'><p>An error occurred: %@<br />Possible causes for this error:<br />- No network connection<br />- The website that contains the news is down.</p></font></html>",
                             error.localizedDescription];
    [self.newsWebView loadHTMLString:errorString baseURL:nil];
}
@end
