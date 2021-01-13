//
//  ViewController.swift
//  ch3_IBTest
//
//  Created by 윤형찬 on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var uiTitle01: UILabel!
    
    @IBOutlet var uiTitle02: UILabel!
    
    @IBOutlet var uiTitle03: UILabel!
    
    @IBOutlet var uiTitle04: UILabel!
    
    @IBOutlet var uiTitle05: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        // Button01이 클릭되었을 때 Label01의 텍스트를 변경함
        self.uiTitle01.text = "Button01 Clicked"
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        // Button02이 클릭되었을 때 Label02의 텍스트를 변경함
        self.uiTitle02.text = "Button02 Clicked"
    }
    
    @IBAction func clickBtn03(_ sender: Any) {
        // Button03이 클릭되었을 때 Label03의 텍스트를 변경함
        self.uiTitle03.text = "Button03 Clicked"
    }
    
    @IBAction func clickBtn04(_ sender: Any) {
        // Button04이 클릭되었을 때 Label01의 텍스트를 변경함
        self.uiTitle04.text = "Button04 Clicked"
    }
    
    @IBAction func clickBtn05(_ sender: Any) {
        // Button05이 클릭되었을 때 Label05의 텍스트를 변경함
        self.uiTitle05.text = "Button05 Clicked"
    }
    
}

