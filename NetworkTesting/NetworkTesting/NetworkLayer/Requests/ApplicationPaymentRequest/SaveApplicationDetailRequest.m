//
//  SaveApplicationDetailRequest.m
//  sharqa
//
//  Created by Faran Rasheed on 20/02/2015.
//  Copyright (c) 2015 Sytems Ltd. All rights reserved.
//

#import "SaveApplicationDetailRequest.h"
#import "Constants.h"

@interface SaveApplicationDetailRequest ()
{
    NSString* xmlString;
}
@end

@implementation SaveApplicationDetailRequest

- (instancetype)initWithModel:(NSString* )model
{
    self = [super init];
    if (self) {
        xmlString = model;
    }
    return self;
}

- (NSString *) url {
    NSString *url = [NSString stringWithFormat:@"%@%@",kURL_base,kURL_PostCustomerDetail];
    NSLog(@"%@",url);
    return url;
}

-(BOOL) havePostXMLData {
    return YES;
}

-(NSString *) xmlData {
    NSLog(@"xml  = %@",xmlString);
    return xmlString;
}

@end
