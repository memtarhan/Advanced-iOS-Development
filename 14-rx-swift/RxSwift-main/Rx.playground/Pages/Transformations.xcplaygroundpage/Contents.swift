import Foundation
import PlaygroundSupport
import RxSwift

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - Transformations: .map

let disposeBag = DisposeBag()

let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .spellOut

Observable<NSNumber>.of(123, 45, 9, 5987)
    .map {
        numberFormatter.string(from: $0) ?? ""
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

// MARK: - Transformations: .flatMap

struct Game {
    var price: Observable<Double>
}

var overwatch = Game(price: Observable.just(59.99))
let starwal = Game(price: Observable.just(19.99))

let gameSubject = PublishSubject<Game>()

overwatch.price = Observable.just(14.99)

gameSubject.subscribe(onNext: {
    print($0.price.asObservable())
})

// - Converting it to type of Price
gameSubject
    .flatMap {
        $0.price
    }
    .subscribe(onNext: {
        print("Game price: \($0)")
    })
    .disposed(by: disposeBag)

gameSubject.onNext(overwatch)
gameSubject.onNext(starwal)

// MARK: - Transformations: .filter

Observable.of("Elon", "Steve", "Jeff", "Mark", "Jack")
    .filter {
//        $0.starts(with: "J")
        $0.contains("a")
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
