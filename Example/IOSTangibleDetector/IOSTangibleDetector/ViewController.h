//
//  ViewController.h
//  IOSTangibleDetector
//
//  Created by CORMIER Viven on 17/05/13.
//  Copyright (c) 2013 CORMIER Viven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TangilbleDetector.h"

@interface ViewController : UIViewController<TangilbleDetectorDelegate>

@property (nonatomic, strong) TangilbleDetector *tangibleDetector;

@end
