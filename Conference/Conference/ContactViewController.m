//
//  ContactViewController.m
//  Conference
//
//  Created by Byron Becker on 12/4/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactCustomCell.h"

@interface ContactViewController ()
@property (strong, nonatomic) NSDictionary *contactDictionaries;
@property (strong, nonatomic) NSArray *contactNames;
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
    cell.photoImageView.image = [UIImage imageNamed:[currentContactDictionary objectForKey:@"Photo"]];
    cell.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    return cell;
}

// Informs the table view delegate that the specified row is now selected.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Implement later.
    //ContactDetail
    [self performSegueWithIdentifier:@"ContactDetail" sender:self];
}

@end
