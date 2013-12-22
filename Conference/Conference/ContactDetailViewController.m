//
//  ContactDetailViewController.m
//  Conference
//
//  Created by Byron Becker on 12/21/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "ContactDetailViewController.h"

@interface ContactDetailViewController ()
@end

@implementation ContactDetailViewController

- (void)viewDidLoad
{
    self.title = [self.contactData objectForKey:@"Name"];
    self.photoImageView.image = [UIImage imageNamed:[self.contactData objectForKey:@"Photo"]];
    
    self.positionTextView.text = [self.contactData objectForKey:@"Position"];
    [self.positionTextView sizeToFit];
    self.emailTextView.text = [self.contactData objectForKey:@"Email"];
    self.phoneTextView.text = [self.contactData objectForKey:@"Phone"];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
