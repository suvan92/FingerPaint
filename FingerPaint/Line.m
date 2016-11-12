//
//  Line.m
//  FingerPaint
//
//  Created by Suvan Ramani on 2016-11-11.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)initWithColor:(UIColor *)color
{
    self = [super init];
    if (self) {
        self.listOfPoints = [[NSMutableArray alloc] init];
        self.lineWidth = 2;
        self.color = [UIColor blackColor];
    }
    return self;
}


@end
