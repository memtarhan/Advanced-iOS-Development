//
//  main.m
//  Chapter 3
//
//  Created by Mehmet Tarhan on 14/02/2022.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int firstNumber = 2;
        int secondNumber = 3;
        int totalSum = firstNumber + secondNumber;
        NSLog(@"The sum of %d and %d is %d", firstNumber, secondNumber, totalSum);
        
        bool isItALie = true;
        float pi = 3.14;
        double halfPi = pi / 2;
        NSString *aString = @"This is not a string";
    }
    return 0;
}
