//
//  CategoryItemListController.m
//  JAVBus
//
//  Created by mgfjx on 2018/12/27.
//  Copyright © 2018 mgfjx. All rights reserved.
//

#import "CategoryItemListController.h"

@interface CategoryItemListController ()

@end

@implementation CategoryItemListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.model.title ;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestData:(BOOL)refresh {
    if (refresh) {
        self.page = 1;;
    }else{
        self.page ++;
    }
    
    [HTMLTOJSONMANAGER parseCategoryListUrl:self.model.link page:self.page callback:^(NSArray *array) {
        [self.collectionView stopHeaderRefreshing];
        [self.collectionView stopFooterRefreshing];
        
        if (array.count == 0) {
            return ;
        }
        
        NSMutableArray *arr ;
        if (refresh) {
            arr = [NSMutableArray array];
        }else{
            arr = [NSMutableArray arrayWithArray:self.dataArray];
        }
        [arr addObjectsFromArray:array];
        self.dataArray = [arr copy];
        [self.collectionView reloadData];
    }];
    
}

@end
