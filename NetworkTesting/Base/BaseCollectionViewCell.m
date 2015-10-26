//
//  collectionViewBaseCellCollectionViewCell.m
//  collectionViewTest
//
//  Created by Faran Rasheed on 27/11/2014.
//  Copyright (c) 2014 Faran Rasheed. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

-(void)updateCell:(id)model
{
    NSLog(@"%@",[NSString stringWithFormat:@"You must override method '%@' in %@", NSStringFromSelector(_cmd),NSStringFromClass([self class])]);
}
@end
