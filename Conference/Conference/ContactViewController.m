//
//  ContactViewController.m
//  Conference
//
//  Created by Byron Becker on 12/4/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactCustomCell.h"
#import "ContactDetailViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ContactViewController ()
@property (strong, nonatomic) NSDictionary *contactDictionaries;
@property (strong, nonatomic) NSArray *contactNames;

@property (strong, nonatomic) NSMutableDictionary *contactData;
@end

@implementation ContactViewController

- (void)viewDidLoad
{
    NSString *filePath;
    filePath = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    
    self.contactDictionaries = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    self.contactNames= [[self.contactDictionaries allKeys] sortedArrayUsingSelector:@selector(compare:)];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View Delegate Methods.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contactNames count];
}

- (ContactCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContactCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell"];
    // Iterate through the plist with the rowNumber as the index.
    NSUInteger rowNumber = [indexPath row];
    
    // We use the name of the contact as the key to obtain that contact's data.
    NSString *currentContactKey = [self.contactNames objectAtIndex:rowNumber];
    NSDictionary *currentContactDictionary = [self.contactDictionaries objectForKey:currentContactKey];
    
    // Each contact dictionary has 4 keys: Photo, Position, Email, and Phone.
    cell.nameLabel.text = currentContactKey;
    cell.positionLabel.text = [currentContactDictionary objectForKey:@"Position"];
    cell.positionLabel.textColor = UIColorFromRGB(0x660000);
    cell.photoImageView.image = [UIImage imageNamed:[currentContactDictionary objectForKey:@"Photo"]];
    cell.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger rowNumber = [indexPath row];
    NSString *currentContactName = [self.contactNames objectAtIndex:rowNumber];
    self.contactData = [self.contactDictionaries objectForKey:currentContactName];
    // Before we pass the dictionary, we must also include the contact's name inside of it.
    [self.contactData setValue:currentContactName forKey:@"Name"];
    [self performSegueWithIdentifier:@"ContactDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ContactDetail"])
    {
        ContactDetailViewController *contactDetailViewController = [segue destinationViewController];
        contactDetailViewController.contactData = self.contactData;
    }
}
@end
