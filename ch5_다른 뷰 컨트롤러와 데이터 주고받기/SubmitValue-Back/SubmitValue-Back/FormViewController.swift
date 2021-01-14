//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 윤형찬 on 2021/01/14.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    // Submit 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func onSubmit(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅한다.
        let preVC = self.presentingViewController
        
        guard let vc = preVC as? ViewController else {
            return
        }

        // 값을 전달한다.
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
        
        // 이전 화면으로 복귀한다.
        self.presentingViewController?.dismiss(animated: true)
    }
}
