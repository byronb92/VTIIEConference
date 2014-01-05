//
//  AgendaViewController.m
//  Conference
//
//  Created by Byron Becker on 12/26/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "AgendaViewController.h"
#import "WeekendViewController.h"
#import "InterestViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface AgendaViewController ()
@property (strong, nonatomic) NSDictionary *weekendAgenda_Dict;     // each day has a dictionary
@property (strong, nonatomic) NSArray *weekendDays;                 // holds list of days
@property (strong, nonatomic) NSDictionary *currentDayAgenda;       // agenda of selected day

@property (strong, nonatomic) NSDictionary *pointsOfInterestDict;
@property (strong, nonatomic) NSDictionary *interestData;

@end

@implementation AgendaViewController

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
    // Return the number of sections.
    return 2;
}


// Set the table view section header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Weekend Agenda";
    }
    return @"Points of Interest";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    else
    {
        return 2;
    }
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
            cell.textLabel.text = @"On-Campus";
        }
        else if (currentRow == 1)
        {
            cell.textLabel.text = @"Off-Campus";
        }

    }
    
    // Change selection color.
//    cell.selectedBackgroundView = UIColorFromRGB(0x660000);
    return cell;
}


// Informs the table view delegate that the specified row is now selected.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Row 0 = Roster
    NSUInteger sectionNumber = [indexPath section];
    NSUInteger rowNumber = [indexPath row];
    
    if (sectionNumber == 0)
    {
        // Since we know one of the weekend dates has been selected, we can obtain
        // all of the dates from the onCampusAgenda.plist.
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
    
    else if (sectionNumber == 1)
    {
        // Since sectionNumber is 1, one of the Points of Interest cells have been clicked.
        NSString *filePath;
        filePath = [[NSBundle mainBundle] pathForResource:@"PointsOfInterest" ofType:@"plist"];
        self.pointsOfInterestDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        
        if (rowNumber == 0)
        {
            NSString *onCampus = @"On-Campus";
            self.interestData = [self.pointsOfInterestDict objectForKey:onCampus];
            [self performSegueWithIdentifier:@"InterestsOnCampus" sender:self];
        }
        else
        {
            NSString *offCampus = @"Off-Campus";
            self.interestData = [self.pointsOfInterestDict objectForKey:offCampus];
            [self performSegueWithIdentifier:@"InterestsOffCampus" sender:self];
        }
    }
}

#pragma mark - Navigation
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
    
    else if ([[segue identifier] isEqualToString:@"InterestsOnCampus"])
    {
        InterestViewController *interestsViewController = [segue destinationViewController];
        interestsViewController.title = @"On-Campus Interests";
        interestsViewController.interestData = self.interestData;
    }
    
    else if ([[segue identifier] isEqualToString:@"InterestsOffCampus"])
    {
        InterestViewController *interestsViewController = [segue destinationViewController];
        interestsViewController.title = @"Off-Campus Interests";
        interestsViewController.interestData = self.interestData;
    }
}


@end
