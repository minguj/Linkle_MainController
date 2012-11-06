//
//  MiddleVIewCell.m
//  Linkle_MainController
//
//  Created by 민구 진 on 12. 11. 5..
//  Copyright (c) 2012년 민구 진. All rights reserved.
//

#import "MiddleVIewCell.h"

@implementation MiddleVIewCell
@synthesize cellImage = _cellImage;
@synthesize cellLabel = _cellLabel;
@synthesize leftButton = _leftButton;
@synthesize middleButton = _middleButton;
@synthesize rightButton = _rightButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)dealloc
{
    [_cellImage release];
    [_cellLabel release];
    [_leftButton release];
    [_middleButton release];
    [_rightButton release];
    
    [super dealloc];
}

@end
