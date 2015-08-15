//
//  ViewController.m
//  TimerProjectExercise
//
//  Created by Shena Yoshida on 8/15/15.
//  Copyright (c) 2015 Shena Yoshida. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerLabel; // drag in label to create property

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerLabel.text = @"0"; // set timer text to start at 0
   
    // create timer:
    
    // call NSTimer method, create instance called "timer", set intervals etc. This creates a looping method that runs every second
    // equal to calling [self timerFired] every 1.0 seconds
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];   // this lets you access your current timer run loop
}


- (void) timerFired:(NSTimer *)timer { // every time timer runs it calls this method
    
    NSInteger currentNumber = [self.timerLabel.text integerValue]; // get integer value of string each time timer is fired
    NSInteger nextNumber = currentNumber +1; // add to present time
    
    self.timerLabel.text = [NSString stringWithFormat:@"%lu", nextNumber]; // set time to label text
    
    if (nextNumber == 10) { // stop timer after 10
        [timer invalidate];
    }
    
    if (nextNumber)
    
    
    
    NSLog(@"timer fired");
}



@end
