//
//  ViewController.swift
//  TwitterUI
//
//  Created by Filip Cecelja on 9/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var twitterUserNameString: String = "Apple Inc."
    
    lazy var wallpaperImageView: UIImageView = UIImageView.with(imageResource: "wallpaper_apple.jpg")
    lazy var profileImageView: UIImageView = UIImageView.with(imageResource: "profile_apple.jpg")
    
    lazy var followButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("Follow", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(tapToFollow), for: .touchUpInside)
        return btn
    }()
    
    lazy var twitterUsernameView: UILabel = UILabel.with(text: twitterUserNameString, color: .black, size: 32, fontStyle: "bold")
    lazy var twitterHandleView: UILabel = UILabel.with(text: "@applecompany", color: .gray, size: 18, fontStyle: "bold")
    lazy var twitterDescriptionView: UILabel = UILabel.with(text: "most valuable company in the world, maker of the iphone, ipad and macbook air/ pro, steve made us, USA company, just built the newest headquarters", color: .black, size: 18, fontStyle: "system")
    lazy var tagView1: UILabel = UILabel.with(text: "Cupertion, CA", color: .gray, size: 16, fontStyle: "bold")
    lazy var tagView2: UILabel = UILabel.with(text: "Fortune 500", color: .gray, size: 16, fontStyle: "bold")
    lazy var tagView3: UILabel = UILabel.with(text: "Consumer Electronics", color: .gray, size: 16, fontStyle: "bold")
    lazy var tagView4: UILabel = UILabel.with(text: "Software services", color: .gray, size: 16, fontStyle: "bold")
    lazy var followingCountLabel: UILabel = UILabel.with(text: "10.2K", color: .black, size: 18, fontStyle: "bold")
    lazy var followingLabel: UILabel = UILabel.with(text: "Following", color: .black, size: 18, fontStyle: "bold")
    lazy var followersCountLabel: UILabel = UILabel.with(text: "514K", color: .black, size: 18, fontStyle: "bold")
    lazy var followersLabel: UILabel = UILabel.with(text: "Followers", color: .black, size: 18, fontStyle: "bold")
    
    lazy var tagsStackView: UIStackView = UIStackView.with()
    lazy var tagsStackView2: UIStackView = UIStackView.with()
    lazy var followStackView: UIStackView = UIStackView.with()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("ViewDidLoad")
        addSubviews()
        setUpConstraints()
        profileImageView.layoutIfNeeded()
        profileImageView.makeRounded(divideHeightBy: 2.0)
        followButton.layoutIfNeeded()
        followButton.makeRounded(divideHeightBy: 2.0)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward"),
            style: .done,
            target: self,
            action: #selector(dismissSelf))
        
        let ellipsisIcon = UIImage(systemName: "ellipsis")

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: ellipsisIcon,
            style: .done,
            target: self,
            action: .none)
    }
    
    
    @objc func dismissSelf() {
        navigationController?.popViewController(animated: true)
    }
    

    func addSubviews() {
        view.addSubview(wallpaperImageView)
        view.addSubview(profileImageView)
        view.addSubview(twitterUsernameView)
        view.addSubview(twitterHandleView)
        twitterDescriptionView.numberOfLines = 0
        view.addSubview(twitterDescriptionView)
        view.addSubview(followButton)
        
        tagsStackView.addArrangedSubview(tagView1)
        tagsStackView.addArrangedSubview(tagView2)
        view.addSubview(tagsStackView)
        
        tagsStackView2.addArrangedSubview(tagView3)
        tagsStackView2.addArrangedSubview(tagView4)
        view.addSubview(tagsStackView2)
        
        followStackView.addArrangedSubview(followingCountLabel)
        followStackView.addArrangedSubview(followingLabel)
        followStackView.addArrangedSubview(followersCountLabel)
        followStackView.addArrangedSubview(followersLabel)
        view.addSubview(followStackView)
    }
    

    
    func setUpConstraints() {
        wallpaperImageView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(wallpaperImageView.snp.width).multipliedBy(2.0/3.0)
        }
        
        profileImageView.snp.makeConstraints{make in
            make.top.equalTo(wallpaperImageView.snp.bottom).offset(-60)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        twitterUsernameView.snp.makeConstraints{make in
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(24)
        }
        
        twitterHandleView.snp.makeConstraints{make in
            make.top.equalTo(twitterUsernameView.snp.bottom)
            make.leading.equalToSuperview().inset(24)
        }
        
        twitterDescriptionView.snp.makeConstraints{make in
            make.top.equalTo(twitterHandleView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
        }
        
        followButton.snp.makeConstraints{make in
            make.top.equalTo(wallpaperImageView.snp.bottom).offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(100)
        }
        
        tagsStackView.snp.makeConstraints{make in
            make.top.equalTo(twitterDescriptionView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(24)
        }
        
        tagsStackView2.snp.makeConstraints{make in
            make.top.equalTo(tagsStackView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(24)
        }
        
        followStackView.snp.makeConstraints{make in 
            make.top.equalTo(tagsStackView2.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(24)
        }
    }
    
    @objc func tapToFollow() {
        followButton.setTitle("Following", for: .normal)
        followButton.layoutIfNeeded()
    }

}




