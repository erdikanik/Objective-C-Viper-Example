//
//  ILImageListerInteractor.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILImageListerInteractor.h"
#import "ILProduct.h"
#import "ILNetworkManager.h"
#import "ILListerRequest.h"
#import "ILListerResponse.h"
#import "ILDataManager.h"
#import "ILFileManager.h"
#import "ILImageListerInteractorIO.h"

static NSString *kProductEntityName = @"Product";

@interface ILImageListerInteractor()

@property (copy, nonatomic) NSArray<NSString *> *imageUrlArray;
@property (copy, nonatomic) NSArray<ILProduct *> *productArray;

@end

@implementation ILImageListerInteractor

- (void)needProducts
{
    ILListerRequest *listerRequest = [ILListerRequest new];
    [[ILNetworkManager sharedManager] connectWithGETMethod:listerRequest responseClass:[ILListerResponse class] completion:^(ILListerResponse *response, NSError *error) {

        if (!error)
        {
            [[ILFileManager sharedManager] deleteProductsFolder];
            [[ILFileManager sharedManager] createProductsImageFolder];

            NSMutableArray <NSString *> *imageUrlArray = [NSMutableArray new];

            [[ILDataManager sharedManager] deleteAllEntitiesWithEntityName:kProductEntityName];
            for (ILProduct *product in response.products)
            {
                [[ILDataManager sharedManager] saveProduct:product];
                [imageUrlArray addObject:product.imageUrl];
            }

            self.imageUrlArray = [imageUrlArray copy];
            self.productArray = [response.products copy];;
            [self.interactorOutput updateIncomingProducts];
        }
    }];
}

- (NSArray<ILProduct *> *)incomingProducts
{
    if (self.productArray == nil)
    {
       self.productArray = [[ILDataManager sharedManager] productEntities];
    }

    return self.productArray;
}

- (void)imageDataWithIndex:(NSUInteger)index completion:(void(^)(NSData *))completion
{
    if (!completion)
    {
        return;
    }

    NSData *imageData = [[ILFileManager sharedManager] imageDataWithGivenIndex:index];

    if (imageData)
    {
        completion(imageData);
    }
    else
    {
        if (self.imageUrlArray)
        {
            NSURL *url = [NSURL URLWithString:self.imageUrlArray[index]];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error == nil) {
                    [[ILFileManager sharedManager] saveImageWithGivenIndex:index data:data];
                    completion(data);
                }
            }];

            [dataTask resume];
        }
    }
}

@end
