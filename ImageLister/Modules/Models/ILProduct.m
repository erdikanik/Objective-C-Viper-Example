//
//  ILProduct.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILProduct.h"
#import "ILResponseProtocol.h"

static NSString *kProductId = @"product_id";
static NSString *kName = @"name";
static NSString *kPrice = @"price";
static NSString *kImageUrl = @"image";

@implementation ILProduct

- (void)loadObjectDictionary:(NSDictionary *)dictionary
{
    self.productId = [dictionary objectForKey:kProductId];
    self.name = [dictionary objectForKey:kName];
    self.price = [dictionary objectForKey:kPrice];
    self.imageUrl = [dictionary objectForKey:kImageUrl];
}

@end
