//
//  PowerNode.h
//  CopyDemo
//
//  Created by CJ Lin on 2016/11/16.
//  Copyright © 2016年 cj. All rights reserved.
//

#import "Node.h"

@interface PowerNode : Node

@property (nonatomic, copy) NSString *copiedVal;

@property (nonatomic, strong) NSString *strongVal;

@property (nonatomic, copy) NSString *copiedValSetterOverride;

- (instancetype)initByIvarWithCopiedVal:(NSString *)copiedVal;
- (instancetype)initBySetterWithCopiedVal:(NSString *)copiedVal;

@end
