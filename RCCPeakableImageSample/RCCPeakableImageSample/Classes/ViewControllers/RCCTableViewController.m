//
//  RCCTableViewController.m
//  RCCPeakableImageSample
//
//  Created by John Clem on 2/21/14.
//  Copyright (c) 2014 RCCBox. All rights reserved.
//

#import "RCCTableViewController.h"
#import "RCCPeakableTableViewCell.h"

@implementation RCCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    RCCAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    RCCAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    RCCPeakableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell.peakableImageView setImage:appDelegate.images[indexPath.row]];
    [cell.peakableImageView setPadding:CGPointMake(20.f, 20.f)];
    
    return cell;
}
@end
