//
//  FoodDeliveryWebViewController.h
//  Conference
//
//  Created by Byron Becker on 2/8/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodDeliveryWebViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *foodMenuWebView;
@property(strong, nonatomic) NSString *urlToLoad;
@end
