//
//  Question.h
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/10/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *questionTitle;

-(id)initWithDictionary:(NSDictionary *)questionInfo;
+(NSMutableArray*)parseJSONDataIntoQuestions : (NSData *)rawJSONData;

@end
