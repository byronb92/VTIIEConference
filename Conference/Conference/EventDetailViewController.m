//
//  EventDetailViewController.m
//  Conference
//
//  Created by Byron Becker on 1/2/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "EventDetailViewController.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController

- (void)viewDidLoad
{
    self.title = [self.currentEventData objectForKey:@"Event"];
    self.descriptionTextView.text = [self.currentEventData objectForKey:@"Description"];
    self.timeLabel.text = [self.currentEventData objectForKey:@"Time"];
    self.locationLabel.text = [self.currentEventData objectForKey:@"Location"];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
