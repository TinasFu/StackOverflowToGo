//
//  Question.m
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/10/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import "Question.h"



@implementation Question

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        //
//    }
//    return self;
//}

-(id)initWithDictionary:(NSDictionary *)questionInfo {
    
    self = [super init];
    if (self) {
        self.questionTitle = questionInfo[@"title"];
    }
    return self;
}

+(NSMutableArray *)parseJSONDataIntoQuestions : (NSData *)rawJSONData {
    NSError *error;
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options:0 error:&error];
    
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    } else {
        NSArray *itemArray = JSONDictionary[@"items"];
        NSMutableArray *questions = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in itemArray) {
            Question *newQuestion = [[Question alloc]initWithDictionary:dictionary];
            [questions addObject:newQuestion];
        }
        return questions;
    }
    return nil;
}


@end
