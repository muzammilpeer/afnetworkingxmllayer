//
//  NetworkManager.h
//  Communique
//
//  Created by Hussain Mansoor on 7/2/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestProtocol.h"
#import "BaseNetworkBean.h"

@interface BaseNetworkRequest : NSObject <RequestProtocol>
{
    
@protected BaseNetworkBean* localDataModel;
}

//default initializations
- (instancetype)initWithModel:(BaseNetworkBean*)model ofRequestType:(NSInteger)type;


@property (nonatomic) NSInteger requestType;

- (NSString *) url;

- (BOOL) haveGetData;
- (NSDictionary *) getData;

- (BOOL) havePostData;
- (NSDictionary *) postData;

- (BOOL) haveImageData;
- (UIImage*) imageData;

- (BOOL) havePostXMLData;
- (NSString*) xmlData;


@end
