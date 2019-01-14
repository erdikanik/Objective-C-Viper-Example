//
//  ILImageListerPresenter.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILImageListerInteractorIO.h"
#import "ILInterfaceProtocol.h"

@class ILImageListerViewController;
@class ILImageListerInteractor;

@interface ILImageListerPresenter : NSObject<ILInterfacePresentProtocol, ILImageListerInteractorOutput>

/**
 Interface object
 */
@property (weak, nonatomic) id<ILInterfaceModuleProtocol> interfaceModule;

/**
 Interactor module
 */
@property (weak, nonatomic) id<ILImageListerInteractorInput> interactorModule;

@end
