//
//  MainViewController.swift
//  TwitterUI
//
//  Created by Filip Cecelja on 9/1/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    let viewController = ViewController()
    
    lazy var clickMeButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("Click me!", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(goToTwitter), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func goToTwitter() {
        self.present(ViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(clickMeButton)
            clickMeButton.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
        }
        clickMeButton.layoutIfNeeded()
        clickMeButton.layer.cornerRadius = clickMeButton.frame.width/16
        clickMeButton.layer.masksToBounds = true

    }
}

extension MainViewController {
    func handleDeepLink(_ deepLink: DeepLink, givenParam: String) {
        switch deepLink {
        case .apple:
            if (givenParam != "") {
                viewController.twitterUserNameString = givenParam
                print(viewController.isBeingPresented)
//                if viewController.isBeingPresented {
//                    print("View not presented")
//                    viewController.viewDidLoad()
//                } else  {
//                    print("view presented")
//                    present(self.viewController, animated: true)
//                }
            } else {
                print("why not printing?")
                present(self.viewController, animated: true)
            }
        case .home:
            if (self.isBeingPresented) {
                print("It is already presenting!")
            } else {
                try? present(self, animated: true)
            }
        }
    }
}
