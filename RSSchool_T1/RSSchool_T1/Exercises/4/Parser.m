#import "Parser.h"

@implementation Parser

NSString *inputString;
NSMutableArray<NSString*> *result;
NSString *delem = @"[({<";

- (instancetype)init
{
    self = [super init];
    if (self) {
        result = [[NSMutableArray alloc] init];
    }
    return self;
}

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    inputString = string;
    
    for (int i = 0; i < inputString.length; i++) {
        NSString *openBrace = [inputString substringWithRange:NSMakeRange(i, 1)];
        if ([delem rangeOfString: openBrace].location != NSNotFound) {
            
            int closeBraketIndex = [self getCloeseBrecketIndexFor:inputString with:openBrace startBraceIndex:i];
            
            NSRange start = [inputString rangeOfString: openBrace];
            NSRange end = NSMakeRange(closeBraketIndex, 1);
            
            if (start.location != NSNotFound && end.location != NSNotFound && end.location > start.location) {
                NSString *betweenBraces = [string substringWithRange:NSMakeRange(start.location+1, end.location-(start.location+1))];
                [result addObject: betweenBraces];
                
                inputString = [inputString stringByReplacingCharactersInRange:start withString: @" "];
                inputString = [inputString stringByReplacingCharactersInRange:end withString: @" "];
            }
        }
    }
    
    return result;
}


- (int)getCloeseBrecketIndexFor: (NSString*)string with: (NSString*)openBrace startBraceIndex:(int)index {
    
    NSString * closeBrace;
    
    if ([openBrace isEqualToString: @"("]) {
        closeBrace = @")";
    } else if ([openBrace isEqualToString: @"["]) {
        closeBrace = @"]";
    } else if ([openBrace isEqualToString: @"<"]) {
        closeBrace = @">";
    } else if ([openBrace isEqualToString: @"{"]) {
        closeBrace = @"}";
    }
    
    int balance = 0;
    
    for (int i = index; i < string.length; i++ ) {
        
        NSString *currentSymbol = [string substringWithRange:NSMakeRange(i, 1)];
        if ( [currentSymbol isEqualToString: openBrace] ) {
            balance++;
        } else if ( [currentSymbol isEqualToString: closeBrace] ) {
            balance--;
        }
        
        if (balance == 0) {
            return i;
        }
    }
    
    return -1; // not correct bracket sequence
}

@end
