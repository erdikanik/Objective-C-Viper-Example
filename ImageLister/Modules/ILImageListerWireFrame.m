//
//  ILImageListerWireFrame.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILImageListerWireFrame.h"
#import "ILRootWireframe.h"
#import "ILImageListerViewController.h"
#import "ILImageListerPresenter.h"
#import "ILImageListerInteractor.h"

static NSString* kStoryboardId = @"Lister";

@interface ILImageListerWireFrame()

@property (strong, nonatomic) ILRootWireframe *rootWireFrame;
@property (strong, nonatomic) ILImageListerInteractor *interactor;
@property (strong, nonatomic) ILImageListerPresenter *presenter;

@end

@implementation ILImageListerWireFrame

- (instancetype)initWithRootWireFrame:(ILRootWireframe *)rootWireFrame
                      listerPresenter:(ILImageListerPresenter *)listerPresenter
                     listerInteractor:(ILImageListerInteractor *)listerInteractor
{
    self = [super init];

    if (self)
    {
        _rootWireFrame = rootWireFrame;
        _interactor = listerInteractor;
        _presenter = listerPresenter;
    }

    return self;
}

- (void)presentListerInterface
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kStoryboardId bundle:nil];
    ILImageListerViewController *viewController =
    [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ILImageListerViewController class])];

    viewController.interfacePresenter = self.presenter;
    self.presenter.interfaceModule = viewController;

    self.interactor.interactorOutput = self.presenter;
    self.presenter.interactorModule = self.interactor;

    [self.rootWireFrame showRootViewController:viewController];
}

@end
