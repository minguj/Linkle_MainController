//
//  MiddleViewController.m
//  Linkle_MainController
//
//  Created by 민구 진 on 12. 11. 5..
//  Copyright (c) 2012년 민구 진. All rights reserved.
//

#import "MiddleViewController.h"

@interface MiddleViewController ()

@end

@implementation MiddleViewController
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setLayout
{
    CGRect viewBound = [[UIScreen mainScreen] bounds];
    
    centerTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, viewBound.size.height - 64)];
    [centerTableView setDelegate:self];
    [centerTableView setDataSource:self];
    
    [self.view addSubview:centerTableView];
    [centerTableView release];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	MiddleVIewCell *cell = [tableView dequeueReusableCellWithIdentifier:MIDDLEVIEWCELL];
	cell = [[[NSBundle mainBundle] loadNibNamed:@"MiddleViewCell" owner:self options:nil] lastObject];
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260;
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
    
    leftItem = [[UIBarButtonItem alloc] initWithTitle:@"User" style:UIBarButtonSystemItemDone target:self action:@selector(showUserPage:)];
    rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Planet" style:UIBarButtonSystemItemDone target:self action:@selector(showPlanet:)];
    
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@""];
    item.leftBarButtonItem = leftItem;
    item.rightBarButtonItem = rightItem;
    item.hidesBackButton = YES;
    [_naviBar pushNavigationItem:item animated:NO];
    [leftItem release];
    [rightItem release];
    [item release];
    
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
    [_titleLabel setCenter:CGPointMake(_naviBar.center.x, _naviBar.center.y)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setText:@"UserName : Content"];
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

- (IBAction) showUserPage :(id)sender {
    [_delegate showUserPage];
}

- (IBAction) showPlanet:(id)sender {
    [_delegate showPlanet];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [super dealloc];
}

@end
