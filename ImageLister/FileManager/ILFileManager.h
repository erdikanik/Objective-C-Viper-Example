//
//  ILFileManager.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@interface ILFileManager : NSObject

/**
 Shared instance of file manager

 @return Instance of file manager
 */
+ (instancetype)sharedManager;

/**
 Creates folder to save photos

 @return YES if succeed
 */
- (BOOL)createProductsImageFolder;

/**
 Delete product image folder

 @return YES if succeed
 */
- (BOOL)deleteProductsFolder;

/**
 Find data of image with given index

 @param index Index of file
 @return Image data
 */
- (NSData *)imageDataWithGivenIndex:(NSUInteger)index;

/**
 Saves image to images folder

 @param index Index of image
 @param data Image data
 */
- (void)saveImageWithGivenIndex:(NSUInteger)index data:(NSData *)data;

@end
