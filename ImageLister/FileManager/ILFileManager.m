//
//  ILFileManager.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILFileManager.h"

static NSString *kProductsImageFolder = @"Images";
static NSString *kProductsImageExtension = @".jpg";

@implementation ILFileManager

+ (instancetype)sharedManager
{
    static ILFileManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ILFileManager alloc] init];
    });
    return sharedManager;
}

- (BOOL)createProductsImageFolder
{
    NSError *error = nil;

    [[NSFileManager defaultManager] createDirectoryAtPath:[self productFolderPath] withIntermediateDirectories:YES attributes:nil error:&error];

    return error == nil;
}

- (BOOL)deleteProductsFolder
{
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:[self productFolderPath] error:&error];
    return error == nil;
}

- (NSData *)imageDataWithGivenIndex:(NSUInteger)index
{
    NSString *imageName = [@(index).stringValue stringByAppendingString:kProductsImageExtension];
    NSString *imageUrl = [[[self productFolderPath] stringByAppendingString:@"/"] stringByAppendingString:imageName];
    NSURL *url = [NSURL fileURLWithPath:imageUrl];
    return [NSData dataWithContentsOfURL:url];
}

- (void)saveImageWithGivenIndex:(NSUInteger)index data:(NSData *)data
{
    NSString *imageName = [@(index).stringValue stringByAppendingString:kProductsImageExtension];
    NSString *imageUrl = [[[self productFolderPath] stringByAppendingString:@"/"] stringByAppendingString:imageName];
    [data writeToURL:[NSURL fileURLWithPath:imageUrl] atomically:YES];
}

- (NSString *)productFolderPath
{
    NSArray<NSString *> *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = paths.firstObject;
    NSString *folderPath = [[documentsPath stringByAppendingString:@"/"] stringByAppendingString:kProductsImageFolder];

    return folderPath;
}

@end
