import PlaygroundSupport
import RxSwift

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - Creating and Subscribing to Observables

/*
 Observable.just(number) -> Creating an onservable of a single value
 */
let numberSequence = Observable.just(5) // = Observable<Int>(5)
let numberSubscription = numberSequence.subscribe(onNext: {
    print($0)
})

let helloSequence = Observable.from(["H", "e", "l", "l", "o"])
let helloSubscription = helloSequence.subscribe { event in
    switch event {
    case let .next(value):
        print(value)
    case let .error(error):
        print(error)
    case .completed:
        print("completed")
    }
}
