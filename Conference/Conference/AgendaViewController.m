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
@property (strong, nonatomic) NSArray *weekendDays;
@property (strong, nonatomic) NSDictionary *currentDayAgenda;

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
    // There are two sections, Weekend Agenda and Points of Interest.
    return 2;
}


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
        // For the Weekend Agenda there are 3 cells: Friday, Saturday, Sunday.
        return 3;
    }
    // There are 2 areas where points of interest may reside: On-Campus and Off-Campus..
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
//    UIView *selectionColor = [[UIView alloc] init];
//    selectionColor.backgroundColor =  [UIColor colorWithRed:0.898 green:0.518 blue:0.075 alpha:1.0],
//    cell.selectedBackgroundView = selectionColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Section 0 = Weekend Agenda
    // Section 1 = Points of Interest
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
    
    else if (sectionNumber == 1)
    {
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
        interestsViewController.interestNavBarName = @"On-Campus";
    }
    
    else if ([[segue identifier] isEqualToString:@"InterestsOffCampus"])
    {
        InterestViewController *interestsViewController = [segue destinationViewController];
        interestsViewController.title = @"Off-Campus Interests";
        interestsViewController.interestData = self.interestData;
        interestsViewController.interestNavBarName = @"Off-Campus";
    }
}


@end
