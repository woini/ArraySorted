//
//  NSArray+Sorted.h
//

#import <Foundation/Foundation.h>

@interface NSArray (Sorted)


///min:O(n) midl:O(n^2) max:O(n^2) memo:O(1)
///
///Алгоритм состоит в повторяющихся проходах по сортируемому массиву. На каждой итерации последовательно сравниваются соседние элементы, и, если порядок в паре неверный, то элементы меняют местами.
- (NSArray<NSObject *> * _Nonnull )kmBubbleSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;


/// min:O(n) midl:{\displaystyle \Omega (n^{2}/2^{p})} max:O(n2) memo:O(1)
///
///Основная идея «расчёски» в том, чтобы первоначально брать достаточно большое расстояние между сравниваемыми элементами и по мере упорядочивания массива сужать это расстояние вплоть до минимального.
- (NSArray<NSObject *> * _Nonnull )kmCombSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;

/// min:O(n) midl:O(n^2) max:O(n^2) memo:O(1)
///
///На каждом шаге алгоритма мы выбираем один из элементов входных данных и вставляем его на нужную позицию в уже отсортированной части массива до тех пор, пока весь набор входных данных не будет отсортирован.
- (NSArray<NSObject *> * _Nonnull )kmInsertionSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;

/// min:O(n\\log^2{n}) midl:Зависит от выбора шага max:O(n^2) memo:O(1)
///
///Является модификацией сортировки вставками, сортируем между собой элементы, стоящие на кратных нашему шагу местах.
///@param step > 0
- (NSArray<NSObject *> * _Nonnull )kmShellSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr step:(NSUInteger)step;

/// min:O(n^2) midl:O(n^2) max:O(n^2) memo:O(1)
///
///На i-ом шаге алгоритма находим минимальный среди последних n - i + 1, и меняем его местами с i-ым элементом в массиве.
- (NSArray<NSObject *> * _Nonnull )kmSelectionSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;

/// min:O(n \\log n) midl:O(n \\log n) max:O(n \\log n) memo:O(n^2)
///
///Один из самых известных и широко используемых алгоритмов сортировки. Алгоритм состоит в выборе опорного элемента, разделении массива на 2 части относительно опорного (одна — все элементы, меньшие опорного элемента, вторая — большие), и в сортировке полученных частей рекурсивным вызовом себя от них.
- (NSArray<NSObject *> * _Nonnull )kmQuickSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;

/// min:O(n \\log n) midl:O(n \\log n) max:O(n \\log n) memo:O(n) (обычная реализация) O(1)(модифицированная реализация)
///
/// Алгоритм состоит в разделении массива пополам, сортировки половин и их слиянии.
- (NSArray<NSObject *> * _Nonnull )kmMergeSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;

- (NSMutableArray *_Nonnull)kmMergeWithArr:(NSArray *_Nonnull)arr compare:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;

/// min:O(n \\log n) midl:O(n \\log n) max:O(n \\log n) memo:O(1)
///
///Строим из массива кучу, по очереди извлекаем минимум кучи.
- (NSArray<NSObject *> * _Nonnull )kmHeapSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;

///// min:O(n) midl:O(n + k) max:O(k) memo:O(k)
/////
///Сортировка целых чисел, входящих в какой-то небольшой диапазон. Создаем массив длины диапазона k, каждый элемент которого будет показывать, сколько исходных элементов равны данному. Бежим по массиву и считаем количество вхождений каждого числа.
- (NSArray<NSObject *> * _Nonnull )kmCountingSortedArrayUsingComparator:(NSComparisonResult(^ _Nonnull )(id  _Nonnull obj1, id  _Nonnull obj2))cmptr;

@end
