//
//  SpecificInterestViewController.m
//  Conference
//
//  Created by Byron Becker on 12/31/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "SpecificInterestViewController.h"
#import "DirectionWebViewController.h"

@interface SpecificInterestViewController ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation SpecificInterestViewController


- (void)viewDidLoad
{
    self.title = self.selectedInterest;
    self.descriptionTextView.text = self.selectedDescription;
    self.interestImageView.image =  [UIImage imageNamed:self.selectedInterestImageName];
    self.interestImageView.contentMode = UIViewContentModeScaleAspectFill;

    // Obtain path to the Google Maps page saved locally.
    NSURL *mapsHtmlRelativeFilePath = [[NSBundle mainBundle] URLForResource:@"maps" withExtension:@"html"];
    self.mapsHtmlAbsoluteFilePath = [mapsHtmlRelativeFilePath absoluteString];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getDirections:(UISegmentedControl *)sender {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [self.locationManager startUpdatingLocation];
    
    
    // Obtain current latitude and longitude.
    NSString *addressFrom= [NSString stringWithFormat:@"%f,%f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    
    
    // A Google map query parameter cannot have spaces. Therefore, replace each space with +
    NSString *placeNameNoSpaces = [self.selectedInterest stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *addressTo = [[NSString alloc] init];
    //addressTo = [self.selectedAddress stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    // Split the place coordinates into Latitude and Longitude objects placed in an array
    NSArray *latitudeLongitude = [self.selectedCoordinates componentsSeparatedByString:@","];
    addressTo = [addressTo stringByAppendingFormat:@"?n=%@&lat=%@&lng=%@&zoom=16&maptype=ROADMAP",
                           placeNameNoSpaces, [latitudeLongitude objectAtIndex:0], [latitudeLongitude objectAtIndex:1]];
    
    
    switch ([sender selectedSegmentIndex]) {
            
        case 0:  // Compose the Google directions query for DRIVING
            
            self.googleMapQuery = [self.mapsHtmlAbsoluteFilePath stringByAppendingFormat:@"?start=%@&end=%@&traveltype=DRIVING", addressFrom, self.selectedCoordinates];
            self.directionsType = @"Driving";
            break;
            
        case 1:  // Compose the Google directions query for WALKING
            
            self.googleMapQuery = [self.mapsHtmlAbsoluteFilePath stringByAppendingFormat:@"?start=%@&end=%@&traveltype=WALKING", addressFrom, self.selectedCoordinates];
            self.directionsType = @"Walking";
            break;
            
        case 2:  // Compose the Google directions query for BICYCLING
            
            self.googleMapQuery = [self.mapsHtmlAbsoluteFilePath stringByAppendingFormat:@"?start=%@&end=%@&traveltype=BICYCLING", addressFrom, self.selectedCoordinates];
            self.directionsType = @"Bicycling";
            break;
            
        case 3:  // Compose the Google directions query for TRANSIT
            
            self.googleMapQuery = [self.mapsHtmlAbsoluteFilePath stringByAppendingFormat:@"?start=%@&end=%@&traveltype=TRANSIT", addressFrom, self.selectedCoordinates];
            self.directionsType = @"Transit";
            break;
            
        default:
            return;
    }
    
    [self performSegueWithIdentifier:@"Directions" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Directions"])
    {
        // Deselect the segmented control before moving to the next view.
        self.directionSegmentedControl.selectedSegmentIndex = -1;
        DirectionWebViewController *directionWebViewController = [segue destinationViewController];
        directionWebViewController.googleMapQuery = self.googleMapQuery;
        directionWebViewController.directionsType = self.directionsType;
        directionWebViewController.selectedCoordinates = self.selectedCoordinates;
    }
}

@end
