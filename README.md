IOSTangibleDetector
===================

<p>Detect tangible objects on iOS. Tangible objects are physical objects detected on screen.<br/>
Currently, TangibleDetector detect only one object with 3 contact points.<br/>
Beta version : V 0.9</p>

How To Get Started
------------------

<p>Add "TangilbleDetector.h" and "TangilbleDetector.m" in your xcodeprojet. Import the .h file :</p>
``` objective-c
#import "TangilbleDetector.h"
```


<p>Init the TangilbleDetector and multitouch :</p>
``` objective-c
    TangilbleDetector *tangibleDetector = [[TangilbleDetector alloc]init];
    self.tangibleDetector.delegate = self;
    self.view.multipleTouchEnabled = YES;
```

Add touch functions
-------------------

``` objective-c
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{[self.tangibleDetector touchesBegan:touches];}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{[self.tangibleDetector touchesMoved:touches];}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{[self.tangibleDetector touchesEnded:touches];}
```

Edit TangilbleDetector.m
------------------------

<p>Change value to distance to touch :</p>
``` objective-c
int DistanceObject1 = 125;
int DistanceObject2 = 119;
int DistanceObject3 = 110;
```

Get the position and angle of the object
----------------------------------------

<p>Use delegate function in your view :</p>
``` objective-c
- (void)objectDetectedWithPosition:(CGPoint)position andAngle:(float)angle{
    
    // (CGPoint)position
    // position of object
    
    // (float)angle
    // angle of object
    
}

- (void)objectisNotDetected{
    
    // if object is Detected
    
}
```
