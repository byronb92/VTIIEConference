//
//  HomeViewController.m
//  Conference
//
//  Created by Byron Becker on 10/19/13.
//  Copyright (c) 2013 Byron Becker. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()
@end

@implementation HomeViewController
NSTimer *timer;

- (void)viewDidLoad
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
    _timerLabel.hidden = YES;
    [super viewDidLoad];
}

// Code to run after every countdown timer tick. (specified as 1.0 seconds)
- (void)timerTick:(NSTimer *)timer {
    NSDate *now = [NSDate date];
    NSDate *eventStart = [self dateOfConference:[NSDate date]];
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"MMMM d, y h:mm:ss a";
    }
    /* ------------------------------------------------------------
     * Comparing dates return 3 objects:
     *      NSOrderedSame if they are equal
     *      NSOrderedDescending if receiver happens after argument
     *      NSOrderedAscending if receiver happens before argument
     * ------------------------------------------------------------
     */
    if ([now compare:eventStart] == NSOrderedDescending) {
        self.eventDateLabel.text = @"The conference date has arrived!";
        _timerLabel.hidden = NO;
    }
    else {
        NSCalendar *sysCalendar = [NSCalendar currentCalendar];
        unsigned int unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        
        NSDateComponents *breakdownInfo = [sysCalendar components:unitFlags fromDate:now  toDate:eventStart options:0];
        NSInteger months = [breakdownInfo month];
        NSInteger days = [breakdownInfo day];
        NSInteger hours = [breakdownInfo hour];
        NSInteger minutes = [breakdownInfo minute];
        NSInteger seconds = [breakdownInfo second];
        NSString *countdownString = [NSString stringWithFormat:@"%d Months %d Days %d Hours %d Minutes %d Seconds", months, days, hours, minutes, seconds];
        self.timerLabel.text = countdownString;
    }
    _timerLabel.hidden = NO;
}
- (NSDate *)dateOfConference:(NSDate *)inputDate
{
    // Use the user's current calendar and time zone
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [calendar setTimeZone:timeZone];
    
    // Selectively convert the date components (year, month, day, hour, seconds) of the input date
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSSecondCalendarUnit fromDate:inputDate];
    
    // Conference begins February 21st, 2014.
    [dateComps setDay:21];
    [dateComps setMonth:02];
    [dateComps setYear:2014];
    [dateComps setHour:0];
    [dateComps setMinute:0];
    [dateComps setSecond:0];
    NSDate *conferenceDate = [calendar dateFromComponents:dateComps];
    return conferenceDate;
}
@end
