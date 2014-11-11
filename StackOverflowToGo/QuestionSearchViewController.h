//
//  QuestionSearchViewController.h
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/10/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkController.h"
#import "Question.h"
#import "AppDelegate.h"

@interface QuestionSearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *questions;
@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NetworkController *networkController;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;



@end
