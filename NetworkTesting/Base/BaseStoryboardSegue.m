//
//  BaseStoryboardSegue.m
//  sharqa
//
//  Created by Muzammil Peer on 11/6/14.
//  Copyright (c) 2014 Omar khaled. All rights reserved.
//

#import "BaseStoryboardSegue.h"

@implementation BaseStoryboardSegue

-(void)perform
{
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    [sourceViewController.navigationController pushViewController:destinationViewController animated:NO];
}

@end
