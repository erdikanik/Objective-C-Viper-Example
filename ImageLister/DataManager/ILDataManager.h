//
//  ILDataManager.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILProduct.h"

@interface ILDataManager : NSObject

/**
 Shared instance of data manager

 @return Instance of data manager
 */
+ (instancetype)sharedManager;

/**
 Saves product

 @param product Product object
 @return YES if saved
 */
- (BOOL)saveProduct:(ILProduct *)product;

/**
 Product entity

 @return Product entity objects
 */
- (NSArray<ILProduct *> *)productEntities;

/**
 Deletes all entities by entityName

 @param entityName Name of entity
 @return YES if succeed
 */
- (BOOL)deleteAllEntitiesWithEntityName:(NSString *)entityName;

@end
