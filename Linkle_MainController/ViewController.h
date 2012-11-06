//
//  ViewController.h
//  Linkle_MainController
//
//  Created by 민구 진 on 12. 11. 3..
//  Copyright (c) 2012년 민구 진. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LeftWingController.h"
#import "RightWingController.h"
#import "MiddleViewController.h"

#define SWIPSIZE 280

@interface ViewController : UIViewController <UIGestureRecognizerDelegate, MiddleViewControllerDelegate>
{
    LeftWingController* _leftWingController;
    RightWingController* _rightWingController;
    MiddleViewController* _middleWingController;
    
    UISwipeGestureRecognizer *leftRecognizer;
    UISwipeGestureRecognizer *rightRecognizer;
}

- (void) showUserPage ;
- (void) showPlanet ;

@end
