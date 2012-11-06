//
//  LeftWingController.m
//  Linkle_MainController
//
//  Created by 민구 진 on 12. 11. 5..
//  Copyright (c) 2012년 민구 진. All rights reserved.
//

#import "LeftWingController.h"

@interface LeftWingController ()

@end

@implementation LeftWingController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setLayout {
    CGRect viewBound = [[UIScreen mainScreen] bounds];
    
    _infographicView = [[UIView alloc] initWithFrame:CGRectMake(10, 54, 270, 180)];
    _infographicView.layer.borderColor = [[UIColor blackColor] CGColor];
    _infographicView.layer.borderWidth = 2.0f;
    
    _profileImage = [[UIButton alloc] initWithFrame:CGRectMake(20, 164, 55, 55)];
    [_profileImage.layer setMasksToBounds:YES];
    _profileImage.layer.cornerRadius = 5.0f;
    _profileImage.layer.borderColor = [[UIColor blackColor] CGColor];
    _profileImage.layer.borderWidth = 2.0f;
    
    NSString* userName = [NSString stringWithFormat:@"USER NAME"];
    CGSize nameSize = [userName sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(200, 45) lineBreakMode:NSLineBreakByTruncatingTail];
    _userName = [[UILabel alloc] initWithFrame:CGRectMake( _profileImage.frame.origin.x + _profileImage.frame.size.width + 5 , 0, nameSize.width, nameSize.height)];
    [_userName setCenter:CGPointMake(_userName.center.x, _profileImage.center.y)];
    [_userName setText:userName];
    [_userName setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:_infographicView];
    [self.view addSubview:_profileImage];
    [self.view addSubview:_userName];
    
    [_infographicView release];
    [_profileImage release];
    [_userName release];
    
    _AtButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_AtButton setFrame:CGRectMake(15, 244, 44, 44)];
    _DoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_DoButton setFrame:CGRectMake(69, 244, 44, 44)];
    _WithButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_WithButton setFrame:CGRectMake(123, 244, 44, 44)];
    _PicButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_PicButton setFrame:CGRectMake(177, 244, 44, 44)];
    [self.view addSubview:_AtButton];
    [self.view addSubview:_DoButton];
    [self.view addSubview:_WithButton];
    [self.view addSubview:_PicButton];
    [_AtButton release];
    [_DoButton release];
    [_WithButton release];
    [_PicButton release];
    
    CGFloat bottomY = _AtButton.frame.origin.y + _AtButton.frame.size.height + 10;
    _bottomMenuList = [[UITableView alloc] initWithFrame:CGRectMake(10, bottomY, 295, viewBound.size.height - (bottomY + 40))];
    [_bottomMenuList setDataSource:self];
    [_bottomMenuList setDelegate:self];
    [self.view addSubview:_bottomMenuList];
    [_bottomMenuList release];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	LeftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LEFTVIEWCELL];
	cell = [[[NSBundle mainBundle] loadNibNamed:@"LeftViewCell" owner:self options:nil] lastObject];
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return CONTENTCOUNT;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _naviBar = [[UINavigationBar alloc] init];
    [_naviBar setFrame:CGRectMake(0, 0, 320, 44)];
    [_naviBar setBarStyle:UIBarStyleBlack];
    
    //    UIImage *image = [UIImage imageNamed:@"nav_bt_alarm_nor@2x.png"];
    //    UIImage *selImage = [UIImage imageNamed:@"nav_bt_alarm_sel@2x.png"];
    //
    //    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    leftButton.bounds = CGRectMake( 0, 0, image.size.width / 2, image.size.height / 2 );
    //    [leftButton setImage:image forState:UIControlStateNormal];
    //    [leftButton setImage:selImage forState:UIControlStateHighlighted];
    //    [leftButton addTarget:self action:@selector(notiShow:) forControlEvents:UIControlEventTouchUpInside];
    
//    leftItem = [[UIBarButtonItem alloc] initWithTitle:@"User" style:UIBarButtonSystemItemDone target:self action:@selector(showUserPage:)];
//    rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Planet" style:UIBarButtonSystemItemDone target:self action:@selector(showPlanet:)];
    
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@""];
//    item.leftBarButtonItem = leftItem;
//    item.rightBarButtonItem = rightItem;
    item.hidesBackButton = YES;
    [_naviBar pushNavigationItem:item animated:NO];
//    [leftItem release];
//    [rightItem release];
    [item release];
    
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
    [_titleLabel setCenter:CGPointMake(_naviBar.center.x, _naviBar.center.y)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setText:@"UserName"];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_naviBar addSubview:_titleLabel];
    [_titleLabel release];
    
    [self setNaviTitle:_titleLabel.text];
    
    [self.view addSubview:_naviBar];
    [_naviBar release];
	// Do any additional setup after loading the view.
}

- (void) setNaviTitle : (NSString *)title
{
    CGSize titleSize = [title sizeWithFont:[UIFont boldSystemFontOfSize:12.0f] constrainedToSize:CGSizeMake(240, 30) lineBreakMode:NSLineBreakByTruncatingTail];
    [_titleLabel setFrame:CGRectMake(10, 10, titleSize.width, titleSize.height)];
    [_titleLabel setCenter:CGPointMake(_naviBar.center.x, _naviBar.center.y)];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:12.0f]];
    [_titleLabel setText:title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
