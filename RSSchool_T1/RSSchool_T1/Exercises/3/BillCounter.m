#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSMutableArray<NSNumber*>* shareBillArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < bill.count; i++) {
        if (i != index) {
            [shareBillArray addObject: bill[i]];
        }
    }
    
    int shareSum = [[shareBillArray valueForKeyPath:@"@sum.self"] intValue] / 2;
    
    if (shareSum == sum.intValue) {
        return @"Bon Appetit";
    } else {
        return [@(sum.intValue - shareSum) stringValue];
    }
 
}

@end
