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
        navigationController?.pushViewController(viewController, animated: true)
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: .none)
        clickMeButton.layoutIfNeeded()
        clickMeButton.makeRounded(divideHeightBy: 2)
    }
}

extension MainViewController {
    func handleDeepLink(_ deepLink: DeepLink, givenParam: String?) {
        switch deepLink {
        case .apple:
            if let param = givenParam {
                viewController.twitterUsernameView.text = param
            }
            if(navigationController?.viewControllers.last === viewController) {
                print("My presenting view controller")
            } else {
                navigationController?.pushViewController(viewController, animated: true)
            }
        case .home:
            print("Home")
            if(navigationController?.viewControllers.first != nil) {
                print("Dismissal")
            } else {
                navigationController?.pushViewController(self, animated: true)
            }
        }
    }
}
