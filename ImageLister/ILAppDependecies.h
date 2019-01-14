//
//  ILAppDependecies.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@interface ILAppDependecies : NSObject

/**
 Initialize with windows

 @param window App window
 @return Instance of ILAppDependecies
 */
- (instancetype)initWithWindow:(UIWindow *)window;

/**
 Shows root view controller and starts flow
 */
- (void)showRootViewController;

@end
