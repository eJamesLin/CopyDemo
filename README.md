# CopyDemo

A demo project for some `copy` related phenomenon of obj-c
cover:
- shallow copy 
- deep copy
- implementation of `copyWithZone` using `allocWithZone`
- override of `copyWithZone`
- should use `self class` when calling `allocWithZone` aka `[[[self class] allocWithZone:zone] init];`
- access ivar directly will not follow the copy attributed property
