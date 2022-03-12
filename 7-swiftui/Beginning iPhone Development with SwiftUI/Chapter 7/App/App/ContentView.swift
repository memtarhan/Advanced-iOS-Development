//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 12/03/2022.
//

import SwiftUI

// MARK: - User Text Input

/*
 To retrieve text from the user, SwiftUI offers three types of views:

 -  Text Field

 -  Secure Field

 -  Text Editor

 A Text Field lets the user type in a single line of text such as a name or an address. Optionally, Text Fields can display placeholder text that appears in light gray and is used to explain what type of information the Text Field expects.

 A Secure Field works exactly like a Text Field except that it masks any text the user types in. That can be useful when asking the user to type in sensitive information such as credit card numbers.

 A Text Editor appears as a large box where the user can type and edit several lines of text such as multiple paragraphs.

 */
struct ContentView: View {
    @State private var name = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 32) {
            Text("My name is \(name)")
                .font(.largeTitle)
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .textContentType(.givenName)
                /*
                 By defining a specific .textContentType, autocorrect will reduce the number of irrelevant suggestions it makes. The different .textContentType modifier options are
                 .URL – For entering URL data

                 .namePrefix – For entering prefixes or titles such as Dr. or Mr.

                 .name – For entering names

                 .nameSuffix – For entering suffixes to names such as Jr.

                 .givenName – For entering a first name

                 .middleName – For entering a middle name

                 .familyName – For entering a family or last name

                 .nickname – For entering an alternative name

                 .organizationName – For entering an organization name

                 .jobTitle – For entering a job title

                 .location – For entering a location including an address

                 .fullStreetAddress – For entering a complete street address

                 .streetAddressLine1 – For entering the first line of a street address

                 .streetAddressLine2 – For entering the second line of a street address

                 .addressCity – For entering the city name of an address

                 .addressCityAndState – For entering a city and a state name in an address

                 .postalCode – For entering a postal code in an address

                 .sublocality – For entering a sublocality in an address

                 .countryName – For entering a country or region name in an address

                 .username – For entering an account or login name

                 .password – For entering a password

                 .newPassword – For entering a new password

                 .oneTimeCode – For entering a one-time code

                 .emailAddress – For entering an email address

                 .telephoneNumber – For entering a telephone number

                 .creditCardNumber – For entering a credit card number

                 .dateTime – For entering a date, time, or duration

                 .flightNumber – For entering an airline flight number

                 .shipmentTrackingNumber – For entering a parcel tracking number
                 */
                .keyboardType(.default)
                /*
                  Some of the different virtual keyboards a Text Field can display include
                 .default – The virtual keyboard that normally appears unless you specify otherwise

                 .asciiCapable – Displays standard ASCII characters

                 .numbersAndPunctuation – Displays numbers and punctuation marks

                 .URL – Displays a keyboard optimized for URL entries

                 .numberPad – Displays a numeric keypad for PIN entry

                 .phonePad – Displays a keypad for entering telephone numbers

                 .namePhonePad – Displays a keypad for entering a person’s name and telephone number

                 .emailAddress – Displays a keyboard for typing email addresses

                 .decimalPad – Displays a keyboard with numbers and a decimal point

                 .twitter – Displays a keyboard for Twitter text entry

                 .webSearch – Displays a keyboard for web search terms and URL entry

                 .asciiCapableNumberPad – Displays a numeric pad that outputs only ASCII digits

                 .alphabet – Displays a keyboard for alphabetic entry
                  */

                // Dismissin keyboard
                /*
                 If you don’t specify a .submitLabel modifier, SwiftUI defaults to displaying a Return button in the bottom right corner of the virtual keyboard. No matter what label appears on the bottom right corner key, tapping it will make the virtual keyboard go away

                 .continue – Adds a Continue button

                 .done – Adds a Done button

                 .go – Adds a Go button

                 .join – Adds a Join button

                 .next – Adds a Next button

                 .return – Adds a Return button

                 .route – Adds a Route button

                 .search – Adds a Search button

                 .send – Adds a Send button

                 The .submitLabel modifier only works with iOS 15 and greater.

                 */
                .submitLabel(.done)
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
