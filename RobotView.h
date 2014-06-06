
//  robotView.h
//  evilRobot
//
//  Created by Phippe on 6/5/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RobotView : UIView

// whether the antena bulb is flashing
@property (nonatomic) BOOL bulbRed;

// flashEyes to make them menacing
- (void)flashEyes;
@end
