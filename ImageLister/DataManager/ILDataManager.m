//
//  ILDataManager.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "ILDataManager.h"
#import "AppDelegate.h"

static NSString *kProductEntityName = @"Product";
static NSString *kPriceAttribute = @"price";
static NSString *kIdAttribute = @"Id";
static NSString *kNameAttribute = @"name";

@implementation ILDataManager

+ (instancetype)sharedManager
{
    static ILDataManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ILDataManager alloc] init];
    });
    return sharedManager;
}

- (BOOL)saveProduct:(ILProduct *)product
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *managedContext = [appDelegate persistentContainer].viewContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:kProductEntityName inManagedObjectContext:managedContext];
    NSManagedObject *entity = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:managedContext];

    [entity setValue:product.productId forKey:kIdAttribute];
    [entity setValue:product.price forKey:kPriceAttribute];
    [entity setValue:product.name forKey:kNameAttribute];

    NSError *error = nil;
    [managedContext save: &error];
    [managedContext refreshAllObjects];

    return error == nil;
}

- (NSArray<ILProduct *> *)productEntities
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *managedContext = [appDelegate persistentContainer].viewContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:kProductEntityName];
    NSPredicate *predicate = [NSPredicate predicateWithValue:YES];
    fetchRequest.predicate = predicate;

    NSError *error = nil;
    NSArray<NSManagedObject *> *objects = [managedContext executeFetchRequest:fetchRequest error:&error];

    if (error)
    {
        return nil;
    }

    NSMutableArray<ILProduct *>* productArray = [NSMutableArray new];

    for (NSManagedObject *obj in objects)
    {
        NSString *productId = [obj valueForKey:kIdAttribute];
        NSDecimalNumber *price = [obj valueForKey:kPriceAttribute];
        NSString *name = [obj valueForKey:kNameAttribute];

        ILProduct *product = [ILProduct new];
        product.productId = productId;
        product.price = price;
        product.name = name;

        [productArray addObject:product];
    }

    return [productArray copy];
}

- (BOOL)deleteAllEntitiesWithEntityName:(NSString *)entityName
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:entityName];
    NSBatchDeleteRequest *deleteRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];

    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *managedContext = [appDelegate persistentContainer].viewContext;

    NSError *error;
    [managedContext executeRequest:deleteRequest error:&error];
    [managedContext save:&error];

    return error == nil;
}

@end
