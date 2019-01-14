//
//  ILImageListerPresenter.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILImageListerPresenter.h"
#import "ILInterfaceProtocol.h"
#import "ILImageListerInteractorIO.h"
#import "ILProduct.h"

static NSString *kDefaultImage = @"defaultImage";

@interface ILImageListerPresenter()

@end

@implementation ILImageListerPresenter

- (void)setImageOfImageView:(UIImageView *)imageView imageIndex:(NSUInteger)imageIndex
{
    imageView.image = [UIImage imageNamed:kDefaultImage];

    [self.interactorModule imageDataWithIndex:imageIndex completion:^(NSData *data) {
        if (data)
        {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                imageView.image = [UIImage imageWithData:data];
            }];
        }
    }];
}

- (void)loadData
{
    [self.interactorModule needProducts];
}

- (void)updateIncomingProducts
{
    NSArray *products = [self.interactorModule incomingProducts];
    NSMutableArray<NSString *> *productDetailArray = [NSMutableArray new];

    for (ILProduct *product in products)
    {
        NSString *detail = [NSString stringWithFormat:@"%@\n%li", product.name, product.price.integerValue];
        [productDetailArray addObject: detail];
    }

    [self.interfaceModule reloadData: [productDetailArray copy]];
}

@end
