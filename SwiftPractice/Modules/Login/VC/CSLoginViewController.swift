//
//  CSLoginViewController.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import SnapKit
import HandyJSON

class CSLoginViewController: CSBaseViewController , UITextFieldDelegate {
    
    lazy var closeBtn : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xmCloseIcon"), for: .normal)
        button.addTarget(self, action: #selector(clickedClose), for: .touchUpInside)
        return button
    }()
    
    lazy var fastLoginLabel : UILabel = {
        let label = UILabel()
        label.textColor = CSStyleManager.share().titleColor
        label.textAlignment = NSTextAlignment.left
        label.font = CSStyleManager.regularFont(18)
        label.text = "快速登录"
        return label
    }()
    
    lazy var line : UIView = {
        let line = UIView()
        line.backgroundColor = CSStyleManager.share().mainColor
        line.layer.cornerRadius = 1
        return line
    }()
    
    lazy var phoneTextfield : UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextField.BorderStyle.none
        tf.tintColor = CSStyleManager.share().mainColor
        tf.textAlignment = NSTextAlignment.left
        tf.placeholder = "请输入手机号"
        tf.keyboardType = UIKeyboardType.numberPad
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        let line = UIView(frame: CGRect(x: 0, y: 43, width: CGFloat(UIDevice.width-50), height: 1))
        line.backgroundColor = CSStyleManager.share().colorD8
        tf.addSubview(line)
        tf.delegate = self
        return tf
    }()
    
    lazy var codeTextfield : UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextField.BorderStyle.none
        tf.tintColor = CSStyleManager.share().mainColor
        tf.textAlignment = NSTextAlignment.left
        tf.placeholder = "请输入验证码"
        tf.textColor = CSStyleManager.share().textColor
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        let line = UIView(frame: CGRect(x: 0, y: 43, width: CGFloat(UIDevice.width-50), height: 1))
        line.backgroundColor = CSStyleManager.share().colorD8
        tf.addSubview(line)
        tf.rightView = self.sendCodeBtn
        tf.rightViewMode = UITextField.ViewMode.always
        tf.delegate = self
        return tf
    }()
    
    lazy var sendCodeBtn : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 105, height: 30))
        button.backgroundColor = CSStyleManager.share().colorD8
        button.setTitle("发送验证码", for: .normal)
        button.titleLabel?.font = CSStyleManager.regularFont(15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(sendCode), for: .touchUpInside)
        return button
    }()
    
    lazy var checkBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(named: "xmCommonCheckNormal"), for: .normal)
        button.setImage(UIImage.init(named: "xmCommonCheckSelected"), for: .selected)
        button.addTarget(self, action: #selector(checkAgree), for: .touchUpInside)
        return button
    }()
    
    lazy var iAgreeLabel : UILabel = {
        let label = UILabel()
        label.textColor = CSStyleManager.share().textColor
        label.textAlignment = NSTextAlignment.left
        label.font = CSStyleManager.regularFont(14)
        label.text = "我已阅读并同意"
        return label
    }()
    
    lazy var agreeLabel : UILabel = {
        let label = UILabel()
        label.textColor = CSStyleManager.share().redColor
        label.textAlignment = NSTextAlignment.center
        label.font = CSStyleManager.regularFont(12)
        label.text = "《修正健康用户协议》"
        label.isUserInteractionEnabled = true
        let attribtDic : Dictionary? = [kCTUnderlineStyleAttributeName : NSUnderlineStyle.single.rawValue , kCTForegroundColorAttributeName : CSStyleManager.share().redColor]
        let attribtString : NSMutableAttributedString? = NSMutableAttributedString(string: label.text ?? "《修正健康用户协议》", attributes: attribtDic! as [NSAttributedString.Key : Any])
        label.attributedText = attribtString
        let tap = UITapGestureRecognizer(target: self, action: #selector(clickedAgree))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    lazy var loginBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = CSStyleManager.share().colorD8
        button.setTitle("登录", for: .normal)
        button.titleLabel?.font = CSStyleManager.regularFont(19)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 29
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    fileprivate var timer : Timer? = nil
    fileprivate var countdownTime = 60
    
    lazy var manager: CSLoginManager = {
        let m = CSLoginManager()
        return m
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChangeNotification), name: UITextField.textDidChangeNotification, object: nil)
    }

    override func configUI() {
        self.view.addSubview(self.closeBtn)
        self.view.addSubview(self.fastLoginLabel)
        self.view.addSubview(self.line)
        self.view.addSubview(self.phoneTextfield)
        self.view.addSubview(self.codeTextfield)
        self.view.addSubview(self.checkBtn)
        self.view.addSubview(self.iAgreeLabel)
        self.view.addSubview(self.agreeLabel)
        self.view.addSubview(self.loginBtn)
        self.configLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.phoneTextfield.resignFirstResponder()
        self.codeTextfield.resignFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UITextField.textDidChangeNotification, object: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

//MARK: ### actions ###
@objc extension CSLoginViewController {
    
    fileprivate func clickedClose(button : UIButton) {
        print("关闭")
        self.dismiss(animated: true, completion: {[weak self] in
            self?.stopTimer()
        })
    }
    
    fileprivate func sendCode(button : UIButton) -> () {
        
        if timer != nil {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCountdown), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        self.startCountdown()
        print("发送验证码")
        var params = [String : Any]()
        params["mobile"] = self.phoneTextfield.text
        self.manager.sendCode(params: params) { (isSuccess, result, msg) in
            if isSuccess {
                print("获取验证码成功")
            } else {
                print(msg)
            }
        }
        
    }
    
    fileprivate func startCountdown() -> () {
        countdownTime -= 1
        print("\(countdownTime)")
        guard countdownTime > 0 else {
            sendCodeBtn.setTitle("重新发送", for: .normal)
            countdownTime = 60
            self.stopTimer()
            return
        }
        sendCodeBtn.setTitle(String(countdownTime), for: .normal)
    }
    
    //销毁timer
    fileprivate func stopTimer() {
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
    }
    
    fileprivate func checkAgree(button : UIButton) {
        print("勾选协议")
        button.isSelected = !button.isSelected
        self.textDidChangeNotification(notifi: Notification(name: UITextField.textDidChangeNotification))
    }
    
    fileprivate func clickedAgree() {
        print("查看协议")
    }
    
    fileprivate func login() {
        print("登录")
        var params = [String : Any]()
        params["mobile"] = self.phoneTextfield.text
        params["code"] = self.codeTextfield.text
        self.manager.login(params: params) { (isSuccess, result, msg) in
            
            if isSuccess
            {
                let model = result as! CSUserInfoModel
                CSUser.updateUserInfo(userInfo: model)
            }
            else
            {
                print("\(msg)---登录失败！")
            }
            
        }
    }

    
}

//MARK: ### delegate && notification ###
extension CSLoginViewController {
    
     @objc func textDidChangeNotification(notifi : Notification) -> () {
        if phoneTextfield.text?.count == 11 {
            
            sendCodeBtn.backgroundColor = CSStyleManager.share().mainColor
            
            if codeTextfield.text?.count ?? 0 > 0 && checkBtn.isSelected {
                loginBtn.backgroundColor = CSStyleManager.share().mainColor
            }
            else {
                loginBtn.backgroundColor = CSStyleManager.share().colorD8
            }
            
        } else {
            
            sendCodeBtn.backgroundColor = CSStyleManager.share().colorD8
            loginBtn.backgroundColor = CSStyleManager.share().colorD8
        }
    }
    
}

//MARK: ### 设置约束 ###
extension CSLoginViewController {
    
    private func configLayout() {
        
        self.closeBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(UIDevice.statusBarHeight + 24)
            make.left.equalToSuperview().offset(10)
            make.width.height.equalTo(44)
        }
        
        self.fastLoginLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.closeBtn.snp_bottom).offset(20)
            make.left.equalToSuperview().offset(25)
            make.height.equalTo(25)
            make.width.equalTo(75)
        }
        
        self.line.snp.makeConstraints { (make) in
            make.top.equalTo(self.fastLoginLabel.snp_bottom).offset(8)
            make.left.equalTo(self.fastLoginLabel)
            make.height.equalTo(2)
            make.width.equalTo(35)
        }
        
        self.phoneTextfield.snp.makeConstraints { (make) in
            make.top.equalTo(self.line.snp_bottom).offset(80)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(44)
        }
        
        self.codeTextfield.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneTextfield.snp_bottom).offset(20)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(44)
        }
        
        self.checkBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(self.codeTextfield.snp_bottom).offset(10)
            make.height.width.equalTo(40)
        }
        
        self.iAgreeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.checkBtn.snp_right)
            make.centerY.equalTo(self.checkBtn)
            make.height.equalTo(19)
            make.width.equalTo(100)
        }
        
        self.agreeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iAgreeLabel.snp_right).offset(8)
            make.bottom.equalTo(self.iAgreeLabel)
            make.height.equalTo(17)
            make.width.equalTo(125)
        }
        
        self.loginBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(57)
            make.top.equalTo(self.agreeLabel.snp_bottom).offset(160)
        }
        
    }
}
