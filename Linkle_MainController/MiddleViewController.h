//
//  MiddleViewController.h
//  Linkle_MainController
//
//  Created by 민구 진 on 12. 11. 5..
//  Copyright (c) 2012년 민구 진. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "MiddleVIewCell.h"

#define CONTENTCOUNT 5

@protocol MiddleViewControllerDelegate <NSObject>

- (void) showUserPage ;
- (void) showPlanet ;

@end

@interface MiddleViewController : UIViewController <UITableViewDataSource,
                                                    UITableViewDelegate,
                                                    MiddleViewControllerDelegate> {
    UITableView *centerTableView;
    
    UINavigationBar* _naviBar;
    UILabel* _titleLabel;
    
    UIBarButtonItem *leftItem;
    UIBarButtonItem *rightItem;
                                                        
    id<MiddleViewControllerDelegate> _delegate;
}

- (void) setLayout;
- (IBAction) showUserPage :(id)sender;
- (IBAction) showPlanet:(id)sender;

@property (nonatomic, assign) id<MiddleViewControllerDelegate> delegate;

@end
