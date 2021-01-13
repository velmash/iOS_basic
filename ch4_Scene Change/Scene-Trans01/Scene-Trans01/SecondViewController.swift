//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by 윤형찬 on 2021/01/13.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
