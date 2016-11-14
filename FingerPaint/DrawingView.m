//
//  DrawingView.m
//  FingerPaint
//
//  Created by Suvan Ramani on 2016-11-11.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "DrawingView.h"
#import "Line.h"

@implementation DrawingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                             action:@selector(drawHandler:)];
        [self addGestureRecognizer:self.panGR];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                             action:@selector(drawHandler:)];
        [self addGestureRecognizer:self.panGR];
        
        self.listOfLines = [[NSMutableArray alloc] init];
        
        self.currentColour = [UIColor blackColor];
        
    }
    return self;
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    NSMutableArray *listOfPaths = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.listOfLines.count; i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [listOfPaths addObject:path];
    }
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
    
    for (int i = 0; i < listOfPaths.count; i++) {
        
        UIBezierPath *currentPath = listOfPaths[i];
        
        Line *currentLine = self.listOfLines[i];
        
        [currentLine.color setStroke];
        
        for (int i = 0; i < currentLine.listOfPoints.count; i++) {
            
            CGPoint currentPoint = [currentLine.listOfPoints[i] CGPointValue];
            
            if (i == 0) {
                [currentPath moveToPoint:currentPoint];
            } else {
                [currentPath addLineToPoint:currentPoint];
            }
            
        }
        
        [currentPath stroke];
    }
}

-(void)drawHandler:(UIPanGestureRecognizer *)panGR {
    
    if(panGR.state == UIGestureRecognizerStateBegan) {
        Line *newLine = [[Line alloc] initWithColor:self.currentColour];
        [newLine.listOfPoints addObject:[NSValue valueWithCGPoint:[panGR locationInView:self]]];
        [self.listOfLines addObject:newLine];
//        NSLog(@"New line created: %@", NSStringFromCGPoint([panGR locationInView:self]));
//        NSLog(@"%ld", (long) self.listOfLines.count);
    } else if (panGR.state == UIGestureRecognizerStateChanged) {
        Line *currentLine = [self.listOfLines lastObject];
        [currentLine.listOfPoints addObject:[NSValue valueWithCGPoint:[panGR locationInView:self]]];
//        NSLog(@"Moved points: %@", NSStringFromCGPoint([panGR locationInView:self]));
//        NSLog(@"%ld", (long) currentLine.listOfPoints.count);
    }
    [self setNeedsDisplay];
}


@end
