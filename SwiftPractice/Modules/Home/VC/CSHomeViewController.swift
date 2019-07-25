//
//  CSHomeViewController.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/1.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

private let cellIdentifier = "UICollectionViewCell"

class CSHomeViewController: CSBaseViewController {
    
    lazy var navBar: CSHomeCustomNavigationBar = {
        let bar = CSHomeCustomNavigationBar(frame: CGRect(x: 0, y: 0, width: UIDevice.width, height: UIDevice.statusBarHeight+120))
        return bar
    }()
    
    lazy var headerView: CSHomeHeaderView = {
        let view = CSHomeHeaderView(frame: CGRect(x: 0, y: 0 , width: UIDevice.width, height: UIDevice.width/ratio + 240 + 70 + 290))
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.headerReferenceSize = CGSize(width: UIDevice.width, height: self.headerView.frame.height)
        
        let collection = UICollectionView(frame: CGRect(x: 0, y: self.navBar.frame.height, width: UIDevice.width, height: UIDevice.height-self.navBar.frame.height-49-34), collectionViewLayout: layout)
        collection.backgroundColor = CSStyleManager().colorF5
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collection.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = CSStyleManager().colorF5
        self.view.addSubview(navBar)
        self.view.addSubview(collectionView)
        collectionView.addSubview(headerView)
        
        let pictures = ["http://b-ssl.duitang.com/uploads/item/201806/20/20180620171603_JsPzu.jpeg",
                        "http://b.zol-img.com.cn/soft/6/571/cepyVKtIjudo6.jpg",
                        "http://pic.rmb.bdstatic.com/f54083119edfb83c4cfe9ce2eeebc076.jpeg",
                        "http://b-ssl.duitang.com/uploads/blog/201503/27/20150327133834_JQWKZ.jpeg",
                        "http://pic18.nipic.com/20111129/4155754_234055006000_2.jpg",
                        "http://pic5.nipic.com/20100120/3641224_180653657501_2.jpg"]

        headerView.data = pictures

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

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

extension CSHomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIDevice.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("111111")
    }
    
}
