//
//  ILListerRequest.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILListerRequest.h"

static NSString *kUrlExtension = @"/cart/list";

@implementation ILListerRequest

- (NSString *)requestUrl
{
    return kUrlExtension;
}

@end
