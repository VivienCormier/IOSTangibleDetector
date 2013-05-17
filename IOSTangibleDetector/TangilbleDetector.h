//
//  TangilbleDetector.h
//  testAddDelegate
//
//  Created by Vivien Cormier on 05/02/13.
//
//

#import <Foundation/Foundation.h>


@protocol TangilbleDetectorDelegate <NSObject>

// Delegate Function
@required
- (void) objectDetectedWithPosition:(CGPoint)position andAngle:(float)angle;
- (void) objectisNotDetected;
@end

@interface TangilbleDetector : NSObject
{
	id <TangilbleDetectorDelegate> delegate;
}

//Property
@property (retain) id delegate;

@property (nonatomic,strong) NSMutableDictionary *allTouches;

// Public Function
- (void)touchesBegan:(NSSet *)touches;
- (void)touchesMoved:(NSSet *)touches;
- (void)touchesEnded:(NSSet *)touches;

@end