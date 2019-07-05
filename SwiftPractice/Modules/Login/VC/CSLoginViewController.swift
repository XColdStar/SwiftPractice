//
//  CSLoginViewController.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import SnapKit

class CSLoginViewController: CSBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        
    }
    
    lazy var closeBtn : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xmCloseIcon"), for: .normal)
        button.addTarget(self, action: Selector(("clickedClose:")), for: .touchUpInside)
        return button
    }()
    
    lazy var fastLoginLabel : UILabel = {
        let label = UILabel()
        label.textColor = CSStyleManager.titleColor()
        label.textAlignment = NSTextAlignment.left
        label.font = CSStyleManager.regularFont(18)
        label.text = "快速登录"
        return label
    }()
    
    lazy var line : UIView = {
        let line = UIView()
        line.backgroundColor = CSStyleManager.mainColor()
        line.layer.cornerRadius = 1
        return line
    }()
    
    lazy var phoneTextfield : UITextField = {
        let tf = UITextField()
        tf.textAlignment = NSTextAlignment.left
        tf.placeholder = "请输入手机号"
        tf.keyboardType = UIKeyboardType.numberPad
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        let line = UIView(frame: CGRect(x: 0, y: 65, width: CGFloat(UIDevice.width()-50), height: 1))
        line.backgroundColor = CSStyleManager.lineColor()
        tf.addSubview(line)
        return tf
    }()
    
    lazy var codeTextfield : UITextField = {
        let tf = UITextField()
        tf.textAlignment = NSTextAlignment.left
        tf.placeholder = "请输入验证码"
        tf.textColor = CSStyleManager.textColor()
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        let line = UIView(frame: CGRect(x: 0, y: 65, width: CGFloat(UIDevice.width()-50), height: 1))
        line.backgroundColor = CSStyleManager.lineColor()
        tf.addSubview(line)
        tf.rightView = self.sendCodeBtn
        return tf
    }()
    
    lazy var sendCodeBtn : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 105, height: 30))
        button.backgroundColor = CSStyleManager.mainColor()
        button.setTitle("发送验证码", for: .normal)
        button.titleLabel?.font = CSStyleManager.regularFont(15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: Selector(("countTime:")), for: .touchUpInside)
        return button
    }()
    
    lazy var checkBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(named: "xmCommonCheckNormal"), for: .normal)
        button.setImage(UIImage.init(named: "xmCommonCheckSelected"), for: .selected)
        button.addTarget(self, action: Selector(("checkAgree:")), for: .touchUpInside)
        return button
    }()
    
    lazy var iAgreeLabel : UILabel = {
        let label = UILabel()
        label.textColor = CSStyleManager.textColor()
        label.textAlignment = NSTextAlignment.left
        label.font = CSStyleManager.regularFont(14)
        label.text = "我已阅读并同意"
        return label
    }()
    
    lazy var agreeLabel : UILabel = {
        let label = UILabel()
        label.textColor = CSStyleManager.redColor()
        label.textAlignment = NSTextAlignment.center
        label.font = CSStyleManager.regularFont(12)
        label.text = "《修正健康用户协议》"
        label.isUserInteractionEnabled = true
        let attribtDic : Dictionary? = [kCTUnderlineStyleAttributeName : NSUnderlineStyle.single , kCTForegroundColorAttributeName : CSStyleManager.mainColor()]
        let attribtString : NSMutableAttributedString? = NSMutableAttributedString(string: label.text ?? "《修正健康用户协议》", attributes: attribtDic! as [NSAttributedString.Key : Any])
        label.attributedText = attribtString
        let tap = UITapGestureRecognizer(target: self, action: Selector(("clickedAgree")))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    lazy var loginBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = CSStyleManager.mainColor()
        button.setTitle("登录", for: .normal)
        button.titleLabel?.font = CSStyleManager.regularFont(19)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 29
        button.addTarget(self, action: Selector(("login")), for: .touchUpInside)
        return button
    }()
    
}

extension CSLoginViewController {
    
    fileprivate func clickedClose(button : UIButton) {
        print("关闭")
    }
    
    fileprivate func clickedAgree() {
        print("同意协议")
    }
    
    fileprivate func login() {
        print("登录")
    }
    
    
}


//MARK: ### UI配置 ###
extension CSLoginViewController {
    
    fileprivate func configUI() {
        self.view.addSubview(self.closeBtn)
        self.view.addSubview(self.line)
        self.view.addSubview(self.phoneTextfield)
        self.view.addSubview(self.codeTextfield)
        self.view.addSubview(self.checkBtn)
        self.view.addSubview(self.iAgreeLabel)
        self.view.addSubview(self.agreeLabel)
        self.view.addSubview(self.loginBtn)
        self.configLayout()
    }
    
    private func configLayout() {
        
        self.loginBtn.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(20)
            make.width.height.equalTo(44)
        }
        
    }
}
