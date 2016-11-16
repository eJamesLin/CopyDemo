//
//  PowerNode.m
//  CopyDemo
//
//  Created by CJ Lin on 2016/11/16.
//  Copyright © 2016年 cj. All rights reserved.
//

#import "PowerNode.h"

@implementation PowerNode

- (instancetype)initByIvarWithCopiedVal:(NSString *)copiedVal
{
    self = [super init];
    if (self) {
        _copiedVal = copiedVal;
    }
    return self;

}
- (instancetype)initBySetterWithCopiedVal:(NSString *)copiedVal
{
    self = [super init];
    if (self) {
        self.copiedVal = copiedVal;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    PowerNode *newNode = [super copyWithZone:zone];
    newNode->_copiedVal = [_copiedVal copyWithZone:zone];
    return newNode;
}

- (void)setCopiedValSetterOverride:(NSString *)copiedValSetterOverride
{
    // should add copy if need to honor the 'copy' attribute
    // _copiedValSetterOverride = [copiedValSetterOverride copy];
    _copiedValSetterOverride = copiedValSetterOverride;
}

@end
