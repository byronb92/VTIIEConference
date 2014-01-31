//
//  EventDetailViewController.m
//  Conference
//
//  Created by Byron Becker on 1/2/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "EventDetailViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface EventDetailViewController ()
@end

@implementation EventDetailViewController

- (void)viewDidLoad
{
    self.title = [self.currentEventData objectForKey:@"Event"];
    self.descriptionTextView.text = [self.currentEventData objectForKey:@"Description"];
    self.timeLabel.text = [self.currentEventData objectForKey:@"Time"];
    self.timeLabel.textColor = UIColorFromRGB(0x660000);
    
    self.locationLabel.text = [self.currentEventData objectForKey:@"Location"];
    self.locationLabel.numberOfLines = 5;
    self.locationLabel.textColor = UIColorFromRGB(0x660000);
    
    // TODO: If event session is Session 1, 2, or 3... provide a directions page.
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
