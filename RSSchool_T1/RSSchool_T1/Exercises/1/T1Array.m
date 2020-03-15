#import "T1Array.h"

@implementation T1Array

NSMutableArray *resultArray;

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    if (sadArray == @[]) {
        return @[];
    }
    
    resultArray = [self _convertToHappy: sadArray];
   
    while (resultArray.count != [self _convertToHappy: resultArray].count) {
        resultArray = [self _convertToHappy: resultArray];
    }
    
    return [resultArray copy];
}


- (NSArray *)_convertToHappy:(NSArray *)sadArray {
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    if (sadArray.count > 0) {
           [resultArray addObject: sadArray[0]];
       }
    
    for (int i = 1; i < sadArray.count - 1; i++) {
        NSNumber *previousElement = sadArray[i-1];
        NSNumber *currentElement = sadArray[i];
        NSNumber *nextElement = sadArray[i+1];
        if (currentElement.intValue < (previousElement.intValue + nextElement.intValue)) {
            [resultArray addObject: currentElement];
           
        }
    }
    
    if (sadArray.count > 1) {
                 [resultArray addObject: sadArray[sadArray.count - 1]];
       }
    
    return resultArray;
}


@end
