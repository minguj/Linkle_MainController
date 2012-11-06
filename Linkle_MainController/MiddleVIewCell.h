//
//  MiddleVIewCell.h
//  Linkle_MainController
//
//  Created by 민구 진 on 12. 11. 5..
//  Copyright (c) 2012년 민구 진. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MIDDLEVIEWCELL @"MiddleViewCell"

@interface MiddleVIewCell : UITableViewCell
{
    UIImageView* _cellImage;
    UILabel* _cellLabel;
    
    UIButton* _leftButton;
    UIButton* _middleButton;
    UIButton* _rightButton;
}

@property (nonatomic, retain) IBOutlet UIImageView* cellImage;
@property (nonatomic, retain) IBOutlet UILabel* cellLabel;
@property (nonatomic, retain) IBOutlet UIButton* leftButton;
@property (nonatomic, retain) IBOutlet UIButton* middleButton;
@property (nonatomic, retain) IBOutlet UIButton* rightButton;

@end
