//
//  User.m
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/11/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype) initWithDictionary : (NSDictionary *) userInfo {
    self = [super init];
    if (self) {
        self.name = userInfo[@"name"];
    }
    return self;
}

@end
