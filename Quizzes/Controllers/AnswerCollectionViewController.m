//
//  ImageAnswerViewController.m
//  Quizzes
//
//  Created by Wouter Willaert on 15/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "AnswerCollectionViewController.h"

static NSString *CellIdentifier = @"Cell";

@implementation AnswerCollectionViewController

#pragma mark - View Lifecycle

- (void)loadView {
//    UICollectionViewLayout *collectionViewLayout = [[UICollectionViewLayout alloc] init];
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectNull collectionViewLayout:collectionViewLayout];
//    collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    collectionView.delegate = self;
//    collectionView.dataSource = self;
//    [collectionView setBackgroundColor:[UIColor whiteColor]];
//    [collectionView reloadData];
//
//    self.view = collectionView;
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewLayout *collectionViewLayout = [[UICollectionViewLayout alloc] init];
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewFlowLayout.collectionView
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewLayout];
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    [collectionView reloadData];
    
    [self.view addSubview:collectionView];
    
    //[(UICollectionView *)self.view registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return self.options.count;
    return 4;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    //UIImage *img = self.options[indexPath.row];
    UIImage *img = [UIImage imageNamed:@"ember"];
    [cell addSubview:[[UIImageView alloc] initWithImage:img]];
    
    return cell;
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate answerViewController:self didSelectAnswerAtIndex:indexPath.row];
    
    NSString *option = self.options[indexPath.row];
    NSLog(@"Option selected: %@.", option);
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *option = self.options[indexPath.row];
    NSLog(@"Option deselected: %@.", option);
}

#pragma mark – UICollectionView DelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *img = self.options[indexPath.row];
    
    CGSize size = img.size.width > 0 ? img.size : CGSizeMake(100, 100);
    size.height += 35;
    size.width += 35;
    
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

@end
