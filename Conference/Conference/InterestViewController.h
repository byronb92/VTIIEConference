//
//  InterestsViewController.h
//  Conference
//
//  Created by Byron Becker on 12/27/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface InterestViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *interestTableView;
@property (strong, nonatomic) NSDictionary *interestData;


@end
