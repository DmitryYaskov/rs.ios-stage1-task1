#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

NSMutableArray<NSNumber*> *sumArray;

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    sumArray = [NSMutableArray new];
    for (int i = 0; i < array.count; i++) {
        int currentSum = 0;
        for (int j = 0; j < array.count; j++) {
            if (j != i) {
                currentSum = currentSum + array[j].intValue;
            }
        }
        [sumArray addObject: [NSNumber numberWithInt:currentSum]];
    }
    
    int max = [[sumArray valueForKeyPath:@"@max.intValue"] intValue];
    int min = [[sumArray valueForKeyPath:@"@min.intValue"] intValue];
    
    return @[@(min),@(max)];
}

@end
