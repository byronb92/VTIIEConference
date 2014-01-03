//
//  InterestsViewController.m
//  Conference
//
//  Created by Byron Becker on 12/27/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "InterestViewController.h"
#import "SpecificInterestViewController.h"

@interface InterestViewController ()
@property (strong, nonatomic) NSArray *interestList;
@property (strong, nonatomic) NSString *selectedInterest;
@property (strong, nonatomic) NSString *selectedAddress;
@property (strong, nonatomic) NSString *selectedCoordinates;
@property (strong, nonatomic) NSString *selectedDescription;

@end

@implementation InterestViewController


- (void)viewDidLoad
{
    self.interestList = [[self.interestData allKeys] sortedArrayUsingSelector:@selector(compare:)];
    // Obtain maps path from bundle to load Google Maps API.

    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
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
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger rowNumber = [indexPath row];
    self.selectedInterest = [self.interestList objectAtIndex:rowNumber];
    NSDictionary *currentInterestData = [self.interestData objectForKey:self.selectedInterest];
    
    self.selectedDescription = [currentInterestData objectForKey:@"Description"];
    self.selectedAddress = [currentInterestData objectForKey:@"Address"];
    self.selectedCoordinates = [currentInterestData objectForKey:@"Coordinates"];
    
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
    }
}


@end