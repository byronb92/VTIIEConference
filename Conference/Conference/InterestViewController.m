//
//  InterestsViewController.m
//  Conference
//
//  Created by Byron Becker on 12/27/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "InterestViewController.h"
#import "SpecificInterestViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface InterestViewController ()
@property (strong, nonatomic) NSArray *interestList;
@property (strong, nonatomic) NSString *selectedInterest;
@property (strong, nonatomic) NSString *selectedAddress;
@property (strong, nonatomic) NSString *selectedCoordinates;
@property (strong, nonatomic) NSString *selectedDescription;
@property (strong, nonatomic) NSString *selectedInterestImageName;

@end

@implementation InterestViewController


- (void)viewDidLoad
{
    self.interestList = [[self.interestData allKeys] sortedArrayUsingSelector:@selector(compare:)];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.interestData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell *cell;
    NSInteger currentRow = [indexPath row];
    
    CellIdentifier = @"InterestCell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Obtain the current event's data.
    NSString *currentInterest = [self.interestList objectAtIndex:currentRow];
    NSDictionary *currentInterestData = [self.interestData objectForKey:currentInterest];
    NSString *currentInterestAddress = [currentInterestData objectForKey:@"Address"];
    
    // Set the current cell to match with the current event.
    cell.textLabel.text = currentInterest;
    cell.detailTextLabel.text = currentInterestAddress;
    cell.detailTextLabel.textColor = UIColorFromRGB(0x660000);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger rowNumber = [indexPath row];
    
    // Once a cell is clicked, it's data must be obtained and passed to the next controller.
    self.selectedInterest = [self.interestList objectAtIndex:rowNumber];
    NSDictionary *currentInterestData = [self.interestData objectForKey:self.selectedInterest];
    
    self.selectedDescription = [currentInterestData objectForKey:@"Description"];
    self.selectedAddress = [currentInterestData objectForKey:@"Address"];
    self.selectedCoordinates = [currentInterestData objectForKey:@"Coordinates"];
    self.selectedInterestImageName = [currentInterestData objectForKey:@"Image"];
    
    [self performSegueWithIdentifier:@"InterestInfo" sender:self];
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"InterestInfo"])
    {
        SpecificInterestViewController *specificInterestsViewController = [segue destinationViewController];
        specificInterestsViewController.selectedInterest = self.selectedInterest;
        specificInterestsViewController.selectedAddress = self.selectedAddress;
        specificInterestsViewController.selectedCoordinates = self.selectedCoordinates;
        specificInterestsViewController.selectedDescription = self.selectedDescription;
        specificInterestsViewController.selectedInterestImageName = self.selectedInterestImageName;
        // Create button and shorten title.
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:self.interestNavBarName
                                                                       style:UIBarButtonItemStyleDone target:nil action:nil];
        [[self navigationItem] setBackBarButtonItem:backButton];
    }
}


@end
