//
//  LeftWingController.h
//  Linkle_MainController
//
//  Created by 민구 진 on 12. 11. 5..
//  Copyright (c) 2012년 민구 진. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LeftViewCell.h"

#define CONTENTCOUNT 5;

@interface LeftWingController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UIView* _infographicView;
    UIButton* _profileImage;
    UILabel* _userName;
    
    UIButton* _AtButton;
    UIButton* _DoButton;
    UIButton* _WithButton;
    UIButton* _PicButton;
    
    UITableView* _bottomMenuList;

    UINavigationBar* _naviBar;
    UIBarButtonItem* leftItem;
    UIBarButtonItem* rightItem;
    UILabel* _titleLabel;
}

- (void) setLayout;

@end
