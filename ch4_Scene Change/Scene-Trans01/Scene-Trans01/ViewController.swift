//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 윤형찬 on 2021/01/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
        /*
        // 이동할 뷰 컨트롤러 객체를 StoryboardID 정보를 이용하여 참조.
        // let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
        
        /*
        // 스토리보드가 여러개일때 원하는 스토리보드만 선택하여 객체로 가져오려면
        let storyboard = UIStoryboard(name: "Man", bundle: Bundle.main)
        let uvc = storyboard.instantiateViewController(withIdentifier: "SecondVC")
        */
        
        // 화면 전환할 때의 애니메이션 타입
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(uvc, animated: true)
        */
        // nil검사 없이 바로 ! 연산자를 사용하여 강제 해제하였음.
        // 옵셔널 바인딩 구문으로 보강하면
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true)
        
    }
    
}

