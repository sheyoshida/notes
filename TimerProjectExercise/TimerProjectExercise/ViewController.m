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
@property (nonatomic) BOOL timerIsRunning;
@property (nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *circleButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerIsRunning = NO;
    
    self.timerLabel.text = @"0"; // set timer text to start at 0
   
    // I moved timer setup to button touched
}


- (void) timerFired:(NSTimer *)timer { // every time timer runs it calls this method
    
    float currentNumber = [self.timerLabel.text floatValue]; // get integer value of string each time timer is fired
    float nextNumber = currentNumber +.01; // add to present time
    self.timerLabel.text = [NSString stringWithFormat:@"%.2f", nextNumber]; // set time to label text
    
    if (nextNumber == 10) { // stop timer after 10
        [timer invalidate];
    }
    if (nextNumber)
    NSLog(@"timer fired"); // display each time a number is generated
    
}

- (void)stopTimer {
    [self.timer invalidate];
    UIImage *image = [UIImage imageNamed:@"redcircle"];
    [self.circleButton setImage:image forState:UIControlStateNormal];
}

- (void)startTimer {
    self.timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];   // this lets you access your current timer run loop
    
    UIImage *image = [UIImage imageNamed:@"greencircle"];
    [self.circleButton setImage:image forState:UIControlStateNormal];
}

- (IBAction)buttonTapped:(id)sender {
    //IBAction *tapped =
     NSLog(@"button tapped"); // test it!
    
    if (self.timerIsRunning) {
        self.timerIsRunning = NO;
        [self stopTimer];
    } else {
        self.timerIsRunning = YES;
        [self startTimer];
    }
    
    // create timer:
    // call NSTimer method, create instance called "timer", set intervals etc. This creates a looping method that runs every second
    // equal to calling [self timerFired] every 1.0 seconds
    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];   // this lets you access your current timer run loop
}

//+ (id)buttonWithType:(UIButtonType)buttonType {
//    
//}


@end
