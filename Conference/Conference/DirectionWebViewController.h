//
//  DirectionWebViewController.h
//  Conference
//
//  Created by Byron Becker on 1/1/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectionWebViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) NSString *googleMapQuery;
@property (strong, nonatomic) NSString *directionsType;
@property (strong, nonatomic) NSString *selectedCoordinates;

@property (strong, nonatomic) IBOutlet UIWebView *directionsWebView;
@end
