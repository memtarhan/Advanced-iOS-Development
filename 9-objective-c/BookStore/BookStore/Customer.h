//
//  Customer.h
//  BookStore
//
//  Created by Mehmet Tarhan on 20/02/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Customer : NSObject {
    NSString *firstName;
    NSString *lastName;
    NSString *addressLine1;
    NSString *addressLine2;
    NSString *city;
    NSString *state;
    NSString *zip;
    NSString *phoneNumber;
    NSString *emailAddress;
    NSString *favoriteGenre;
}

-(NSArray *) listPurchaseHistory;

@end

NS_ASSUME_NONNULL_END
