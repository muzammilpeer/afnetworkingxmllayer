//
//  SaveApplicationDetailRequest.h
//  sharqa
//
//  Created by Faran Rasheed on 20/02/2015.
//  Copyright (c) 2015 Sytems Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveApplicationDetailRequest : BaseNetworkRequest

- (instancetype)initWithModel:(NSString* )model;

@end
