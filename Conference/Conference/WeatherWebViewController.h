//
//  WeatherWebViewController.h
//  Conference
//
//  Created by Byron Becker on 2/14/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherWebViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *weatherWebView;

@end
