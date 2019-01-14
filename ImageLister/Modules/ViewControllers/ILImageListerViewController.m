//
//  ILImageListerViewController.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILImageListerViewController.h"
#import "ILInterfaceProtocol.h"
#import "ILProductCell.h"

@interface ILImageListerViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *listerTableView;
@property (copy, nonatomic) NSArray <NSString *>* productDetails;

@end

@implementation ILImageListerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:NSStringFromClass(ILProductCell.class)
                                bundle:[NSBundle mainBundle]];
    [self.listerTableView registerNib:nib forCellReuseIdentifier:NSStringFromClass(ILProductCell.class)];

    [self.interfacePresenter loadData];

}

- (void)reloadData:(NSArray <NSString *>*)productDetails
{
    self.productDetails = productDetails;
    [self.listerTableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO:
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.productDetails)
    {
        return self.productDetails.count;
    }

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ILProductCell *productCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(ILProductCell.class)];
    
    [self.interfacePresenter setImageOfImageView:productCell.cellImageView imageIndex:indexPath.row];
    productCell.detailText = self.productDetails[indexPath.row];

    return productCell;
}

@end
