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
    
    lazy var wallpaperImageView: UIImageView = {
        let image = UIImage(named: "wallpaper_apple.jpg")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var profileImageView: UIImageView = {
        let image = UIImage(named: "profile_apple.jpg")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var followButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("Follow", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(tapToFollow), for: .touchUpInside)
        return btn
    }()
    
    lazy var twitterUsernameView: UILabel = createLabel(text: twitterUserNameString, color: .black, fontType: UIFont.boldSystemFont(ofSize: 32))
    
    lazy var twitterHandleView: UILabel = createLabel(text: "@applecompany", color: .gray, fontType: UIFont.boldSystemFont(ofSize: 18))
    
    lazy var twitterDescriptionView: UILabel = createLabel(text: "most valuable company in the world, maker of the iphone, ipad and macbook air/ pro, steve made us, USA company, just built the newest headquarters", color: .black, fontType: UIFont.systemFont(ofSize: 18))
    
    lazy var tagView1: UILabel = createLabel(text: "California (USA)", color: .gray, fontType: UIFont.boldSystemFont(ofSize: 16))
    lazy var tagView2: UILabel = createLabel(text: "Fortune 500", color: .gray, fontType: UIFont.boldSystemFont(ofSize: 16))
    lazy var tagView3: UILabel = createLabel(text: "Consumer electronics", color: .gray, fontType: UIFont.boldSystemFont(ofSize: 16))
    lazy var tagView4: UILabel = createLabel(text: "Software services", color: .gray, fontType: UIFont.boldSystemFont(ofSize: 16))
    

    lazy var tagsStackView: UIStackView = createHorizontalStackView()
    lazy var tagsStackView2: UIStackView = createHorizontalStackView()
    lazy var followStackView: UIStackView = createHorizontalStackView()
    
    lazy var followingCountLabel: UILabel = createLabel(text: "10.2K", color: .black, fontType: UIFont.boldSystemFont(ofSize: 18))
    lazy var followingLabel: UILabel = createLabel(text: "Following", color: .black, fontType: UIFont.boldSystemFont(ofSize: 18))
    lazy var followersCountLabel: UILabel = createLabel(text: "514K", color: .black, fontType: UIFont.boldSystemFont(ofSize: 18))
    lazy var followersLabel: UILabel = createLabel(text: "Followers", color: .black, fontType: UIFont.boldSystemFont(ofSize: 18))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        addSubviews()
        setUpConstraints()
        profileImageView.layoutIfNeeded()
        profileImageView.makeRounded()
        followButton.layoutIfNeeded()
        followButton.layer.cornerRadius = followButton.frame.width/6
        followButton.layer.masksToBounds = true
        followButton.layer.borderWidth = 2
        followButton.layer.borderColor = UIColor.black.cgColor
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
    
    func createLabel(text: String, color: UIColor, fontType: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = fontType
        label.contentMode = .scaleAspectFit
        return label
    }
    
    func createHorizontalStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }
}

extension UIImageView {
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}


