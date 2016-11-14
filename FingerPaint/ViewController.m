//
//  ViewController.m
//  FingerPaint
//
//  Created by Suvan Ramani on 2016-11-11.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blackIndicator;
@property (weak, nonatomic) IBOutlet UIView *blueIndicator;
@property (weak, nonatomic) IBOutlet UIView *redIndicator;
@property (weak, nonatomic) IBOutlet UIView *greenIndicator;

@property (strong, nonatomic) IBOutlet DrawingView *drawingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.drawingView.layer.borderWidth = 3;
    
    self.blackIndicator.layer.cornerRadius = 6;
    self.blueIndicator.layer.cornerRadius = 6;
    self.redIndicator.layer.cornerRadius = 6;
    self.greenIndicator.layer.cornerRadius = 6;
    
    self.blackIndicator.backgroundColor = [UIColor blackColor];
    self.blueIndicator.backgroundColor = [UIColor whiteColor];
    self.redIndicator.backgroundColor = [UIColor whiteColor];
    self.greenIndicator.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)blackButton:(UIButton *)sender {
    
    self.drawingView.currentColour = [UIColor blackColor];
    [self changeIndicatorStatus:self.blackIndicator];
}

- (IBAction)blueButton:(UIButton *)sender {
    
    self.drawingView.currentColour = [UIColor blueColor];
    [self changeIndicatorStatus:self.blueIndicator];
}

- (IBAction)redButton:(UIButton *)sender {
    
    self.drawingView.currentColour = [UIColor redColor];
    [self changeIndicatorStatus:self.redIndicator];
}

- (IBAction)greenButton:(UIButton *)sender {
    
    self.drawingView.currentColour = [UIColor greenColor];
    [self changeIndicatorStatus:self.greenIndicator];
}



-(void)changeIndicatorStatus:(UIView *)newView {
    
    newView.backgroundColor = [UIColor blackColor];
    
    if ([newView isEqual:self.blackIndicator]) {
        self.blueIndicator.backgroundColor = [UIColor whiteColor];
        self.redIndicator.backgroundColor = [UIColor whiteColor];
        self.greenIndicator.backgroundColor = [UIColor whiteColor];
    } else if ([newView isEqual:self.blueIndicator]) {
        self.blackIndicator.backgroundColor = [UIColor whiteColor];
        self.redIndicator.backgroundColor = [UIColor whiteColor];
        self.greenIndicator.backgroundColor = [UIColor whiteColor];
    } else if ([newView isEqual:self.redIndicator]) {
        self.blackIndicator.backgroundColor = [UIColor whiteColor];
        self.blueIndicator.backgroundColor = [UIColor whiteColor];
        self.greenIndicator.backgroundColor = [UIColor whiteColor];
    } else if ([newView isEqual:self.greenIndicator]) {
        self.blackIndicator.backgroundColor = [UIColor whiteColor];
        self.blueIndicator.backgroundColor = [UIColor whiteColor];
        self.redIndicator.backgroundColor = [UIColor whiteColor];
    }
}






@end
