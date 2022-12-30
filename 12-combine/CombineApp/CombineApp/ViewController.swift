//
//  ViewController.swift
//  CombineApp
//
//  Created by Mehmet Tarhan on 13/04/2022.
//

import Combine
import UIKit

class ViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var repeatEmailTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!

    private let emailsDb = [String]()

    @Published var initialEmail: String = ""
    @Published var repeatedEmail: String = ""

    var validatedEmail: AnyPublisher<String?, Never> {
        Publishers.CombineLatest($initialEmail, $repeatedEmail) // 1
            .map { (email, repeatedEmail) -> String? in // 2
                guard email == repeatedEmail,
                      email.contains("@"),
                      email.count > 5 else { return nil }
                return email
            }
            .eraseToAnyPublisher() // 3
    }

    var cancellable: AnyCancellable? // 4

    /*

      1- First, we are using Publishers.CombineLatest to combine two different publishers into one: $initialEmail and $repeatedEmail. This will result in a new stream (publisher) of type Publishers.CombineLatest<Published<String>.Publisher, Published<String>.Publisher>. Don't let the long type scare you. It means "a publisher of two string publishers." The magic of CombineLatest is that if either of the two inputs changes, you will get the new value, but also the latest value that the other input had, which is very useful for cases like this.

      2- Second, we are applying the map operator over the "publisher of two string publishers." By using map, we are unwrapping the underlaying published strings to be able to use the string themselves and return a different result after working with them. Here is where we apply our business rules: If both emails are equal, they include an "@" and they are longer than five characters long, we return the email. Otherwise, we return nil. So, with map, we are transforming a stream output type into a new one, to adapt it to what we need.

      3- At this point, if we inspect the type of what we have, you will see this: Publishers.Map<Publishers.CombineLatest<Published<String>.Publisher, Published<String>.Publisher>, String?>. That is quite complex to read and use. But Combine provides us with a way to simplify this, because what is important is what is inside of the publisher itself, not all the wrappers around it. By using eraseToAnyPublisher, we are changing this type to just AnyPublisher<String?, Never>. This is much easier to understand and use (and if you want to publish it in an API, for example, it's much easier to digest by other developers).

      4- We create a cancellable property var to use it in the following piece of code.

     ---------------------------------------

     *  The @Published property wrapper: Allows us to create a Publisher from a property variable. We can access the publisher by prefixing $ to the name of the property. It only works on class properties, not on structs.
     *  Publishers.CombineLatest: Allows us to combine two publishers into a single one that will always push the latest value of each one when there is a change (or nil, if there wasn't a previous value).
     *  map: Allows us to transform the stream. We apply a map to a publisher with an Output type and we can transform it into a new, different Output.
     *  eraseToAnyPublisher: Allows us to erase complex types to work with easier AnyPublisher<Otutput, Failure> streams. This is very handy when publishing our classes as an API, for example.
     */

    var isNewEmail: AnyPublisher<Bool, Never> { // 1
        return $initialEmail // 2
            .debounce(for: 1, scheduler: RunLoop.main) // 3
            .removeDuplicates() // 4
            .flatMap { email in // 5
                Future { promise in
                    self.emailAvailable(email) { available in
                        promise(.success(available))
                    }
                }
            }
            .eraseToAnyPublisher()
    }

    /*
      1- We are defining a new publisher, isNewEmail, of type <Bool, Never>. This publisher will help us to emit events that indicate whether the email that the user is typing exists in our database or not.

      2- To fetch any new value that the user types in the email field, we start by using the published property defined earlier in the $initialEmail section.

      3- Users can type/delete in text fields pretty fast. Our goal is to make a network call every time we receive a new value through the $initialEmail publisher (meaning every time the user is typing in the email field). That means that we will query the network a bit too much. The Combine .debounce method will help us to reduce the number of values we are processing. By using .debounce(1…), we specify that from all the values that we get from $initialEmail, we will only process a value every 1 second. The rest of the values will be discarded. This is very helpful when working with publishers that are connected to the user interface and the network (text fields, buttons, search bars, and so on).

      4- Another useful method is removeDuplicates(). If the user types "abc" and then deletes the "c" to quickly type the "c" back, we will make several calls. But if we use removeDuplicates(), we will avoid this unnecessary behavior.

      5- The fifth step is a bit more complicated. This is where we perform a network call. First, we have a .flatMap wrapping everything. This function transforms elements from a publisher into a new type of publisher. Inside the flatMap, we have a Future. A Future is a publisher that eventually emits a single value and then finishes (or fails). Inside the Future, we have a Promise: A Promise in Combine is a typealias for a closure that takes a Result. Now let's describe the whole process again, but from inside out: The network call emailAvailable returns a result in the form of promise.success(…). This Promise is wrapped in a Future, to become a publisher stream. That stream is a Future<Bool, Never> at this point. Now, we wrap everything with flatMap, so the upstream initialEmail: Published<String>.Publisher becomes AnyPublisher<Bool, Never> (with the help of eraseToAnyPublisher too).
     */

    var finalEmail: AnyPublisher<String?, Never> {
        return Publishers.CombineLatest(validatedEmail, isNewEmail)
            .map { (email, isNew) -> String? in
                isNew ? email : nil
            }
            .eraseToAnyPublisher()
    }

    var signupButtonCancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()

        cancellable = validatedEmail.sink { print($0) }

        signupButtonCancellable = finalEmail
            .map { $0 != nil }
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: signUpButton)
    }

    @IBAction func didTapSignUp(_ sender: UIButton) {
    }

    @IBAction func emailChanged(_ sender: UITextField) {
        initialEmail = sender.text ?? ""
    }

    @IBAction func repeatEmailChanged(_ sender: UITextField) {
        repeatedEmail = sender.text ?? ""
    }

    func emailAvailable(_ email: String, _ completion: (Bool) -> Void) {
        completion(!emailsDb.contains(email))
    }
}
