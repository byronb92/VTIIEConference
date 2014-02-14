//
//  SponsorWebViewController.h
//  Conference
//
//  Created by Byron Becker on 2/13/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SponsorWebViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) NSString *urlToLoad;
@property (strong, nonatomic) IBOutlet UIWebView *sponsorWebView;

@end
