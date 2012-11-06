//
//  ViewController.m
//  Linkle_MainController
//
//  Created by 민구 진 on 12. 11. 3..
//  Copyright (c) 2012년 민구 진. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)initGesture
{
    leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showLeft:)];
    leftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    leftRecognizer.numberOfTouchesRequired = 1;
    leftRecognizer.delegate = self;
    [_middleWingController.view addGestureRecognizer:leftRecognizer];
    
    rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showRight:)];
    rightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    rightRecognizer.numberOfTouchesRequired = 1;
    rightRecognizer.delegate = self;
    [_middleWingController.view addGestureRecognizer:rightRecognizer];

}

- (void)viewDidLoad
{
    CGRect viewBound = [[UIScreen mainScreen] bounds];
        
    _leftWingController = [[LeftWingController alloc] init];
    [_leftWingController.view setBackgroundColor:[UIColor whiteColor]];
    [_leftWingController.view setFrame:CGRectMake(0, 0, 320, viewBound.size.height)];
    [_leftWingController setLayout];
    
    //[_leftWingController.view setBackgroundColor:[UIColor blueColor]];
    
    _rightWingController = [[RightWingController alloc] init];
    [_rightWingController.view setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:_leftWingController.view];
    [self.view addSubview:_rightWingController.view];
    
    _middleWingController = [[MiddleViewController alloc] init];
    [_middleWingController setLayout];
    [_middleWingController setDelegate:self];
    [self.view addSubview:_middleWingController.view];
    [_middleWingController.view setFrame:CGRectMake(0, 0, 320, viewBound.size.height)];
    
    [self initGesture];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) dealloc
{
    [_leftWingController release];
    [_rightWingController release];
    [_middleWingController release];
    [super dealloc];
}

- (IBAction) showLeft :(id)sender
{
    //NSLog(@"left : %f", _middleWingController.view.frame.origin.x);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    
    if( _middleWingController.view.frame.origin.x > - SWIPSIZE ){
        [_middleWingController.view setFrame:CGRectMake(_middleWingController.view.frame.origin.x - SWIPSIZE, _middleWingController.view.frame.origin.y, _middleWingController.view.frame.size.width, _middleWingController.view.frame.size.height)];
    }
    [UIView commitAnimations];
    
    if(_middleWingController.view.frame.origin.x == -SWIPSIZE)
        [self.view sendSubviewToBack:_leftWingController.view];
}

- (IBAction) showRight :(id)sender
{
    //NSLog(@"right : %f", _middleWingController.view.frame.origin.x);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];

    if( _middleWingController.view.frame.origin.x < SWIPSIZE ){
        [_middleWingController.view setFrame:CGRectMake(_middleWingController.view.frame.origin.x + SWIPSIZE, _middleWingController.view.frame.origin.y, _middleWingController.view.frame.size.width, _middleWingController.view.frame.size.height)];
    }
    [UIView commitAnimations];
    
    if(_middleWingController.view.frame.origin.x == SWIPSIZE)
        [self.view sendSubviewToBack:_rightWingController.view];
}

- (void) showUserPage
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    
    if( _middleWingController.view.frame.origin.x < SWIPSIZE ){
        [_middleWingController.view setFrame:CGRectMake(_middleWingController.view.frame.origin.x + SWIPSIZE, _middleWingController.view.frame.origin.y, _middleWingController.view.frame.size.width, _middleWingController.view.frame.size.height)];
    }
    else{
        [_middleWingController.view setFrame:CGRectMake(_middleWingController.view.frame.origin.x - SWIPSIZE, _middleWingController.view.frame.origin.y, _middleWingController.view.frame.size.width, _middleWingController.view.frame.size.height)];
    }
    [UIView commitAnimations];
    
    if(_middleWingController.view.frame.origin.x == SWIPSIZE)
        [self.view sendSubviewToBack:_rightWingController.view];
}

- (void) showPlanet
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    
    if( _middleWingController.view.frame.origin.x > - SWIPSIZE ){
        [_middleWingController.view setFrame:CGRectMake(_middleWingController.view.frame.origin.x - SWIPSIZE, _middleWingController.view.frame.origin.y, _middleWingController.view.frame.size.width, _middleWingController.view.frame.size.height)];
    }
    else{
        [_middleWingController.view setFrame:CGRectMake(_middleWingController.view.frame.origin.x + SWIPSIZE, _middleWingController.view.frame.origin.y, _middleWingController.view.frame.size.width, _middleWingController.view.frame.size.height)];
    }
    [UIView commitAnimations];
    
    if(_middleWingController.view.frame.origin.x == -SWIPSIZE)
        [self.view sendSubviewToBack:_leftWingController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
