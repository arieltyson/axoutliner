//
//  AXOTestObject.h
//  AXOutliner
//

#import <Foundation/Foundation.h>

@interface AXOTestObject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *children;

- (instancetype)initWithName:(NSString *)name;
- (void)addChild:(AXOTestObject *)child;
- (NSString *)summary;

@end
