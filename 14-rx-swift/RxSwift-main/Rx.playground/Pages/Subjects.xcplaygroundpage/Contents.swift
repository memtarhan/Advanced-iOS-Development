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

// MARK: - BehaviorSubject

// Most recent value as well as what follows
var behaviorSubject = BehaviorSubject(value: "Value A")

let behaviorSubscription = behaviorSubject.subscribe(onNext: {
    print("behaviorSubscription - \($0)")
})

behaviorSubject.onNext("Value B")

let behaviorSubscription2 = behaviorSubject.subscribe(onNext: {
    print("behaviorSubscription2 - \($0)")
})

behaviorSubject.onNext("Value C")

/*
 Prints out

 behaviorSubscription - Value A
 behaviorSubscription - Value B
 behaviorSubscription2 - Value B
 behaviorSubscription - Value C
 behaviorSubscription2 - Value C

 */

// MARK: - ReplaySubject

/*
 Similar to BehaviorSubject but has a buffer size
 */

var replaySubject = ReplaySubject<Double>.create(bufferSize: 3)
replaySubject.onNext(1.0)
replaySubject.onNext(1.5)

var replaySubscription = replaySubject.subscribe(onNext: {
    print("replaySubscription - $\($0)")
})

replaySubject.onNext(2.0)
replaySubject.onNext(2.5)
replaySubject.onNext(3.0)
replaySubject.onNext(3.5)
replaySubject.onNext(4.0)

// Will return last 3
var lastThreeTransactions = replaySubject.subscribe(onNext: {
    print("lastThreeTransactions - $\($0)")
})
