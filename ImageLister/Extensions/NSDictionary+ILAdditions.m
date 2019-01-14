//
//  NSDictionary+ILAdditions.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "NSDictionary+ILAdditions.h"
#import "ILResponseProtocol.h"

@implementation NSDictionary (ILAdditions)

- (NSArray *)mappedArrayWithKey:(NSString *)key objectClass:(Class)objectClass;
{
    NSMutableArray *mappedArray = [NSMutableArray new];

    NSArray *dictArray = [self objectForKey:key];

    for (NSDictionary *dict in dictArray)
    {
        id<ILResponseProtocol> object = [[objectClass alloc] init];
        [object loadObjectDictionary: dict];
        [mappedArray addObject:object];
    }

    return [mappedArray copy];
}


@end
