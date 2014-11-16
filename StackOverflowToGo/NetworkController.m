//
//  NetworkController.m
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/10/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import "NetworkController.h"

// to make private properties for the class
@interface NetworkController()

@property (nonatomic, strong) NSURLSession *mySession;
@property (strong, nonatomic) NSURLSessionConfiguration *configuration;
@property (strong, nonatomic) NSString *publicKey;

@end


@implementation NetworkController

// using blocks. type of success is the whole thing in front of it
- (void) searchQuestionsWithTag: (NSString *)tagString completionHandler: (void (^)(NSError *error, NSMutableArray *questions))success {
    
    self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.mySession = [NSURLSession sessionWithConfiguration:self.configuration];
    self.publicKey = @"bpRaFcC5jRk)b7bw9F9k1g((";
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow", tagString]];
    //NSLog(@"%@", url);
    
    
    NSString *oAuthKey = [[NSUserDefaults standardUserDefaults] valueForKey:@"access_token"];
    NSLog(@"oAuthKey:%@", oAuthKey);
    if (oAuthKey) {
        NSURL *urlWithOAuth = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow&access_token=%@&key=%@", tagString,oAuthKey,self.publicKey]];
        url = urlWithOAuth;
    }
    NSLog(@"%@", url);
    
    NSURLSessionDataTask *dataTask = [self.mySession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if (httpResponse.statusCode >= 200 && httpResponse.statusCode <= 204) {
                NSLog(@"got response");
                NSMutableArray *questions = [Question parseJSONDataIntoQuestions:data];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    success(nil, questions);
                }];
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    success(error, nil);
                }];
                //NSLog(@"Bad Response with Status Code: %ld", (long)httpResponse.statusCode);
            }
            
        }
    }];
    [dataTask resume];
}


@end
