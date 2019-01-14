//
//  NSDictionary+ILAdditions.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@interface NSDictionary (ILAdditions)

/**
 Maps dictionary object to given class and create an array

 @param ley Key of array
 @param objectClass Class of object
 @return An array of given object class
 */
- (NSArray *)mappedArrayWithKey:(NSString *)key objectClass:(Class)objectClass;

@end
