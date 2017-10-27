//
//  DemoSort.m
//

#import "DemoSort.h"
#import "NSArray+Sorted.h"

@implementation DemoSort


- (void)showLogs {
    
    NSArray *arr = @[@"2", @"5", @"0", @"-1", @"3", @"1", @"6", @"5", @"4"];

    NSLog(@"'%s' '%d' origin '%@' ", __PRETTY_FUNCTION__, __LINE__, arr);
    
    NSLog(@"'%s' '%d' base '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);

    NSLog(@"'%s' '%d' bubble '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmBubbleSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);
    
    NSLog(@"'%s' '%d' comb '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmCombSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);
    
    NSLog(@"'%s' '%d' insertion '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmInsertionSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);
    
    NSLog(@"'%s' '%d' shell '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmShellSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    } step:arr.count / 2]);
    
    NSLog(@"'%s' '%d' selection '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmSelectionSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);
    
    NSLog(@"'%s' '%d' quick '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmQuickSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);
    
    NSLog(@"'%s' '%d' merge '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmMergeSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);

    NSLog(@"'%s' '%d' '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmHeapSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
         return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);
    
    NSLog(@"'%s' '%d' counting '%@' ", __PRETTY_FUNCTION__, __LINE__, [arr kmCountingSortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparisonResultObj1:obj1 obj2:obj2];
    }]);
    
}


- (NSComparisonResult)comparisonResultObj1:(id)obj1 obj2:(id)obj2 {
    return [obj1 localizedCompare:obj2];
}


@end
