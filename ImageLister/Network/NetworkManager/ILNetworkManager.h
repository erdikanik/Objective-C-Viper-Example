//
//  ILNetworkManager.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@protocol ILRequestProtocol;
@protocol ILResponseProtocol;

@interface ILNetworkManager : NSObject

/**
 ILNetworkManager static instance

 @return Instance of ILNetworkManager
 */
+ (instancetype)sharedManager;

/**
 Fetchs data by given request

 @param request Request object
 @param responseClass Class of response object
 @param completion Completion block
 */
- (void)connectWithGETMethod:(id<ILRequestProtocol>)request
               responseClass:(Class)responseClass
                  completion:(void(^)(id<ILResponseProtocol>, NSError *))completion;

@end
