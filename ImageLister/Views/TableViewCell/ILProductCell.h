//
//  ILProductCell.h
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

@interface ILProductCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (copy, nonatomic) NSString *detailText;

@end
