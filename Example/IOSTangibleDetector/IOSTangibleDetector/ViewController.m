//
//  ViewController.m
//  IOSTangibleDetector
//
//  Created by CORMIER Viven on 17/05/13.
//  Copyright (c) 2013 CORMIER Viven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //init the detector
    self.tangibleDetector = [[TangilbleDetector alloc]init];
    self.tangibleDetector.delegate = self;
    self.view.multipleTouchEnabled = YES;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{[self.tangibleDetector touchesBegan:touches];}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{[self.tangibleDetector touchesMoved:touches];}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{[self.tangibleDetector touchesEnded:touches];}

- (void)objectDetectedWithPosition:(CGPoint)position andAngle:(float)angle{
    
    // (CGPoint)position
    // position of object
    
    // (float)angle
    // angle of object
    
}

- (void)objectisNotDetected{
    
    // if object is Detected
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
