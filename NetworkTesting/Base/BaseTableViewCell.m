//
//  BaseTableViewCell.m
//  sharqa
//
//  Created by Muzammil Peer on 11/12/14.
//  Copyright (c) 2014 Sytems Ltd. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateCell:(id)model
{
    NSLog(@"%@",[NSString stringWithFormat:@"You must override method '%@' in %@", NSStringFromSelector(_cmd),NSStringFromClass([self class])]);
}
@end
