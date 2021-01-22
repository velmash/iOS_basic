//
//  ViewController.swift
//  MyMovieChart
//
//  Created by 윤형찬 on 2021/01/18.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet var wv: WKWebView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var mvo: MovieVO! // 목록 화면에서 전달하는 영화 정보를 받을 변수
    
    override func viewDidLoad() {
        // WKNavigationDelegate의  델리게이트 객체를 지정
        self.wv.navigationDelegate = self
        
        NSLog("linkurl = \(self.mvo.detail!), title = \(self.mvo.title!)")
        
        // 네비게이션 바의 타이틀에 영화명을 출력한다.
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        // URLRequest 인스턴스를 생성한다.
        if let url = self.mvo.detail {
            if let urlObj = URL(string: url) {
                let req = URLRequest(url: urlObj)
                // loadRequest 메소드를 호출하면서 req를 인자값으로 전달한다.
                self.wv.load(req)
            } else { // URL 형식이 잘못되었을 경우에 대한 예외처리
                // 경고창 형식으로 오류 메세지를 표시해준다.
                let alert = UIAlertController(title: "오류", message: "잘못된 URL입니다", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                    // 이전 페이지로 되돌려 보낸다.
                    _ = self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(cancelAction)
                self.present(alert, animated: false, completion: nil)
            }
        } else { // URL 값이 전달되지 않았을 경우에 대한 예외처리
            // 경고창 형식으로 오류 메세지를 표시해준다.
            let alert = UIAlertController(title: "오류", message: "필수 파라미터가 누락되었습니다", preferredStyle: .alert)

            let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                // 이전 페이지로 되돌려 보낸다.
                _ = self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(cancelAction)
            self.present(alert, animated: false, completion: nil)
        }
    }
}

// MARK: - WKNavigationDelegate 프로토콜 구현
extension DetailViewController: WKNavigationDelegate {
    // 로딩 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating() // 인디케이터 뷰의 애니메이션을 실행
    }
    
    // 로딩 성공
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중단
    }
    
    // 로딩 실패
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중지
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    // 네트워크 문제나 잘못된 URL에 의해 로딩이 실패
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중지
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - 심플한 경고창 함수 정의용 익스텐션
extension UIViewController {
    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel) { (_) in
            onClick?()
        })
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
    }
}
