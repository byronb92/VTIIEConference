//
//  FoodDeliveryViewController.m
//  Conference
//
//  Created by Byron Becker on 2/8/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "FoodDeliveryViewController.h"
#import "FoodDeliveryWebViewController.h"

@interface FoodDeliveryViewController ()
@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *hours;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *menuURL;
@property (strong, nonatomic) NSString *photo;
@end

@implementation FoodDeliveryViewController

- (void)viewDidLoad
{
    self.phoneLabel.text = [self.deliveryList objectForKey:@"Number"];
    self.hourLabel.text = [self.deliveryList objectForKey:@"Hours"];
    self.foodDeliveryTextView.text = [self.deliveryList objectForKey:@"Description"];
    self.photo = [self.deliveryList objectForKey:@"Image"];
    self.foodDeliveryImageView.image = [UIImage imageNamed:self.photo];
    self.foodDeliveryImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.menuURL = [self.deliveryList objectForKey:@"Menu"];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showMenu:(UIButton *)sender {
    [self performSegueWithIdentifier:@"MenuWebView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"MenuWebView"])
    {
        FoodDeliveryWebViewController *foodWebViewController = [segue destinationViewController];
        foodWebViewController.urlToLoad = self.menuURL;
    }
        
}
@end
