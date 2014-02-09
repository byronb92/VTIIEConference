//
//  SpeakerDetailViewController.m
//  Conference
//
//  Created by Byron Becker on 1/28/14.
//  Copyright (c) 2014 Byron Becker. All rights reserved.
//

#import "SpeakerDetailViewController.h"

@interface SpeakerDetailViewController ()

@end

@implementation SpeakerDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.speakerScrollView setScrollEnabled:YES];
    [self.speakerScrollView setContentSize:CGSizeMake(320,3000)];
    
    self.title = [self.selectedSpeakerDictionary objectForKey:@"Speaker"];
    self.speakerPhoto.image = [UIImage imageNamed:[self.selectedSpeakerDictionary objectForKey:@"Photo"]];
    self.bioTextView.text = [self.selectedSpeakerDictionary objectForKey:@"Bio"];
    self.talkTextView.text = [self.selectedSpeakerDictionary objectForKey:@"Topic Info"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
