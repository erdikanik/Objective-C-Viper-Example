//
//  ILProduct.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@protocol ILResponseProtocol;

@interface ILProduct : NSObject<ILResponseProtocol>

@property (copy, nonatomic) NSString *productId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSDecimalNumber *price;
@property (copy, nonatomic) NSString *imageUrl;

@end
