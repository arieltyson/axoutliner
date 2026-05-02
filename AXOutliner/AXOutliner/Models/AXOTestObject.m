//
//  AXOTestObject.m
//  AXOutliner
//

#import "AXOTestObject.h"

@implementation AXOTestObject

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = [name copy];
        _children = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addChild:(AXOTestObject *)child {
    [_children addObject:child];
}

- (NSString *)summary {
    return [NSString stringWithFormat:@"<%@: name='%@', children=%lu>",
            NSStringFromClass([self class]),
            _name,
            (unsigned long)_children.count];
}

- (void)dealloc {
    NSLog(@"[AXOTestObject] '%@' deallocated", _name);
}

- (NSString *)description {
    return [self summary];
}

@end
