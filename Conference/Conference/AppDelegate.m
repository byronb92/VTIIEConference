//
//  AppDelegate.m
//  Conference
//
//  Created by Byron Becker on 10/19/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "AppDelegate.h"

// Constant to create a custom hex color value.
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// Hex color code for maroon. Only defined for reference.
#define maroon @"0x#660000"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Obtain the complete version string.
    // E.G. If the version is 7.0.3, then "7.0.3." will be returned.
    NSString *currentVersionFull = [[UIDevice currentDevice] systemVersion];
    [self initializeStoryBoardBasedOnVersion:currentVersionFull];
    return YES;
}


- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return (UIInterfaceOrientationMaskPortrait);
}


-(void)initializeStoryBoardBasedOnVersion:(NSString*)versionString {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {   // The iOS device = iPhone or iPod Touch
        
        // Read the first chr of the version string and convert it to an integer for comparison.
        self.currentVersion = [[versionString substringToIndex:1] integerValue];
        if (self.currentVersion == 7)
        {
            // Load ios7(Main) storyboard.
            // Instantiate a new storyboard object using the storyboard file named Main
            UIStoryboard *iPhone75Storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            // Instantiate the initial view controller object from the storyboard
            UIViewController *initialViewController = [iPhone75Storyboard instantiateInitialViewController];
            
            // Instantiate a UIWindow object and initialize it with the screen size of the iOS device
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            
            // Set the initial view controller to be the root view controller of the window object
            self.window.rootViewController  = initialViewController;
            
            // Set the window object to be the key window and show it
            [self.window makeKeyAndVisible];
            
            // Change navbar back button color.
            self.window.tintColor = UIColorFromRGB(0x660000);
            
            // Change the navbar font color.
            [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGB(0x660000), NSForegroundColorAttributeName, nil]];
        }
        else {
            // load ios6 storyboard
            UIStoryboard *iPhone6Storyboard = [UIStoryboard storyboardWithName:@"ios6" bundle:nil];
            UIViewController *initialViewController = [iPhone6Storyboard instantiateInitialViewController];
            
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            self.window.rootViewController  = initialViewController;
            [self.window makeKeyAndVisible];
            
            // Changes navigation color to maroon.
            // Other navbar buttons are automatically changed based on this color.
            [[UINavigationBar appearance] setTintColor:UIColorFromRGB(0x660000)];
        }
        
        
    }
}
@end
