//
//  BaseViewController.h
//  sharqa
//
//  Created by Muzammil Peer on 11/6/14.
//  Copyright (c) 2014 Omar khaled. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#import "BaseTableViewCell.h"
#import "BaseCollectionViewCell.h"
#import "ResponseProtocol.h"

#define borderColorForRect RGBA(187, 187, 187,1.0)

@interface BaseViewController : UIViewController<ResponseProtocol,UITableViewDataSource,UITableViewDelegate, CLLocationManagerDelegate,
UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

{
    @protected NSString *cell_identifier_table;
    @protected NSString *cell_identifier_collection;
    
}

@property (nonatomic, strong) id sharedData;

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) NSMutableArray *collectionDataSource;

@property(nonatomic, retain) CLLocationManager *locationManager;

- (void) popBack;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;



//abstraction called by setupViewController()

- (void) initViews;   //1
- (void) initObjects;  //2
- (void) initNetworkCalls; //3
- (void) initListeners; //4


@end
