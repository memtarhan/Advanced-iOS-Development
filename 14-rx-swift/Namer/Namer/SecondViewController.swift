//
//  SecondViewController.swift
//  Namer
//
//  Created by Mehmet Tarhan on 31/03/2022.
//

import RxCocoa
import RxSwift
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var submitButton: UIButton!

    let nameSubject = PublishSubject<String>()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRx()
    }

    private func setupRx() {
        bindTextFields()
        bindButtons()
    }

    private func bindTextFields() {
    }

    private func bindButtons() {
        submitButton.rx.tap
            .subscribe(onNext: {
                if self.nameTextField.text != "" {
                    self.nameSubject.onNext(self.nameTextField.text!)
                }
            })
            .disposed(by: disposeBag)
    }
}
