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
