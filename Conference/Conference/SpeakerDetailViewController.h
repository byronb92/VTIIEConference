//
//  SpeakerDetailViewController.h
//  Conference
//
//  Created by Byron Becker on 1/28/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeakerDetailViewController : UIViewController
@property (strong, nonatomic) NSDictionary *selectedSpeakerDictionary;
@property (strong, nonatomic) IBOutlet UIScrollView *speakerScrollView;



@property (strong, nonatomic) IBOutlet UIImageView *speakerPhoto;

@property (strong, nonatomic) IBOutlet UITextView *bioTextView;

@property (strong, nonatomic) IBOutlet UITextView *talkTextView;
@end
