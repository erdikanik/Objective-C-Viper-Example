//
//  ILAppDependecies.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILAppDependecies.h"
#import "ILRootWireframe.h"
#import "ILImageListerWireFrame.h"
#import "ILImageListerPresenter.h"
#import "ILImageListerInteractor.h"

@interface ILAppDependecies()

@property (strong, nonatomic) ILImageListerWireFrame *imageListerWireFrame;

@end

@implementation ILAppDependecies

- (instancetype)initWithWindow:(UIWindow *)window
{
    self = [super init];

    if (self)
    {
        [self configureDependeciesWithWindow:window];
    }

    return self;
}

- (void)showRootViewController
{
    [self.imageListerWireFrame presentListerInterface];
}

- (void)configureDependeciesWithWindow:(UIWindow *)window {
    ILRootWireframe *rootWireFrame = [[ILRootWireframe alloc] initWithApplicationWindow:window];

    ILImageListerInteractor *listerInteractor = [ILImageListerInteractor new];
    ILImageListerPresenter *listerPresenter = [ILImageListerPresenter new];

    self.imageListerWireFrame = [[ILImageListerWireFrame alloc] initWithRootWireFrame:rootWireFrame
                                                                      listerPresenter:listerPresenter
                                                                     listerInteractor:listerInteractor];

}



@end
