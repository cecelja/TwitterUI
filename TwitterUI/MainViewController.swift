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
//        let navController = UINavigationController(rootViewController: viewController)
//
//        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: viewController, action: #selector(dismissSelf))
//
//        let ellipsisIcon = UIImage(systemName: "ellipsis")
//
//        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(
//                    image: ellipsisIcon,
//                    style: .done,
//                    target: viewController,
//                    action: .none)
//
//        navController.navigationBar.barStyle = .black
//
//        present(navController, animated: true)
        
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
            if(navigationController?.viewControllers.first === viewController) {
                print("My presenting view controller")
                if let param = givenParam {
                    print("Param")
                    (navigationController?.viewControllers.first as? ViewController)?.twitterUsernameView.text = param
                }
                viewController.viewDidLayoutSubviews()
            } else {
                navigationController?.pushViewController(self, animated: true)
                navigationController?.pushViewController(viewController, animated: true)
            }
        case .home:
            print("Home")
            if(navigationController?.viewControllers.first != nil) {
                print("Dismissal")
            } else {
                print("else")
                navigationController?.pushViewController(self, animated: true)
            }
        }
    }
}
