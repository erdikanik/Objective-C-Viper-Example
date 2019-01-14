//
//  ILResponseProtocol.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@protocol ILResponseProtocol

/**
 Loads object dictionary for mapping

 @param dictionary Dictionary object
 */
- (void)loadObjectDictionary:(NSDictionary *)dictionary;

@end
