//
//  QuestionSearchViewController.m
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/10/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import "QuestionSearchViewController.h"

@interface QuestionSearchViewController ()

@end

@implementation QuestionSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _appDelegate =  [[UIApplication sharedApplication] delegate];
}



#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    Question *newQuestion = self.questions[indexPath.row];
    cell.textLabel.text = [newQuestion questionTitle];
    return cell;
}

#pragma mark - UISearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *tagString = self.searchBar.text;
    [[_appDelegate networkController] searchQuestionsWithTag:tagString completionHandler:^(NSError *error, NSMutableArray *questions) {
        if (error) {
            NSLog(@"error message: %@",error.localizedDescription);
        } else {
            self.questions = questions;
            [self.tableView reloadData];
            [self.searchBar resignFirstResponder];
        }
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
