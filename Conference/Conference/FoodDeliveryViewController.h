//
//  FoodDeliveryViewController.h
//  Conference
//
//  Created by Byron Becker on 2/8/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodDeliveryViewController : UIViewController
@property (strong, nonatomic) NSDictionary *deliveryList;

@property (strong, nonatomic) IBOutlet UIImageView *foodDeliveryImageView;
@property (strong, nonatomic) IBOutlet UILabel *foodDeliveryTextView;
@property (strong, nonatomic) IBOutlet UITextView *hourLabel;
@property (strong, nonatomic) IBOutlet UITextView *phoneLabel;
@property (strong, nonatomic) IBOutlet UIButton *viewMenuButton;
- (IBAction)showMenu:(UIButton *)sender;


@end
