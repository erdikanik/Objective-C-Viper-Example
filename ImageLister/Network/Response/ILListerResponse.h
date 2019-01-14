//
//  ILListerResponse.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILResponseProtocol.h"
@class ILProduct;

@interface ILListerResponse : NSObject<ILResponseProtocol>

@property (nonatomic, copy, readonly) NSArray<ILProduct *> *products;

@end
