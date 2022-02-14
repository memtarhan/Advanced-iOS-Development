//
//  main.m
//  Random Number
//
//  Created by Mehmet Tarhan on 14/02/2022.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		int randomNumber = 1;
		int userGuess = 1;
		BOOL continueGuessing = YES;
		BOOL keepPlaying = YES;
		char yesNo = ' ';

		while (keepPlaying) {
			randomNumber = (arc4random() % 101);
			while (continueGuessing) {
				NSLog(@"PICK A NUMBER BETWEEN 0 and 100. ");
				scanf("%d", &userGuess);
				fgetc(stdin);

				if (userGuess == randomNumber) {
					continueGuessing = NO;
					NSLog(@"CORRECT : %d", userGuess);

				} else if (userGuess > randomNumber) {
					NSLog(@"LOWER < %d", userGuess);

				} else {
					NSLog(@"HIGHER > %d", userGuess);
				}
			}

			NSLog(@"Play Again? Y or N");
			yesNo = fgetc(stdin);
			if (yesNo == 'N' || yesNo == 'n') {
				keepPlaying = FALSE;
			}
			continueGuessing = TRUE;
		}
	}

	return 0;
}
