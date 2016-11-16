//
//  Node.m
//  CopyDemo
//
//  Created by CJ Lin on 2016/11/16.
//  Copyright © 2016年 cj. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithVal:(NSString *)val
{
    self = [super init];
    if (self) {
//        _val = val; //set ivar directly will not use the 'copy' attributes
        self.val = val; //set val using setter will follow the 'copy' attributes
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    Node *newNode = [[[self class] allocWithZone:zone] init];
    if (newNode) {
        newNode->_left = [_left copyWithZone:zone];
        newNode->_val = [_val copyWithZone:zone];
    }
    return newNode;
}

@end
