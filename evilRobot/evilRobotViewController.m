//
//  evilRobotViewController.m
//  evilRobot
//
//  Created by Phippe on 6/5/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//

#import "evilRobotViewController.h"
#import "robotView.h"

@interface evilRobotViewController ()
@property (weak, nonatomic) IBOutlet RobotView *robot;

@end

@implementation evilRobotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startWatch];
}

- (void) startWatch
{
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(flash) userInfo:nil repeats:YES];
}

- (void)flash
{
    self.robot.bulbRed = !self.robot.bulbRed;
    [self.robot setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapReceived:(UITapGestureRecognizer *)sender {
    [self.robot flashEyes];
}

@end
