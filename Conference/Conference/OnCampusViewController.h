//
//  OnCampusViewController.h
//  Conference
//
//  Created by Byron Becker on 12/26/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnCampusViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *onCampusTableView;
@property (strong, nonatomic) NSDictionary *currentDayAgenda;       // agenda of selected day
@end