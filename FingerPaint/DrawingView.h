//
//  DrawingView.h
//  FingerPaint
//
//  Created by Suvan Ramani on 2016-11-11.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingView : UIView

@property (nonatomic, strong) UIColor *currentColour;
@property (nonatomic, strong) UIPanGestureRecognizer *panGR;
@property (nonatomic, strong) NSMutableArray *listOfLines;


@end
