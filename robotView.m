//
//  robotView.m
//  evilRobot
//
//  Created by Phippe on 6/5/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//

#import "robotView.h"

@implementation robotView

#pragma mark - initialization
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    // Make it transparent
    self.opaque = NO;
    self.backgroundColor = nil;
    
    // Initialize properties
    _body = CGRectMake(0.0, ((self.bounds.size.height * 1) / 3), self.bounds.size.width, ((self.bounds.size.height * 2) / 3));
    float width = self.body.size.width / 8;
    float height = self.bounds.size.height / 16;
    _neck = CGRectMake(self.body.size.width / 2 - (width / 2), self.body.origin.y - height, width, height);
    float headHeight = (self.bounds.size.height / 4);
    _head = CGRectMake(self.body.origin.x, self.body.origin.y - self.neck.size.height - headHeight, self.body.size.width, headHeight);
    
    // Eyes
    self.eyeRadius = 10;
    self.eyeOneCenter = CGPointMake(self.head.origin.x + (self.head.size.width / 3), self.head.origin.y + (self.head.size.height / 2));
    self.eyeTwoCenter = CGPointMake(self.head.origin.x + (2 * self.head.size.width / 3), self.head.origin.y + (self.head.size.height / 2));
    
    // Redraw if things change
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setUp];
}


#pragma mark - drawing

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawBody];
    [self drawNeck];
    [self drawHead];
    [self drawEyes];
    
    
}

- (void)drawBody
{
    // Must store context state in order for clipping to work
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    UIBezierPath *toDraw = [UIBezierPath bezierPathWithRoundedRect:self.body byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(8.0, 8.0)];

    
    [toDraw addClip];
    
    
    [[UIColor grayColor] setFill];
    UIRectFill(self.body);
    
    [toDraw fill];
    CGContextRestoreGState(context);  // Done with this context state -- get rid of it
}

- (void)drawNeck
{
    UIBezierPath *toDraw = [UIBezierPath bezierPathWithRect:self.neck];
    
    
    [[UIColor grayColor] setFill];
    UIRectFill(self.neck);
    
    [toDraw fill];
}


- (void)drawHead
{
    UIBezierPath *toDraw = [UIBezierPath bezierPathWithRect:self.head];
    
    [[UIColor grayColor]setFill];
    UIRectFill(self.head);
    
    [toDraw fill];
}

- (void)drawEyes
{
    UIBezierPath * eyeOne = [UIBezierPath bezierPathWithArcCenter:self.eyeOneCenter radius:self.eyeRadius startAngle:0 endAngle:360 clockwise:YES];
     [[UIColor redColor] setFill];
    
    
    [eyeOne fill];
    [eyeOne stroke];
    
    UIBezierPath * eyeTwo = [UIBezierPath bezierPathWithArcCenter:self.eyeTwoCenter radius:self.eyeRadius startAngle:0 endAngle:360 clockwise:YES];
    
   
    [eyeTwo fill];
    
    [eyeTwo stroke];
}

@end
