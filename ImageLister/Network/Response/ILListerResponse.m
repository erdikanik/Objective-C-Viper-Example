//
//  ILListerResponse.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILListerResponse.h"
#import "ILProduct.h"
#import "NSDictionary+ILAdditions.h"
#import "ILProduct.h"

static NSString *kProducts = @"products";

@interface ILListerResponse()

@property (nonatomic, copy, readwrite) NSArray<ILProduct *> *products;

@end

@implementation ILListerResponse

- (void)loadObjectDictionary:(NSDictionary *)dictionary
{
    self.products = [dictionary mappedArrayWithKey:kProducts objectClass: [ILProduct class]];
}

@end
