//
//  OnCampusViewController.m
//  Conference
//
//  Created by Byron Becker on 12/26/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "WeekendViewController.h"
#import "EventDetailViewController.h"
#import "AppDelegate.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface WeekendViewController ()
@property (strong, nonatomic) NSArray *sortedAgenda;
@property (strong, nonatomic) NSDictionary *currentEventData;

@end

@implementation WeekendViewController

- (void)viewDidLoad
{
    // The current day selected will be passed from the AgendaViewController.
    // Since we have the current day dictionary, we need to sort the events by key.
    // The keys are sorted in numerical order, starting from 0.
    self.sortedAgenda = [[self.currentDayAgenda allKeys] sortedArrayUsingSelector:@selector(compare:)];
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
    return [self.sortedAgenda count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell *cell;
    NSInteger currentRow = [indexPath row];
    
    CellIdentifier = @"CurrentEventCell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Obtain the current event's data.
    NSString *currentEvent = [self.sortedAgenda objectAtIndex:currentRow];
    NSDictionary *currentEventData = [self.currentDayAgenda objectForKey:currentEvent];
    NSString *eventName = [currentEventData objectForKey:@"Event"];
    NSString *eventTime = [currentEventData objectForKey:@"Time"];
    
    // Set the current cell to match with the current event.
    cell.textLabel.text = eventName;
    cell.detailTextLabel.text = eventTime;
    cell.detailTextLabel.textColor = UIColorFromRGB(0x660000);
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger rowNumber = [indexPath row];
    
    // Obtain the current event's data.
    NSString *currentEvent = [self.sortedAgenda objectAtIndex:rowNumber];
    NSDictionary *currentEventData = [self.currentDayAgenda objectForKey:currentEvent];
    self.currentEventData = currentEventData;
    [self performSegueWithIdentifier:@"EventDetails" sender:self];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"EventDetails"])
    {
        EventDetailViewController *eventDetailViewController = [segue destinationViewController];
        eventDetailViewController.currentEventData = self.currentEventData;
        
        // Determine the navigation back button title.
        // Keeping the title short makes the navigation bar look cleaner in iOS7
        // "currentVersion" in the appDelegate determines what iOS version the user is running.
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        if (appDelegate.currentVersion == 7)
        {
            if ([self.title isEqualToString:@"Friday"])
            {
                // Create button and set title to "Fri"
                UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Fri"
                                                                               style:UIBarButtonItemStyleDone target:nil action:nil];
                [[self navigationItem] setBackBarButtonItem:backButton];
            }
            else if ([self.title isEqualToString:@"Saturday"])
            {
                UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sat" style:UIBarButtonItemStyleDone target:nil action:nil];
                [[self navigationItem] setBackBarButtonItem:backButton];
            }
            else
            {
                UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sun" style:UIBarButtonItemStyleDone target:nil action:nil];
                [[self navigationItem] setBackBarButtonItem:backButton];
            }
        }
    }
}
@end
