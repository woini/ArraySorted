//
//  NSMutableArray+Sort.h
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Sorted)


+ (NSMutableArray *)initNullableWithCapacity:(NSUInteger)numItems;

- (void)swap:(NSInteger)index1 :(NSInteger)index2;

@end
