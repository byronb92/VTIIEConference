//
//  SpeakerViewController.m
//  Conference
//
//  Created by Byron Becker on 1/28/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "SpeakerViewController.h"
#import "SpeakerDetailViewController.h"

@interface SpeakerViewController ()
@property (strong, nonatomic) NSDictionary *speakerContent;
@property (strong, nonatomic) NSArray *listOfDays;
@property (strong, nonatomic) NSArray *speakerForCurrentDay;
@property (strong, nonatomic) NSDictionary *selectedSpeakerDictionary;
@end

@implementation SpeakerViewController

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (void)viewDidLoad
{
    NSString *filePath;
    filePath = [[NSBundle mainBundle] pathForResource:@"Speakers" ofType:@"plist"];
    self.speakerContent = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    self.listOfDays = [[self.speakerContent allKeys] sortedArrayUsingSelector:@selector(compare:)];

    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View Delegate Methods.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Two sections, 1 for Friday, and 2 for Saturday.
    return 2;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Friday";
    }
    return @"Saturday";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *currentDay = [self.listOfDays objectAtIndex:section];
    NSDictionary *currentDayDictionary = [self.speakerContent objectForKey:currentDay];
    return [currentDayDictionary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpeakerCells"];
    NSUInteger rowNumber = [indexPath row];
    
    // Obtain the string for the current day.
    NSInteger section = [indexPath section];
    NSString *currentDay = [self.listOfDays objectAtIndex:section];
    
    // Obtain the array of speakers.
    NSArray *currentSpeakers = [self.speakerContent objectForKey:currentDay];
    NSDictionary *speakerInfo = [currentSpeakers objectAtIndex:rowNumber];
    
    // Each contact dictionary has 4 keys: Photo, Position, Email, and Phone.
    NSString *speaker = [speakerInfo objectForKey:@"Speaker"];
    NSString *title = [speakerInfo objectForKey:@"Title"];
    cell.textLabel.text = speaker;
    cell.detailTextLabel.text = title;
    cell.detailTextLabel.textColor = UIColorFromRGB(0x660000);
    cell.imageView.image = [UIImage imageNamed:[speakerInfo objectForKey:@"Photo"]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Obtain the string for the current day.
    NSInteger section = [indexPath section];
    NSUInteger rowNumber = [indexPath row];
    NSString *currentDay = [self.listOfDays objectAtIndex:section];
    
    // Obtain the array of speakers.
    NSArray *currentSpeakers = [self.speakerContent objectForKey:currentDay];
    //NSDictionary *speakerInfo = [currentSpeakers objectAtIndex:rowNumber];
    
    // Get speaker name (key for speaker info dictionary)
    self.selectedSpeakerDictionary = [currentSpeakers objectAtIndex:rowNumber];

    [self performSegueWithIdentifier:@"SpeakerDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SpeakerDetails"])
    {
        SpeakerDetailViewController *speakerdetailcontroller = [segue destinationViewController];
        speakerdetailcontroller.selectedSpeakerDictionary = self.selectedSpeakerDictionary;
    }
}
@end
