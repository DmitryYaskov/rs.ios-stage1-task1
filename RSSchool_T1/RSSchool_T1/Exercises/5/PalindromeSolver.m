#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSString *result = s;
    
    int changesLeft = k.intValue;
    NSMutableArray<NSNumber*> *arayOfChangedIndexes = [[NSMutableArray alloc] init];
    
    if (n.intValue % 2 != 0) {
        return @"-1";
    }
    
    for (int i = 0; i < n.intValue / 2; i++) {
        int j = n.intValue - (i + 1);
        
        int originalNumer = [result substringWithRange:NSMakeRange(i, 1)].intValue;
        int mirrorNumber = [result substringWithRange:NSMakeRange(j, 1)].intValue;
        
        if (originalNumer != mirrorNumber) {
            if (originalNumer > mirrorNumber ) {
                result = [result stringByReplacingCharactersInRange:NSMakeRange(j, 1) withString:[@(originalNumer) stringValue]];
                changesLeft--;
                [arayOfChangedIndexes addObject:@(j)];
            } else {
                result = [result stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:[@(mirrorNumber) stringValue]];
                changesLeft--;
                [arayOfChangedIndexes addObject:@(i)];
            }
        }
    }
    
    if ( changesLeft < 0) {
        return @"-1";
    }
    
    for (int i = 0; i < n.intValue / 2; i++) {
        
        if ( changesLeft == 1) {
            int indexForLastChange = [[arayOfChangedIndexes valueForKeyPath:@"@min.self"] intValue];
            int mirrorIndexForLastChange = n.intValue - (indexForLastChange + 1);
            result = [result stringByReplacingCharactersInRange:NSMakeRange(indexForLastChange, 1) withString:@"9"];
            result = [result stringByReplacingCharactersInRange:NSMakeRange(mirrorIndexForLastChange, 1) withString:@"9"];
            
            return result;
        }
        
        if ( changesLeft == 0) {
            return result;
        } else if ( changesLeft < 0 ) {
            return @"-1";
        }
        
        int j = n.intValue - (i + 1);
        
        int originalNumer = [result substringWithRange:NSMakeRange(i, 1)].intValue;
        int mirrorNumber = [result substringWithRange:NSMakeRange(j, 1)].intValue;
        
        result = [result stringByReplacingCharactersInRange:NSMakeRange(originalNumer, 1) withString:@"9"];
        result = [result stringByReplacingCharactersInRange:NSMakeRange(mirrorNumber, 1) withString:@"9"];
        changesLeft--;
        changesLeft--;
    }
    
    return @"-1";
}

@end
