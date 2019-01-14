//
//  ILRootWireframe.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILRootWireframe.h"
#import "ILImageListerWireFrame.h"
#import "ILImageListerViewController.h"

static NSString* kStoryboardId = @"Lister";

@interface ILRootWireframe()

@property (weak, nonatomic) UIWindow *window;

@end

@implementation ILRootWireframe

- (instancetype)initWithApplicationWindow:(UIWindow *)window
{
    self = [super init];
    if (self)
    {
        _window = window;
    }

    return self;
}

- (void)showRootViewController:(UIViewController *)viewController
{
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.navigationController = controller;
    self.window.rootViewController = controller;
}

@end
