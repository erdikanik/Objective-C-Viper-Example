//
//  ILImageListerViewController.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILInterfaceProtocol.h"

@class ILImageListerPresenter;

@interface ILImageListerViewController : UIViewController <ILInterfaceModuleProtocol>

/**
 Connects to presenter
 */
@property (weak, nonatomic) id<ILInterfacePresentProtocol> interfacePresenter;

@end
