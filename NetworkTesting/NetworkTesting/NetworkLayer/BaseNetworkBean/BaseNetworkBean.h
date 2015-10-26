//
//  BaseNetworkBean.h
//  Communique
//
//  Created by Hussain Mansoor on 8/1/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetworkBean : NSObject 
{
    
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
