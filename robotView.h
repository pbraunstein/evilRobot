//
//  robotView.h
//  evilRobot
//
//  Created by Phippe on 6/5/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface robotView : UIView
@property (nonatomic) CGRect head;
@property (nonatomic) CGRect neck;
@property (nonatomic) CGRect body;
@property (nonatomic) CGFloat eyeRadius;
@property (nonatomic) CGPoint eyeOneCenter;
@property (nonatomic) CGPoint eyeTwoCenter;
@property (nonatomic) CGPoint antenaBulb;
@property (nonatomic) CGFloat antenaRadius;
@property (nonatomic) BOOL bulbRed;
@end
