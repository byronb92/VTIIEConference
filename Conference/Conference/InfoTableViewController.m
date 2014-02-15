//
//  InfoViewController.m
//  Conference
//
//  Created by Byron Becker on 2/14/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "InfoTableViewController.h"
#import "InterestViewController.h"

@interface InfoTableViewController ()

@property (strong, nonatomic) NSDictionary *pointsOfInterestDict;
@property (strong, nonatomic) NSDictionary *interestData;
@end

@implementation InfoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Two sections, 1 for Friday, and 2 for Saturday.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Attractions";
    }
    else { return @"Miscellaneous"; }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 4 cells for Attractions, 2 for Miscellaneous
    if (section == 0)
    {
        return 4;
    }
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell *cell;
    NSInteger currentSection = [indexPath section];
    NSInteger currentRow = [indexPath row];
    
    if (currentSection == 0)
    {
        if (currentRow == 0)
        {
            CellIdentifier = @"BarCell";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        }
        else if (currentRow == 1)
        {
            CellIdentifier = @"RestaurantsCell";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        }
        else if (currentRow == 2)
        {
            CellIdentifier = @"FoodCell";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        }
        else
        {
            CellIdentifier = @"OtherCell";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        }
    }
    else
    {
        CellIdentifier = @"MiscCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        if (currentRow == 0)
        {
            cell.textLabel.text = @"Transportation";
        }
        else
        {
            cell.textLabel.text = @"Weather";
        }
    }
    
    // Change selection color.
    //    UIView *selectionColor = [[UIView alloc] init];
    //    selectionColor.backgroundColor =  [UIColor colorWithRed:0.898 green:0.518 blue:0.075 alpha:1.0],
    //    cell.selectedBackgroundView = selectionColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Section 0 = Attractions
    // Section 1 = Misc
    NSUInteger sectionNumber = [indexPath section];
    NSUInteger rowNumber = [indexPath row];
    NSString *filePath;
    filePath = [[NSBundle mainBundle] pathForResource:@"Attractions" ofType:@"plist"];
    self.pointsOfInterestDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    if (sectionNumber == 0)
    {
        if (rowNumber == 0)
        {
            NSString *onCampus = @"Bars";
            self.interestData = [self.pointsOfInterestDict objectForKey:onCampus];
            [self performSegueWithIdentifier:@"Bars" sender:self];
        }
        else if (rowNumber == 1)
        {
            NSString *offCampus = @"Restaurants";
            self.interestData = [self.pointsOfInterestDict objectForKey:offCampus];
            [self performSegueWithIdentifier:@"Restaurants" sender:self];
        }
        
        else if (rowNumber == 2)
        {
            NSString *offCampus = @"Food Delivery";
            self.interestData = [self.pointsOfInterestDict objectForKey:offCampus];
            [self performSegueWithIdentifier:@"Food Delivery" sender:self];
        }
        
        else
        {
            NSString *offCampus = @"Others";
            self.interestData = [self.pointsOfInterestDict objectForKey:offCampus];
            [self performSegueWithIdentifier:@"Others" sender:self];
        }
    }
    
    else
    {
        if (rowNumber == 0)
        {
            [self performSegueWithIdentifier:@"Transportation" sender:self];
        }
    }
    

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
         if ([[segue identifier] isEqualToString:@"Bars"])
        {
            InterestViewController *interestsViewController = [segue destinationViewController];
            interestsViewController.title = @"Bars";
            interestsViewController.interestData = self.interestData;
            interestsViewController.interestNavBarName = @"Bars";
        }
    
        else if ([[segue identifier] isEqualToString:@"Restaurants"])
        {
            InterestViewController *interestsViewController = [segue destinationViewController];
            interestsViewController.title = @"Restaurants";
            interestsViewController.interestData = self.interestData;
            interestsViewController.interestNavBarName = @"Dining";
        }
    
        else if ([[segue identifier] isEqualToString:@"Food Delivery"])
        {
            InterestViewController *interestsViewController = [segue destinationViewController];
            interestsViewController.title = @"Food Delivery";
            interestsViewController.interestData = self.interestData;
           interestsViewController.interestNavBarName = @"Food Delivery";
            
        }
    
        else if ([[segue identifier] isEqualToString:@"Others"])
        {
            InterestViewController *interestsViewController = [segue destinationViewController];
            interestsViewController.title = @"Others";
            interestsViewController.interestData = self.interestData;
            interestsViewController.interestNavBarName = @"Others";
        }
}


@end

