//
//  Node.h
//  CopyDemo
//
//  Created by CJ Lin on 2016/11/16.
//  Copyright © 2016年 cj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject <NSCopying>

@property (nonatomic, strong) Node *left;
@property (nonatomic, copy) NSString *val;

- (instancetype)initWithVal:(NSString *)val;

@end
