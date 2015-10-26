//
//  BaseViewController.m
//  sharqa
//
//  Created by Muzammil Peer on 11/6/14.
//  Copyright (c) 2014 Omar khaled. All rights reserved.
//

#import "BaseViewController.h"

#import "AFNetworkReachabilityManager.h"

@interface BaseViewController ()
{
    
}
@end


@implementation BaseViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupBaseView];
    [self setupBaseData];
    [self addCustomBackButton];
    [self setupNavBar];
    
    
    [self setupViewController];
}


//abstraction came here
//abstraction called by setupViewController()

- (void) setupViewController
{
    [self initViews];
    [self initObjects];
    [self initNetworkCalls];
    [self initListeners];
}

- (void) initViews   //1
{
    
}

- (void) initObjects  //2
{
    
}

- (void) initNetworkCalls //3
{
    
}

- (void) initListeners //4
{
    
}




-(void) setupNavBar
{
    NSString *imageNavName  =   @"nav_bar";
    UIImage  *imageNavBar   =   [UIImage imageNamed: imageNavName];
    imageNavBar             =   [imageNavBar stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    
    [[UINavigationBar appearance] setBackgroundImage:imageNavBar forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)addCustomBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 40.0f, 40.0f)];
    UIImage *backImage = [[UIImage imageNamed:@"back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0.0f, 0, 0.0f)];
    [backButton setBackgroundImage:backImage  forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}

- (void) popBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setupBaseView
{
    //set background pattern image for whole view
    UIImageView *backgroundPatternImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_pattern"]];
    backgroundPatternImage.frame = self.view.frame;
    backgroundPatternImage.autoresizingMask = UIViewAutoresizingNone;
    
    [self.view insertSubview:backgroundPatternImage aboveSubview:self.view];
}

-(void)setupBaseData
{
    
    //set default cell identifier
    cell_identifier_table = @"defaultCellIdentifier";
    cell_identifier_collection = @"defaultCellIdentifier";
    
    //data setup
    self.datasource = [NSMutableArray new];
    self.collectionDataSource = [NSMutableArray new];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //start monitioring network state
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    //hide keyboard on disappear
    [self.view endEditing:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //hide keyboard on disappear
    [self.view endEditing:YES];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    //start monitioring network state
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

#pragma mark - ResponseProtocol

- (void)responseWithError:(NSError *)error andRequestType:(NSInteger)requestType {

    NSLog(@"error = %@", [error description]);
    
    if (kApp_ErrorInternetNotAvailable == error.code || error.code == -1009 || error.code == 306) {
    }
    else if (error.code == -1003) {
    }
    else {
    }
    
//    [self.view endEditing:YES];

}

- (void)successWithData:(id)data andRequestType:(NSInteger)requestType
{

}

- (void)hideInternetPopup {
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_identifier_table];
    
    if (cell) {
        cell.tag = indexPath.row;
        [cell updateCell:[self.datasource objectAtIndex:indexPath.row]];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma --mark CollectionViewDelegateAndDataSource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return [self.collectionDataSource count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    NSLog(@"%ld", (long)indexPath.row);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:cell_identifier_collection forIndexPath:indexPath];
    if (cell) {
        [cell updateCell:[self.collectionDataSource objectAtIndex:indexPath.row]];
    }
    return cell;
    
}





@end
