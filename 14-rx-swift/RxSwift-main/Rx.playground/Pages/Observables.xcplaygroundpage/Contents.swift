import PlaygroundSupport
import RxSwift

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - Dispose Bag

// MARK: - Observables: Disposing

/*
 - Preventing retain cycles (memory issues)
 - ARC: Helps memory management
 */

// Free up memory when we're done with it.
// It will call it when error occurs or it's completed
// helloSubscription.dispose()

// Let's do it with a dispose bag
let disposeBag = DisposeBag()

// MARK: - Creating and Subscribing to Observables

/*
 Observable.just(number) -> Creating an onservable of a single value
 */
let numberSequence = Observable.just(5) // = Observable<Int>(5)
let numberSubscription: () = numberSequence.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

let helloSequence = Observable.from(["H", "e", "l", "l", "o"])
let helloSubscription: () = helloSequence.subscribe { event in
    switch event {
    case let .next(value):
        print(value)
    case let .error(error):
        print(error)
    case .completed:
        print("completed")
    }
}.disposed(by: disposeBag)
