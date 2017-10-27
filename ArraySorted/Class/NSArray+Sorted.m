//
//  NSArray+Sorted.m
//

#import "NSArray+Sorted.h"
#import "NSMutableArray+Sorted.h"

@implementation NSArray (Sorted)


- (__kindof NSArray<NSObject *> * _Nonnull )kmSortedArray:(NSArray *(^)(NSMutableArray *mutArr))mutable {
    NSArray *arr = mutable([NSMutableArray arrayWithArray:self]);
    if (arr) {
        return arr;
    }
    return self;
}


- (NSArray<NSObject *> * _Nonnull )kmBubbleSortedArrayUsingComparator:(NSComparisonResult( ^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
   return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        BOOL finished = true;
        NSInteger count = mutArr.count - 1;
        for (int j = 0; j < count; j++) {
            finished = true;
            for (int i = 0; i < count; i++) {
                if ([self comparisonObj1:mutArr[i] obj2:mutArr[i + 1] comparator:cmptr]) {
                    [mutArr swap:i + 1 :i];
                    finished = false;
                }
            }
            if (finished) {
                j = (int)count;
            }
        }
       return mutArr;
    }];
}


- (BOOL)comparisonObj1:(id)obj1 obj2:(id)obj2 comparator:(NSComparisonResult( ^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return (cmptr(obj1, obj2) == NSOrderedDescending);
}

- (NSArray<NSObject *> * _Nonnull )kmCombSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
   return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
       
       NSInteger count = mutArr.count;
       int gap = (int)count;
       BOOL swapped = true;
       int i = 0;
       
       while (gap > 1 || swapped) {
           if (gap > 1) {
               gap /= 1.247330950103979; // шаг на этом проходе.
           }
           
           i = 0;
           swapped = false;
           while (i + gap < count) {
               if ([self comparisonObj1:mutArr[i] obj2:mutArr[i + gap] comparator:cmptr]) {
                   [mutArr swap:i :i + gap];
                   swapped = true;
               }
               i++;
           }
       }
       
       return mutArr;
    }];
}

- (NSArray<NSObject *> * _Nonnull )kmInsertionSortedArrayUsingComparator:(NSComparisonResult( ^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        NSInteger count = mutArr.count;
        id temporary;
        int i;
        for (int j = 1; j < count; j++) {
            temporary = mutArr[j];
            i = j - 1;
            
            while ((i >= 0) && [self comparisonObj1:mutArr[i] obj2:temporary comparator:cmptr]) {
                mutArr[i + 1] = mutArr[i];
                i--;
            }
            mutArr[i + 1] = temporary;
        }
        return mutArr;
    }];
}


- (NSArray<NSObject *> * _Nonnull )kmShellSortedArrayUsingComparator:(NSComparisonResult( ^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr step:(NSUInteger)s {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        NSInteger count = mutArr.count, step = s;
        int j = 0;
        id temporary;
 
        while (step > 0) {
            for (int i = 0; i < count - step; i++) {
                j = i;
                 while (j >= 0 && [self comparisonObj1:mutArr[j] obj2:mutArr[j + step] comparator:cmptr]) {
                    temporary = mutArr[j];
                    mutArr[j] = mutArr[j + step];
                    mutArr[j + step] = temporary;
                    j--;
                }
            }
            step = step / 2;
        }
        return mutArr;
    }];
}


- (NSArray<NSObject *> * _Nonnull )kmSelectionSortedArrayUsingComparator:(NSComparisonResult( ^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        NSInteger count = mutArr.count;
        id temporary;
        int min;
        for (int i = 0; i < count - 1; i++) {
            min = i;
            for (int j = i + 1; j < count; j++) {
                if ([self comparisonObj1:mutArr[min] obj2:mutArr[j] comparator:cmptr]) {
                    min = j;
                }
            }
            temporary = mutArr[i];
            mutArr[i] = mutArr[min];
            mutArr[min] = temporary;
        }
        return mutArr;
    }];
}


- (NSArray<NSObject *> * _Nonnull )kmQuickSortedArrayUsingComparator:(NSComparisonResult( ^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        [self kmQuickSortArr:mutArr first:0 last:(int)mutArr.count - 1 comparator:cmptr];
        return mutArr;
    }];
}


- (void)kmQuickSortArr:(NSMutableArray *)mutArr first:(int)first last:(int)last comparator:(NSComparisonResult( ^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    int i = first, j = last;
    id temporary = mutArr[(first + last) / 2];
    do {
        while ([self comparisonObj1:temporary obj2:mutArr[i] comparator:cmptr]) i++;
        while ([self comparisonObj1:mutArr[j] obj2:temporary comparator:cmptr]) j--;
        
        if (i <= j) {
            
            if ([self comparisonObj1:mutArr[i] obj2:mutArr[j] comparator:cmptr]) {
                [mutArr swap:i :j];
            }
            i++;
            j--;
        }
    } while (i <= j);
    
    if (i < last) {
        [self kmQuickSortArr:mutArr first:i last:last comparator:cmptr];
    }
    
    if (first < j) {
        [self kmQuickSortArr:mutArr first:first last:j comparator:cmptr];
    }
}


- (NSArray<NSObject *> * _Nonnull )kmMergeSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {

        NSInteger count = mutArr.count;
        if (count == 1) {
            return mutArr;
        }
        int mid = (int)count / 2;
        return [[[self subarrayWithRange:NSMakeRange(0, mid)] kmMergeSortedArrayUsingComparator:cmptr] kmMergeWithArr:[[self subarrayWithRange:NSMakeRange(mid, count - mid)] kmMergeSortedArrayUsingComparator:cmptr] compare:cmptr];
    }];
}


- (NSMutableArray *_Nonnull)kmMergeWithArr:(NSArray *_Nonnull)arr compare:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    int a = 0, b = 0;
    NSInteger selfCount = self.count, arrCount = arr.count;
    NSMutableArray *merge = [[NSMutableArray alloc] initWithCapacity:selfCount + arrCount];
    
    for (int i = 0; i < selfCount + arrCount; i++) {
        if (a < selfCount && b < arrCount) {
            if ([self comparisonObj1:self[a] obj2:arr[b] comparator:cmptr]) {
                merge[i] = arr[b++];
            } else {
                merge[i] = self[a++];
            }
        } else {
            if (b < arrCount) {
                merge[i] = arr[b++];
            } else {
                merge[i] = self[a++];
            }
        }
    }
    return merge;
}


- (NSArray<NSObject *> * _Nonnull )kmHeapSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        NSInteger count = mutArr.count;
        
        for (int i = (int)count / 2; i > 0; i--) {
            [self downHeap:mutArr index:i count:count comparator:cmptr];
        }
        
        do {
            id temporary = mutArr[0];
            mutArr[0] = mutArr[count - 1];
            mutArr[count - 1] = temporary;
            count--;
            [self downHeap:mutArr index:1 count:count comparator:cmptr];
        } while (count > 1);
        
        return mutArr;
    }];
}


- (void)downHeap:(NSMutableArray *)mutArr index:(int)i count:(NSInteger)count comparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    id temporary = mutArr[i - 1];
    
    while (i <= count / 2) {
        int j = 2 * i;
        
        if ((j < count) && [self comparisonObj1:mutArr[j] obj2:mutArr[j - 1] comparator:cmptr]) {
            j++;
        }

        if ([self comparisonObj1:mutArr[j - 1] obj2:temporary comparator:cmptr]) {
            mutArr[i - 1] = mutArr[j - 1];
            i = j;
        } else {
            break;
        }
    }
    mutArr[i - 1] = temporary;
}


- (NSArray<NSObject *> * _Nonnull )kmSmoothSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        return mutArr;
    }];
}


- (NSArray<NSObject *> * _Nonnull )kmPatienceSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        return mutArr;
    }];
}


- (NSArray<NSObject *> * _Nonnull )kmTreeSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {
        return mutArr;
    }];
}


- (NSArray<NSObject *> * _Nonnull )kmCountingSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr {
    return [self kmSortedArray:^NSArray *(NSMutableArray *mutArr) {

        NSInteger count = mutArr.count;
        NSMutableArray *newMutArr = [NSMutableArray initNullableWithCapacity:count];
        int c;
        for (int i = 0; i < count; i++) {
            c = 0;
            for (int j = 0; j < i; j++) {
                 if (![self comparisonObj1:mutArr[j] obj2:mutArr[i] comparator:cmptr]) {
                    c++;
                }
            
            }
            for (int j = i + 1; j < count; j++) {
                if ([self comparisonObj1:mutArr[i] obj2:mutArr[j] comparator:cmptr]) {
                    c++;
                }
            }
            newMutArr[c] = mutArr[i];
        }
        return newMutArr;
    }];
}


@end
