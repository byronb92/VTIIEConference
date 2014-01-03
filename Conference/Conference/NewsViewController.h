//
//  NewsViewController.h
//  Conference
//
//  Created by Byron Becker on 1/3/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *newsWebView;

@end
