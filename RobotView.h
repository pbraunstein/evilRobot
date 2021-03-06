
//  robotView.h
//  evilRobot
//
//  Created by Phippe on 6/5/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//
// Limited API

#import <UIKit/UIKit.h>

@interface RobotView : UIView

// whether the antena bulb is flashing
@property (nonatomic) BOOL bulbRed;

// flashEyes to make them menacing
- (void)flashEyes;

// Scale eyes responding to pinch gesture
- (void)scaleEyes:(CGFloat)scale;
@end
