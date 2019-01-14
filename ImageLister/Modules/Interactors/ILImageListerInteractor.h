//
//  ILImageListerInteractor.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILImageListerInteractorIO.h"

@interface ILImageListerInteractor : NSObject<ILImageListerInteractorInput>

@property (weak, nonatomic) id<ILImageListerInteractorOutput> interactorOutput;

@end
