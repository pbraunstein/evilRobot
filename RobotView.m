//
//  RobotView.m
//  evilRobot
//
//  Created by Phippe on 6/5/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//
// Another nonsense comment

#import "RobotView.h"

@interface RobotView()
@property (nonatomic) CGRect head;
@property (nonatomic) CGRect neck;
@property (nonatomic) CGRect body;
@property (nonatomic) CGFloat eyeRadius;
@property (nonatomic) CGPoint eyeOneCenter;
@property (nonatomic) CGPoint eyeTwoCenter;
@property (strong, nonatomic) UIColor *eyeColor;
@property (nonatomic) CGPoint antenaBulb;
@property (nonatomic) CGFloat antenaRadius;
@end

@implementation RobotView

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
    self.eyeColor = [UIColor yellowColor];
    
    // Antena
    self.antenaRadius = 5.0;
    self.antenaBulb = CGPointMake(self.body.size.width / 2, self.bounds.origin.y + self.antenaRadius);
    self.bulbRed = NO;
    
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
    [self drawAntena];
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
    UIBezierPath *eyeOne = [UIBezierPath bezierPathWithArcCenter:self.eyeOneCenter radius:self.eyeRadius startAngle:0 endAngle:360 clockwise:YES];
     [self.eyeColor setFill];
    
    
    [eyeOne fill];
    [eyeOne stroke];
    
    UIBezierPath *eyeTwo = [UIBezierPath bezierPathWithArcCenter:self.eyeTwoCenter radius:self.eyeRadius startAngle:0 endAngle:360 clockwise:YES];
    
   
    [eyeTwo fill];
    
    [eyeTwo stroke];
}

- (void)drawAntena{
    UIBezierPath *bulb = [UIBezierPath bezierPathWithArcCenter:self.antenaBulb radius:self.antenaRadius startAngle:0 endAngle:360 clockwise:YES];
    
    if (self.bulbRed) {
        [[UIColor redColor]setFill];
    } else {
        [[UIColor grayColor]setFill];
    }

    [bulb fill];
}

- (void)flashEyes
{
    self.eyeColor = [UIColor redColor];
    [self setNeedsDisplay];
    [NSTimer scheduledTimerWithTimeInterval:.4 target:self selector:@selector(unflashEyes) userInfo:nil repeats:NO];
}

- (void)unflashEyes
{
    self.eyeColor = [UIColor yellowColor];
    [self setNeedsDisplay];
}

- (void)scaleEyes:(CGFloat)scale
{
    CGFloat newSize = scale * self.eyeRadius;
    
    // Too small
    if (newSize <= 1.0) return;
    
    // Too big
    if (newSize >= (self.head.size.height / 2)) return;

    // Adjust eye radius
    self.eyeRadius = scale * self.eyeRadius;
    
    // Redraw
    [self setNeedsDisplay];
}

@end
