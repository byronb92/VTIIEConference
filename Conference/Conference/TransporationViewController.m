//
//  TransporationViewController.m
//  Conference
//
//  Created by Byron Becker on 2/16/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "TransporationViewController.h"

@interface TransporationViewController ()

@end

@implementation TransporationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.taxiTextView.text = nil;
    self.hooptieTextView.text = nil;
    
    self.taxiTextView.text = @"(540) 552-6671";
    self.hooptieTextView.text = @"(540) 449-3748";
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
