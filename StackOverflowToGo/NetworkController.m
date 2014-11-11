//
//  NetworkController.m
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/10/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController


- (void) searchQuestionsWithTag: (NSString *)tagString completionHandler: (void (^)(NSError *error, NSMutableArray *questions))success {
    
    self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.mySession = [NSURLSession sessionWithConfiguration:self.configuration];
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://api.stackexchange.com//2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow", tagString]];
    NSLog(@"%@", url);
    
    NSURLSessionDataTask *dataTask = [self.mySession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error != 0) {
            NSLog(@"%@",error.localizedDescription);
        }else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if (httpResponse.statusCode >= 200 && httpResponse.statusCode <= 204) {
                NSLog(@"got response");
                NSMutableArray *questions = [Question parseJSONDataIntoQuestions:data];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    success(nil, questions);
                }];
            } else {
                NSLog(@"Bad Response with Status Code: %d", httpResponse.statusCode);
            }
            
        }
    }];
    [dataTask resume];
}


@end
