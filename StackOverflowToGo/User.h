//
//  User.h
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/11/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;

- (instancetype) initWithDictionary : (NSDictionary *) userInfo;

@end
