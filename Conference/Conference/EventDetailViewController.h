//
//  EventDetailViewController.h
//  Conference
//
//  Created by Byron Becker on 1/2/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *currentEventData;
@property (strong, nonatomic) NSString *navBackButtonTitle;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UITextView *locationTextView;

@property (strong, nonatomic) IBOutlet UILabel *sponsorLabel;
@property (strong, nonatomic) IBOutlet UITextView *sponsorTextView;

@property (strong, nonatomic) IBOutlet UIButton *sponsorDetailButton;
- (IBAction)sponsorButtonClicked:(UIButton *)sender;

@end

