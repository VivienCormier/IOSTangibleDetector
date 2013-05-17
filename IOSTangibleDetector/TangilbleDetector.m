//
//  TangilbleDetector.m
//  testAddDelegate
//
//  Created by Vivien Cormier on 05/02/13.
//
//

#import "TangilbleDetector.h"

#include <sys/types.h>
#include <sys/sysctl.h>

@implementation TangilbleDetector

@synthesize delegate;

//Distance Point Object
int DistanceObject1 = 125;
int DistanceObject2 = 119;
int DistanceObject3 = 110;

#pragma mark - Init

- (id)init{
    
    // On Initialise le tableau comptenant les Touchs
    self.allTouches = [[NSMutableDictionary alloc]init];
    
    //Detect iPad Mini
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    
    if ([platform isEqualToString:@"iPad2,5"] || [platform isEqualToString:@"iPad2,6"]  || [platform isEqualToString:@"iPad2,7"] ) {
        DistanceObject1 = DistanceObject1 * 1.2f;
        DistanceObject2 = DistanceObject2 * 1.2f;
        DistanceObject3 = DistanceObject3 * 1.2f;
    }
    
    return self;
}

#pragma mark - Public Function

- (void)touchesBegan:(NSSet *)touches{
    
    for (UITouch *touch in touches) {
        
        // Création d'une key pour chaque Touch
        NSValue *touchValue = [NSValue valueWithPointer:(const void *)(touch)];
        NSString *key = [NSString stringWithFormat:@"%@", touchValue];
        
        //Enregistrement du touch dans un dictionnary
        [self.allTouches setObject:touch forKey:key];
        
	}
    
    //On lance le calcule des distance
    [self calculationsDistance];
    
}

- (void)touchesMoved:(NSSet *)touches{
    //On lance le calcule des distance
    [self calculationsDistance];
}

- (void)touchesEnded:(NSSet *)touches{
    
    for (UITouch *touch in touches) {
        
        // Création d'une key pour chaque Touch
        NSValue *touchValue = [NSValue valueWithPointer:(const void *)(touch)];
        NSString *key = [NSString stringWithFormat:@"%@", touchValue];
        
        // Supression du touch
        [self.allTouches removeObjectForKey:key];
	}
    
    //On lance le calcule des distance
    [self calculationsDistance];
    
}

# pragma mark - Distance Calculations

//Cette fonction est lancé quand la position des touches changent
- (void)calculationsDistance{
    
    
        
    
    int i=0,y,x1,x2,y1,y2,sommeX=0,sommeY=0;
    
    NSEnumerator *enume1 = [self.allTouches objectEnumerator];
    UITouch *touch1,*touch2;
    
    NSMutableArray *allDistance = [[NSMutableArray alloc] init];

    if ([self.allTouches count] == 3) {
     
        while(touch1 = [enume1 nextObject]) {
            
            CGPoint touchLocation1 = [touch1 locationInView:touch1.view];
            x1 = touchLocation1.x;
            y1 = touchLocation1.y;
            
            sommeX += x1;
            sommeY += y1;
            
            NSEnumerator *enume2 = [self.allTouches objectEnumerator];
            y=0;
            
            while(touch2 = [enume2 nextObject]) {
                
                if (i < y) {
                    
                    CGPoint touchLocation2 = [touch2 locationInView:touch2.view];
                    x2 = touchLocation2.x;
                    y2 = touchLocation2.y;
                    
                    int distance = sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
                    
                    [allDistance addObject:[NSNumber numberWithInt:distance]];
                    
                }
                
                y++;
            }
            i++;
        }
        
    }
    
    BOOL distance1Detec = NO;
    BOOL distance2Detec = NO;
    BOOL distance3Detec = NO;
    
    if ([allDistance count] == 3) {
        
        // On rehcrehce si un des coté est egale à la distance1
        for(id item in allDistance)
        {
            int distance = [item intValue];
            
            if (distance < DistanceObject1 + 10 && distance > DistanceObject1 - 10) {
                distance1Detec = TRUE;
            }
        }
        
        
        // On rehcrehce si un des coté est egale à la distance2
        for(id item in allDistance)
        {
            int distance = [item intValue];
            
            if (distance < DistanceObject2 + 10 && distance > DistanceObject2 - 10) {
                distance2Detec = TRUE;
            }
        }
        
        // On rehcrehce si un des coté est egale à la distance3
        for(id item in allDistance)
        {
            int distance = [item intValue];
            
            if (distance < DistanceObject3 + 10 && distance > DistanceObject3 - 10) {
                distance3Detec = TRUE;
            }
        }
        
    }
    
    if (distance1Detec && distance2Detec && distance3Detec) {
        
        double middelRectX = sommeX/3;
        double middleRectY = sommeY/3;
        
        CGPoint point;
        point.x = middelRectX;
        point.y = middleRectY;
        
        CGPoint u ;
        u.x = 0;
        u.y = 0 - middleRectY;
        
        CGPoint v ;
        v.x = x1 -  middelRectX;
        v.y = y1 - middleRectY;
        
        double cosa = ((u.x * v.x) + (u.y * v.y)) / (sqrt((u.x * u.x) + (u.y * u.y)) * sqrt((v.x * v.x) + (v.y * v.y)));
        
        double angle = acos(cosa);
        
        int sign = (u.x * v.y - u.y * v.x) > 0 ? 1 : -1;
        
        float finalAngle = angle*sign;
        
        [[self delegate] objectDetectedWithPosition:point andAngle:finalAngle];
        
    }else{
        [[self delegate] objectisNotDetected];
    }


}

@end

