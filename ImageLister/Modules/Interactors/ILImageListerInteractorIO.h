//
//  ILImageListerInteractorIO.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@class ILProduct;

@protocol ILImageListerInteractorInput <NSObject>

- (void)needProducts;
- (void)imageDataWithIndex:(NSUInteger)index completion:(void(^)(NSData *))completion;
- (NSArray<ILProduct *> *)incomingProducts;

@end

@protocol ILImageListerInteractorOutput <NSObject>

- (void)updateIncomingProducts;

@end
