//
//  AppDelegate.m
//  Conference
//
//  Created by Byron Becker on 10/19/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Obtain the complete version string.
    // E.G. If the version is 7.0.3, then "7.0.3." will be returned.
    NSString *currentVersionFull = [[UIDevice currentDevice] systemVersion];
    [self initializeStoryBoardBasedOnVersion:currentVersionFull];
    

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)initializeStoryBoardBasedOnVersion:(NSString*)versionString {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {   // The iOS device = iPhone or iPod Touch
        
        // Read the first chr of the version string and convert it to an integer for comparison.
        NSInteger currentVersion = [[versionString substringToIndex:1] integerValue];
        if (currentVersion == 7)
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
        }
        else {
            // load ios6 storyboard
            UIStoryboard *iPhone6Storyboard = [UIStoryboard storyboardWithName:@"ios6" bundle:nil];
            
            UIViewController *initialViewController = [iPhone6Storyboard instantiateInitialViewController];
            
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            self.window.rootViewController  = initialViewController;
            [self.window makeKeyAndVisible];
        }
        
        
    }
}
@end
