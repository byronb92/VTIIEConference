//
//  EventViewController.m
//  Conference
//
//  Created by Byron Becker on 12/26/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "EventViewController.h"
#import "WeekendViewController.h"
#import "InterestViewController.h"
#import "FoodDeliveryViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface EventViewController ()
@property (strong, nonatomic) NSDictionary *weekendAgenda_Dict; 
@property (strong, nonatomic) NSArray *weekendDays;
@property (strong, nonatomic) NSDictionary *currentDayAgenda;

@property (strong, nonatomic) NSDictionary *pointsOfInterestDict;
@property (strong, nonatomic) NSDictionary *interestData;

@end

@implementation EventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // There are two sections, Weekend Agenda and Points of Interest.
    return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Weekend Agenda";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // For the Weekend Agenda there are 3 cells: Friday, Saturday, Sunday.
    // For the attractions there are 4 cells: Bars, Restaurants, Food Deliver, and Other.
    if (section == 0)
    {
        return 3;
    }
    return 4;
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
            CellIdentifier = @"Friday";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        }
        else if (currentRow == 1)
        {
            CellIdentifier = @"Saturday";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        }
        else if (currentRow == 2)
        {
            CellIdentifier = @"Sunday";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        }
    }
    
    else
    {
        CellIdentifier = @"OffCampusAttraction";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        if (currentRow == 0)
        {
            cell.textLabel.text = @"Bars";
        }
        else if (currentRow == 1)
        {
            cell.textLabel.text = @"Restaurants";
        }
        else if (currentRow == 2)
        {
            cell.textLabel.text = @"Food Delivery";
        }
        else
        {
            cell.textLabel.text = @"Others";
        }

    }
    
    // Change selection color.
//    UIView *selectionColor = [[UIView alloc] init];
//    selectionColor.backgroundColor =  [UIColor colorWithRed:0.898 green:0.518 blue:0.075 alpha:1.0],
//    cell.selectedBackgroundView = selectionColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Section 0 = Weekend Agenda
    // Section 1 = Attractions
    NSUInteger sectionNumber = [indexPath section];
    NSUInteger rowNumber = [indexPath row];
    
    if (sectionNumber == 0)
    {
        // Since we know one of the weekend dates has been selected, we can obtain
        // the data contained in the WeekendAgenda.plist.
        NSString *filePath;
        filePath = [[NSBundle mainBundle] pathForResource:@"WeekendAgenda" ofType:@"plist"];
        
        self.weekendAgenda_Dict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        self.weekendDays = [[self.weekendAgenda_Dict allKeys] sortedArrayUsingSelector:@selector(compare:)];
        
        if (rowNumber == 0)
        {
            // Obtain Friday's agenda.
            NSString *daySelected = [self.weekendDays objectAtIndex:0];
            self.currentDayAgenda = [self.weekendAgenda_Dict objectForKey:daySelected];
            
            [self performSegueWithIdentifier:@"Friday" sender:self];
        }
        else if (rowNumber == 1)
        {
            // Obtain Saturday's agenda.
            NSString *daySelected = [self.weekendDays objectAtIndex:1];
            self.currentDayAgenda = [self.weekendAgenda_Dict objectForKey:daySelected];
            [self performSegueWithIdentifier:@"Saturday" sender:self];
        }
        
        else if (rowNumber == 2)
        {
            // Obtain Sunday's agenda.
            NSString *daySelected = [self.weekendDays objectAtIndex:2];
            self.currentDayAgenda = [self.weekendAgenda_Dict objectForKey:daySelected];
            [self performSegueWithIdentifier:@"Sunday" sender:self];
        }
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Friday"])
    {
        WeekendViewController *fridayOnCampusViewController = [segue destinationViewController];
        fridayOnCampusViewController.currentDayAgenda = self.currentDayAgenda;
        fridayOnCampusViewController.title = @"Friday";
    }
    
    else if ([[segue identifier] isEqualToString:@"Saturday"])
    {
        WeekendViewController *saturdayOnCampusViewController = [segue destinationViewController];
        saturdayOnCampusViewController.currentDayAgenda = self.currentDayAgenda;
        saturdayOnCampusViewController.title = @"Saturday";
    }
    
    else if ([[segue identifier] isEqualToString:@"Sunday"])
    {
        WeekendViewController *sundayOnCampusViewController = [segue destinationViewController];
        sundayOnCampusViewController.currentDayAgenda = self.currentDayAgenda;
        sundayOnCampusViewController.title = @"Sunday";
    }
    
}


@end
