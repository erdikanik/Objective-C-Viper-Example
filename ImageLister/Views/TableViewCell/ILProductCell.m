//
//  ILProductCell.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILProductCell.h"

@interface ILProductCell()

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation ILProductCell

- (void)setDetailText:(NSString *)detailText
{
    _detailText = detailText;
    self.detailLabel.text = detailText;
    [self layoutIfNeeded];
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

@end
