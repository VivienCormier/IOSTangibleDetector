IOSTangibleDetector
===================

<p>Detect tangible objects on iOS. Tangible objects are physical objects detected on screen.<br/>
Currently, TangibleDetector detect only one object with 3 contact points.<br/>
Beta version : V 0.9.1</p>

Screenshot & Demo Video
-----------------------

<p>To see a demo video, click <a href="http://www.youtube.com/watch?v=bl94ax5rZGA&feature=youtu.be" target="_blank">here</a></p>
<a href="http://www.youtube.com/watch?v=bl94ax5rZGA&feature=youtu.be" target="_blank">
  <img alt="ScreenShot Demo Video" src="https://github.com/VivienCormier/IOSTangibleDetector/blob/master/Example/IOSTangibleDetector/IOSTangibleDetector/example.jpg?raw=true" />
</a>


How To Get Started
------------------

<p>Distance to point : </p>
<img alt="ScreenShot Demo Video" src="https://github.com/VivienCormier/IOSTangibleDetector/blob/master/Example/IOSTangibleDetector/IOSTangibleDetector/example2.jpg?raw=true" />

<p>Add "TangilbleDetector.h" and "TangilbleDetector.m" in your xcodeprojet. Import the .h file :</p>
``` objective-c
#import "TangilbleDetector.h"
```

<p>Add Delegate TangibleDetector :</p>
``` objective-c
@interface M_01 : CCLayer<TangilbleDetectorDelegate>
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
int DistanceObjectMin = 96;
int DistanceObjectLong1 = 111;
int DistanceObjectLong2 = 111;
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
