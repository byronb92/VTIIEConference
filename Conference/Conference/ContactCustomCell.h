//
//  ContactCustomCell.h
//  Conference
//
//  Created by Byron Becker on 12/21/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//
//  Since contact images are different sizez, this custom cell class was created
//  to ensure that all images are scaled to the exact size, making the table view
//  look cleaner.

#import <UIKit/UIKit.h>

@interface ContactCustomCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *positionLabel;

@end
