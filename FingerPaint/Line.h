//
//  Line.h
//  FingerPaint
//
//  Created by Suvan Ramani on 2016-11-11.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Line : NSObject

@property (nonatomic, strong) NSMutableArray *listOfPoints;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) float lineWidth;

- (instancetype)initWithColor:(UIColor *)color;


@end
