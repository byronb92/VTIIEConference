//
//  SessionViewController.h
//  Conference
//
//  Created by Byron Becker on 2/15/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SessionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *sessionWebView;
@property(strong, nonatomic) NSString *sessionText;

@end
