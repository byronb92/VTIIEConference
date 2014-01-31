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
@end

@implementation SpeakerViewController


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
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Delegate Methods.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Two sections, 1 for Friday, and 2 for Saturday.
    return 2;
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
    
    //NSDictionary *currentSpeaker = [currentDay
    
    // Each contact dictionary has 4 keys: Photo, Position, Email, and Phone.
//    cell.nameLabel.text = currentContactKey;
//    cell.positionLabel.text = [currentContactDictionary objectForKey:@"Position"];
//    cell.positionLabel.textColor = UIColorFromRGB(0x660000);
//    cell.photoImageView.image = [UIImage imageNamed:[currentContactDictionary objectForKey:@"Photo"]];
//    cell.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSUInteger rowNumber = [indexPath row];
//    NSString *currentContactName = [self.contactNames objectAtIndex:rowNumber];
//    self.contactData = [self.contactDictionaries objectForKey:currentContactName];
//    // Before we pass the dictionary, we must also include the contact's name inside of it.
//    [self.contactData setValue:currentContactName forKey:@"Name"];
    [self performSegueWithIdentifier:@"SpeakerDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SpeakerDetails"])
    {
        SpeakerDetailViewController *speakerdetailcontroller = [segue destinationViewController];
        //speakerdetailcontroller.contactData = self.contactData;
    }
}
@end
