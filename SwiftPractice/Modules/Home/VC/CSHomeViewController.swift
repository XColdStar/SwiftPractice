//
//  CSHomeViewController.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSHomeViewController: CSBaseViewController {

    lazy var navBar: CSHomeCustomNavigationBar = {
        let bar = CSHomeCustomNavigationBar(frame: CGRect(x: 0, y: 0, width: UIDevice.width, height: UIDevice.statusBarHeight+120))
        return bar
    }()
    
    lazy var bannerView: CSBannerView = {
        let banner = CSBannerView(frame: CGRect(x: 0, y:UIDevice.statusBarHeight+120 , width: UIDevice.width, height: UIDevice.width/ratio))
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.view.addSubview(navBar)
        self.view.addSubview(bannerView)
        let pictures = ["http://b-ssl.duitang.com/uploads/item/201806/20/20180620171603_JsPzu.jpeg",
        "http://b.zol-img.com.cn/soft/6/571/cepyVKtIjudo6.jpg",
        "http://pic.rmb.bdstatic.com/f54083119edfb83c4cfe9ce2eeebc076.jpeg",
        "http://b-ssl.duitang.com/uploads/blog/201503/27/20150327133834_JQWKZ.jpeg",
        "http://pic18.nipic.com/20111129/4155754_234055006000_2.jpg",
        "http://pic5.nipic.com/20100120/3641224_180653657501_2.jpg"]
        bannerView.data = pictures
    }

}

extension CSHomeViewController {
    
    override func initTabBarItem() {

        let tabbarItem = UITabBarItem(title: "首页", image: UIImage(named: "xmHomeNormalTabBarItemIcon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "xmHomeSelectedTabBarItemIcon")?.withRenderingMode(.alwaysOriginal))
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9)], for: .normal)
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.green, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11)], for: .selected)
        self.tabBarItem = tabbarItem

    }

    override func configUI() {
        super.configUI()
        _ = setRightBarButtonItem(title: "消息", imageName: "xmHomeNaviMessageIcon", action: #selector(clickedMessage))
    }
    
}

extension CSHomeViewController {
    @objc func clickedMessage() {
        guard CSUser.share().isLogin else {
            present(CSLoginViewController(), animated: true, completion: nil)
            return
        }
    }
}
