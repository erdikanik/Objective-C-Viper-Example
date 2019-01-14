//
//  ILImageListerWireFrame.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@class ILRootWireframe;
@class ILImageListerPresenter;
@class ILImageListerInteractor;

@interface ILImageListerWireFrame : NSObject

/**
 Initializer method

 @param rootWireFrame Initial wire frame
 @param listerPresenter Lister presenter
 @param listerInteractor Lister interactor
 @return Instance of ILImageListerWireFrame
 */
- (instancetype)initWithRootWireFrame:(ILRootWireframe *)rootWireFrame
                      listerPresenter:(ILImageListerPresenter *)listerPresenter
                     listerInteractor:(ILImageListerInteractor *)listerInteractor;

/**
 Present initial window
 */
- (void)presentListerInterface;

@end
