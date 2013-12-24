//
//  ContactDetailViewController.h
//  Conference
//
//  Created by Byron Becker on 12/21/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *positionLabel;
@property (strong, nonatomic) IBOutlet UITextView *emailTextView;
@property (strong, nonatomic) IBOutlet UITextView *phoneTextView;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;

// Once a contact has been clicked on from the table view, their information is
// passed to the ContactDetailViewController.
@property (strong, nonatomic) NSMutableDictionary *contactData;;

@end
