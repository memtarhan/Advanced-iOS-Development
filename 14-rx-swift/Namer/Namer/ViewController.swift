//
//  ViewController.swift
//  Namer
//
//  Created by Mehmet Tarhan on 28/03/2022.
//

import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var namesLabel: UILabel!

    private let disposeBag = DisposeBag()

    private var names: BehaviorRelay<[String]> = BehaviorRelay(value: [])

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRx()
    }

    private func setupRx() {
        bindTextFields()
        bindButtons()
    }

    private func bindTextFields() {
        let debounceDueTime: RxTimeInterval = RxTimeInterval.milliseconds(5)

        nameTextField.rx.text
            .debounce(debounceDueTime, scheduler: MainScheduler.instance)
            .map {
                let isValid = $0 != nil && $0 != ""
                return isValid ? "Hello, \($0!)." : "Type your name"
            }
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
    }

    private func bindButtons() {
        submitButton.rx.tap
            .subscribe(onNext: {
                if self.nameTextField.text != nil {
                    self.names.accept(self.names.value + [self.nameTextField.text!])
                    self.namesLabel.rx.text.onNext(self.names.value.joined(separator: "\n"))
                    self.nameTextField.rx.text.onNext("")
                    self.titleLabel.rx.text.onNext("Type your name")
                }
            })
            .disposed(by: disposeBag)
    }
}
