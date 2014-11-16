//
//  QuestionTests.m
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/12/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Question.h"

@interface QuestionTests : XCTestCase

@end

@implementation QuestionTests


- (void)testQuetionParsing {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSArray *questions = [Question parseJSONDataIntoQuestions:jsonData];
    Question *firstQuestion = [questions firstObject];
    Question *secondQuestion = questions[1];
    XCTAssertEqualObjects(firstQuestion.questionTitle, @"Test", "Title should be equal");
    XCTAssertEqualObjects(secondQuestion.questionTitle, @"Swift AVAudioEngine crash: player started when in a disconnected state", "Title should be equal");
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
