//
//  EventDetailViewController.m
//  Conference
//
//  Created by Byron Becker on 1/2/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "EventDetailViewController.h"
#import "SessionViewController.h"

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
    
    self.locationTextView.text = [self.currentEventData objectForKey:@"Location"];
    self.locationTextView.textColor = UIColorFromRGB(0x660000);
    
    
    // If there is no Sponsor, the sponsor labels should be hidden.
    if (![[self.currentEventData objectForKey:@"Sponsor"] isEqualToString:@"No Sponsor"])
    {
        self.sponsorLabel.hidden = NO;
        self.sponsorTextView.hidden = NO;
        self.sponsorTextView.text = [self.currentEventData objectForKey:@"Sponsor"];
        self.sponsorTextView.textColor = UIColorFromRGB(0x660000);
    }
    else
    {
        self.sponsorLabel.hidden = YES;
        self.sponsorTextView.hidden = YES;
    }
    
    // Enable a button to be pressed to display Session Details if a Session event is selected.
    if ([self.title isEqualToString:@"Session 1"] || [self.title isEqualToString:@"Session 2"] ||
        [self.title isEqualToString:@"Session 3"])
    {
        self.sponsorDetailButton.hidden = NO;
    }
    else { self.sponsorDetailButton.hidden = YES; }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)sponsorButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Session Details" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Session Details"])
    {
        SessionViewController *sessionViewController = [segue destinationViewController];
        sessionViewController.sessionText = [self.currentEventData objectForKey:@"Session"];
        sessionViewController.title = [self.currentEventData objectForKey:@"Event"];
    }
    
}
@end
