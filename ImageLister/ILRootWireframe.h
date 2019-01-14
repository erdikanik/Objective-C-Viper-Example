//
//  ILRootWireframe.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@interface ILRootWireframe : NSObject

/**
 Initialize root view controller

 @param window Application window
 @return Instance of ILRootWireframe
 */
- (instancetype)initWithApplicationWindow:(UIWindow *)window;

/**
 Root navigation controller
 */
@property (strong, nonatomic) UINavigationController *navigationController;

/**
 Shows root navigation controller

 @param viewController Parent view controller
 */
- (void)showRootViewController:(UIViewController *)viewController;

@end
