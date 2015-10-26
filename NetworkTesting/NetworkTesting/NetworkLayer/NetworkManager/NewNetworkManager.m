//
//  NetworkFactory.m
//  Communique
//
//  Created by Hussain Mansoor on 7/2/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import "NewNetworkManager.h"
#import "FLSingleton.h"
#import "AFHTTPRequestOperationManager.h"
#import "Constants.h"
#import "ResponseProtocol.h"

@interface NewNetworkManager ()

- (void) respondto:(id<ResponseProtocol>)delegate WithError:(NSError *)error requestType:(NSInteger) type;
- (void) respondto:(id<ResponseProtocol>)delegate WithData:(id)data requestType:(NSInteger) type;

@end

@implementation NewNetworkManager

_FL_MAKE_SINGLETON(NewNetworkManager);

- (void) executeRequest:(BaseNetworkRequest *)request withDelegate:(id<ResponseProtocol>)delegate {
    [self executeRequest:request withDelegate:delegate requestType:[request requestType]];
}


- (void) executeRequest:(BaseNetworkRequest *)request withDelegate:(id<ResponseProtocol>)delegate requestType:(NSInteger)requestType {
    
    if (nil == request) {
        [self respondto:delegate WithError:nil requestType:request.requestType];
    }
    
//    if (![AFNetworkReachabilityManager sharedManager].reachable) {
//        [self respondto:delegate WithError:[NSError errorWithDomain:@"local" code:kApp_ErrorInternetNotAvailable userInfo:nil] requestType:requestType];
//        return;
//    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    if ([request havePostData]) {
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];

        manager.securityPolicy.allowInvalidCertificates = YES;
        
        AFHTTPRequestOperation *operation = [manager POST:[request url] parameters:[request postData]
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
                  [self respondto:delegate WithData:responseObject requestType:requestType];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithError:error requestType:requestType];
        }];
        operation.userInfo = @{kNetworkManagerKey_RequestType:[NSNumber numberWithInteger:requestType]};
    }
    else if ([request haveGetData]) {
        AFHTTPRequestOperation *operation = [manager GET:[request url] parameters:[request getData] success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithData:responseObject requestType:requestType];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithError:error requestType:requestType];
        }];
        operation.userInfo = @{kNetworkManagerKey_RequestType:[NSNumber numberWithInteger:requestType]};
    }
    else if ([request havePostXMLData]) {
        
        
        
        NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"PAWTK2J1QMXK8J4JJ53KINJ17JDP8R3D", @""];
        NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
        NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];

        
        NSMutableURLRequest *nRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[request url]]];
        [nRequest setHTTPMethod: @"POST"];
        [nRequest setValue:@"text/xml" forHTTPHeaderField:@"content-type"];
        [nRequest setHTTPBody:[[request xmlData] dataUsingEncoding:NSUTF8StringEncoding]];
        [nRequest setValue:authValue forHTTPHeaderField:@"Authorization"];

        
        AFHTTPRequestOperation *nOperation = [[AFHTTPRequestOperation alloc] initWithRequest:nRequest];
        
        // Make sure to set the responseSerializer correctly
        nOperation.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [nOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithData:responseObject requestType:requestType];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithError:error requestType:requestType];
        }];
        nOperation.userInfo = @{kNetworkManagerKey_RequestType:[NSNumber numberWithInteger:requestType]};
        [nOperation start];
    }
    else if ([request haveImageData]) {

        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        AFJSONResponseSerializer *jsonReponseSerializer = [AFJSONResponseSerializer serializer];
        // This will make the AFJSONResponseSerializer accept any content type
        jsonReponseSerializer.acceptableContentTypes = nil;
        manager.responseSerializer = jsonReponseSerializer;
        
        
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain; charset=utf-8"];
        
        AFHTTPRequestOperation *operation = [manager POST:[request url] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {

            [formData appendPartWithFileData:UIImagePNGRepresentation([request imageData]) name:@"images" fileName:@"image.png" mimeType:@"*/*"];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithData:responseObject requestType:requestType];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithError:error requestType:requestType];
        }];
        operation.userInfo = @{kNetworkManagerKey_RequestType:[NSNumber numberWithInteger:requestType]};
    }
    else {
        AFHTTPRequestOperation *operation = [manager GET:[request url] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithData:responseObject requestType:requestType];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
            [self respondto:delegate WithError:error requestType:requestType];
        }];
        operation.userInfo = @{kNetworkManagerKey_RequestType:[NSNumber numberWithInteger:requestType]};
    }
}

- (void) respondto:(id<ResponseProtocol>)delegate WithError:(NSError *) error requestType:(NSInteger) type {
    if (nil != delegate && [delegate respondsToSelector:@selector(responseWithError:andRequestType:)]) {
        [delegate responseWithError:error andRequestType:type];
    }
}

- (void) respondto:(id<ResponseProtocol>)delegate WithData:(id)data requestType:(NSInteger) type {
    if (nil != delegate && [delegate respondsToSelector:@selector(successWithData:andRequestType:)]) {
        [delegate successWithData:data andRequestType:type];
    }
}

@end
