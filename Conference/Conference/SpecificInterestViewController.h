//
//  SpecificInterestViewController.h
//  Conference
//
//  Created by Byron Becker on 12/31/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SpecificInterestViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *interestImageView;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *directionSegmentedControl;

@property (strong, nonatomic) NSString *selectedInterest;
@property (strong, nonatomic) NSString *selectedAddress;
@property (strong, nonatomic) NSString *selectedCoordinates;
@property (strong, nonatomic) NSString *selectedDescription;
@property (strong, nonatomic) NSString *selectedInterestImageName;

@property (strong, nonatomic) NSString *mapsHtmlAbsoluteFilePath;
@property (strong, nonatomic) NSString *googleMapQuery;
@property (strong, nonatomic) NSString *directionsType;


- (IBAction)getDirections:(UISegmentedControl *)sender;
@end
