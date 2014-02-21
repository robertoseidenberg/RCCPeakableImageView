//
//  RCCCollectionViewController.m
//  RCCPeakableImageSample
//
//  Created by John Clem on 2/21/14.
//  Copyright (c) 2014 John Clem. All rights reserved.
//

#import "RCCCollectionViewController.h"
#import "RCCPeakableCollectionViewCell.h"

@interface RCCCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation RCCCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    RCCAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RCCAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    static NSString *identifier = @"Cell";
    RCCPeakableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                                                           forIndexPath:indexPath];
    [cell.imageView setImage:appDelegate.images[indexPath.row]];
    [cell.imageView setPadding:CGPointMake(20.f, 20.f)];
    
    return cell;
}

@end
