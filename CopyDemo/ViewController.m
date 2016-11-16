//
//  ViewController.m
//  CopyDemo
//
//  Created by CJ Lin on 2016/11/16.
//  Copyright © 2016年 cj. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"
#import "PowerNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    Node *a = [[Node alloc] initWithVal:@"a"];
    Node *a1 = [[Node alloc] initWithVal:@"a1"];
    a.left = a1;

    Node *b = [a copy];
    b.left.val = @"b1";
    b.val = @"b";

    NSLog(@"%@ %@ %@", a.val, a.left.val, NSStringFromClass(a.class)); //a a1 Node
    NSLog(@"%@ %@ %@", b.val, b.left.val, NSStringFromClass(b.class)); //b b1 Node

    PowerNode *p = [[PowerNode alloc] initWithVal:@"p_val"];
    p.copiedVal = @"p_copyVal";

    PowerNode *p1 = [p copy];
    p1.copiedVal = @"p1_copyVal";

    NSLog(@"%@ %@ %@", p.val, p.copiedVal, NSStringFromClass(p.class));     //p_val p_copyVal PowerNode
    NSLog(@"%@ %@ %@", p1.val, p1.copiedVal, NSStringFromClass(p1.class));  //p_val p1_copyVal PowerNode

    NSArray *array = @[a, a1];
    NSArray *array1 = [array copy];
    NSArray *array2 = [array copyWithZone:nil];
    NSArray *array3 = [[NSArray alloc] initWithArray:array copyItems:YES];

    NSLog(@"%@", array);
    NSLog(@"%@", array1); //shallow copy
    NSLog(@"%@", array2); //shallow copy
    NSLog(@"%@", array3); //One-level-deep copy

    NSObject *qq = [[NSObject alloc] init];
    NSObject *qq1 = [[NSObject alloc] init];
    NSArray *qqarray = @[qq, qq1];
    NSArray *qqarray1 = [qqarray copy];
    NSArray *qqarray2 = [qqarray copyWithZone:nil];
    // NSArray *qqarray3 = [[NSArray alloc] initWithArray:qqarray copyItems:YES];
    // crash at [NSObject copyWithZone:]: unrecognized selector sent to instance

    NSLog(@"%@", qqarray);
    NSLog(@"%@", qqarray1);
    NSLog(@"%@", qqarray2);
    // NSLog(@"%@", qqarray3);

    PowerNode *node = [[PowerNode alloc] init];
    NSMutableString *string = [[NSMutableString alloc] initWithString:@"123"];
    node.copiedVal = string;
    node.strongVal = string;
    node.copiedValSetterOverride = string;

    [string appendString:@"456"];

    NSLog(@"%@", node.copiedVal); //123
    NSLog(@"%@", node.strongVal); //123456
    NSLog(@"%@", node.copiedValSetterOverride); //123456 should be 123, but override of setter in implementation cause the copy property to break

    NSMutableString *stringA = [[NSMutableString alloc] initWithString:@"A"];
    PowerNode *node1 = [[PowerNode alloc] initByIvarWithCopiedVal:stringA];
    PowerNode *node2 = [[PowerNode alloc] initBySetterWithCopiedVal:stringA];
    [stringA appendString:@"B"];
    NSLog(@"%@", node1.copiedVal); //AB
    NSLog(@"%@", node2.copiedVal); //A
}

@end
