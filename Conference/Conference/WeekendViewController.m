//
//  OnCampusViewController.m
//  Conference
//
//  Created by Byron Becker on 12/26/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "WeekendViewController.h"

@interface WeekendViewController ()
@property (strong, nonatomic) NSArray *sortedAgenda;        // String list of events
@end

@implementation WeekendViewController

- (void)viewDidLoad
{
    // The current day selected will be passed from the AgendaViewController.
    // Since we have the current day dictionary, we need to sort the events by key.
    // The keys are sorted in chronological order, starting from 0.
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
    // Return the number of sections.
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

    return cell;
}


// TODO Implement didSelectRowAtIndexPath...

@end
