//
//  CSHomeCustomNavigationBar.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/24.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSHomeCustomNavigationBar: CSBaseView {

    lazy var locationImg: UIImageView = {
        let img = UIImageView(image: UIImage(named: "xmHomeNaviLocationIcon"))
        return img
    }()
    
    lazy var localLabel: UILabel = {
        let label = UILabel()
        label.text = "东方梅地亚C座1708"
        label.textColor = UIColor.white
        label.font = CSStyleManager.regularFont(14)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    lazy var arrowImg: UIImageView = {
        let img = UIImageView(image: UIImage(named: "xmHomeNaviLocationArrowIcon"))
        return img
    }()
    
    lazy var msgButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xmHomeNaviMessageIcon"), for: .normal)
        button.addTarget(self, action: #selector(gotoMsg), for: .touchUpInside)
        return button
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isEnabled = false
        textField.backgroundColor = CSStyleManager().colorF5
        textField.borderStyle = UITextField.BorderStyle.none
        textField.placeholder = "搜索药品名称、症状"
        textField.font = CSStyleManager.regularFont(14)
        textField.textColor = CSStyleManager().textColor
        let img = UIImageView(image: UIImage(named: "Search_magnifying_glass"))
        img.frame.size = CGSize(width: 15, height: 15)
        textField.leftView = img
        textField.leftViewMode = UITextField.ViewMode.always
        return textField
    }()
    
    lazy var searchView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = CSStyleManager().colorF5
        searchView.layer.cornerRadius = 16
        searchView.layer.masksToBounds = true
        searchView.addSubview(textField)
        let tap = UITapGestureRecognizer(target: self, action: #selector(gotoSearch))
        searchView.addGestureRecognizer(tap)
        return searchView
    }()
    
    override func configUI() {
        backgroundColor = CSStyleManager().mainColor
        addSubview(locationImg)
        addSubview(localLabel)
        addSubview(arrowImg)
        addSubview(msgButton)
        addSubview(searchView)
    }
    
    override func configConstraint() {
        
        locationImg.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(UIDevice.statusBarHeight+40)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(11)
            make.height.equalTo(14)
        }
        
        
        let size = localLabel.sizeThatFits(CGSize(width: 0, height: 19))
        
        localLabel.snp.makeConstraints { (make) in
            make.left.equalTo(locationImg.snp_right).offset(3)
            make.centerY.equalTo(locationImg)
            make.height.equalTo(19)
            make.width.equalTo(size.width)
//            make.right.equalToSuperview().offset(-40)
        }
        
        arrowImg.snp.makeConstraints { (make) in
            make.left.equalTo(localLabel.snp_right).offset(5)
            make.centerY.equalTo(localLabel)
            make.width.equalTo(6)
            make.height.equalTo(11)
        }
        
        msgButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(localLabel)
            make.width.equalTo(20)
            make.height.equalTo(18)
        }
        
        searchView.snp.makeConstraints { (make) in
            make.top.equalTo(localLabel.snp_bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(32)
            make.bottom.equalToSuperview().offset(-12).priorityHigh()
        }
        
        textField.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(searchView)
            make.left.equalTo(searchView.snp_left).offset(15)
            make.right.equalTo(searchView.snp_right).offset(-15)
        }
        
    }
    
}

//MARK: ### Action ###
extension CSHomeCustomNavigationBar {
    @objc func gotoMsg() {
        print("消息")
    }
    
    @objc func gotoSearch() {
        print("搜索")
    }
}
