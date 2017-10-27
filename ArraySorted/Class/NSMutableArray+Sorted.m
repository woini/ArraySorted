//
//  NSMutableArray+Sort.m
//

#import "NSMutableArray+Sorted.h"

@implementation NSMutableArray (Sorted)


+ (NSMutableArray *)initNullableWithCapacity:(NSUInteger)numItems {
    NSMutableArray *mutArr = [[NSMutableArray alloc] initWithCapacity:numItems];
    NSNull *null = [NSNull null];
    if (mutArr) {
        for (int i = 0; i < numItems; i++) {
            mutArr[i] = null;
        }
    }
    return mutArr;
}


- (void)swap:(NSInteger)index1 :(NSInteger)index2 {
    id temporary = self[index1];
    ((NSMutableArray *)self)[index1] = self[index2];
    ((NSMutableArray *)self)[index2] = temporary;
}


@end
