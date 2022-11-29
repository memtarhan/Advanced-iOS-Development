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
    @IBOutlet var newNameButton: UIButton!

    private let disposeBag = DisposeBag()

    private var names: BehaviorRelay<[String]> = BehaviorRelay(value: [])

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRx()
    }

    private func setupRx() {
        bindTextFields()
        bindButtons()
        bindLabels()
    }

    private func bindTextFields() {
        let debounceDueTime: RxTimeInterval = RxTimeInterval.milliseconds(500)

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
        let debounceDueTime: RxTimeInterval = RxTimeInterval.milliseconds(1000)

        submitButton.rx.tap
            .subscribe(onNext: {
                if self.nameTextField.text != nil {
                    self.names.accept(self.names.value + [self.nameTextField.text!])
                    self.nameTextField.rx.text.onNext("")
                    self.titleLabel.rx.text.onNext("Type your name")
                }
            })
            .disposed(by: disposeBag)

        newNameButton.rx.tap
            .throttle(debounceDueTime, scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                guard let destination = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
                destination.nameSubject
                    .subscribe(onNext: { name in
                        self.names.accept(self.names.value + [name])
                        destination.dismiss(animated: true)
                    })
                    .disposed(by: self.disposeBag)

                self.present(destination, animated: true)
            })
            .disposed(by: disposeBag)
    }

    private func bindLabels() {
        names.asObservable()
            .subscribe(onNext: { names in
                self.namesLabel.text = names.joined(separator: "\n")
            })
            .disposed(by: disposeBag)
    }
}
