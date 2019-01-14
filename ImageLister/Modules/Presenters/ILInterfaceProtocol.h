//
//  ILInterfaceProtocol.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@protocol ILInterfacePresentProtocol <NSObject>

- (void)setImageOfImageView:(UIImageView *)imageView
                 imageIndex:(NSUInteger)imageIndex;
- (void)loadData;

@end

@protocol ILInterfaceModuleProtocol <NSObject>

- (void)reloadData:(NSArray <NSString *>*)productDetails;

@end
