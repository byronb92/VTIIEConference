//
//  SponsorViewController.h
//  Conference
//
//  Created by Byron Becker on 2/10/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SponsorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *sponsorScrollViw;

- (IBAction)lowesButtonClicked:(UIButton *)sender;

- (IBAction)upsButtonClicked:(UIButton *)sender;

- (IBAction)pepsicoButtonClicked:(UIButton *)sender;

- (IBAction)deloitteButtonClicked:(UIButton *)sender;

- (IBAction)newportNewsButtonClicked:(UIButton *)sender;


@end
