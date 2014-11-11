//
//  NetworkController.h
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/10/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface NetworkController : NSObject



- (void) searchQuestionsWithTag: (NSString *)tagString completionHandler: (void (^)(NSError *error, NSMutableArray *questions))success;


@end
