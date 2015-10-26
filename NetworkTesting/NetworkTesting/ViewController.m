//
//  ViewController.m
//  NetworkTesting
//
//  Created by Muzammil Peer on 10/26/15.
//  Copyright (c) 2015 Muzammil Peer. All rights reserved.
//

#import "ViewController.h"
#import "SaveApplicationDetailRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self postCustomerDataRequest];
    
}

- (void) postCustomerDataRequest
{
    NSString* xmlData = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\"><customer><passwd>saad123</passwd>    <lastname>Saad</lastname><firstname>Siddiqui</firstname><email>saad.siddiqui@geekunit.com</email></customer></prestashop>";
    
    SaveApplicationDetailRequest *req = [[SaveApplicationDetailRequest alloc] initWithModel:xmlData];
    
    [[NewNetworkManager sharedInstance] executeRequest:req withDelegate:self requestType:kRequestType_PostCustomerDetail];

}


- (void)responseWithError:(NSError *)error andRequestType:(NSInteger)requestType {
    
    NSLog(@"error = %@", [error description]);
    
    if (requestType == kRequestType_PostCustomerDetail)
    {
        
    }
    
}

- (void)successWithData:(id) data andRequestType:(NSInteger)requestType {
    NSLog(@"success %@", data);
    
    if (kRequestType_PostCustomerDetail == requestType) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
