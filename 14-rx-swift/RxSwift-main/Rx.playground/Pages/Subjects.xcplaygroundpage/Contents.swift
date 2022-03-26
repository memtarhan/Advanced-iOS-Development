import PlaygroundSupport
import RxSwift

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - Subjects

/*
 - Subjects are special form of Observables
 - 4 kind of Subjects
 * PublishSubject
 * BehaviorSubject
 * ReplaySubject
 * Variable
 */

// MARK: - PublishSubject

var publishSubject = PublishSubject<String>()
publishSubject.onNext("Hello")
publishSubject.onNext("It won't work because this is added before subscription.")
let pubSubSubscription = publishSubject.subscribe(onNext: {
    print("pubSubSubscription - \($0)")
})

publishSubject.onNext("Now it will work")

let pubSubSubscription2 = publishSubject.subscribe(onNext: {
    print("pubSubSubscription2 - \($0)")
})

publishSubject.onNext("Both subs get this message")
