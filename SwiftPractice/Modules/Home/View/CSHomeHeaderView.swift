//
//  CSHomeHeaderView.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/25.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

class CSHomeHeaderView: CSBaseView {

    lazy var bannerView: CSBannerView = {
        let banner = CSBannerView()
        return banner
    }()
    
    lazy var classifyView: CSGoodsClassifyView = {
        let view = CSGoodsClassifyView()
        return view
    }()
    
    lazy var bannerView2: CSBannerView = {
        let banner = CSBannerView()
        banner.layer.cornerRadius = 35
        banner.clipsToBounds = true
        banner.pageControl.isHidden = true
        return banner
    }()
    
    lazy var activityView: CSActivityView = {
        let view = Bundle.main.loadNibNamed("CSActivityView", owner: self, options: nil)?.first as! CSActivityView
        return view
    }()
    
    override var data: Any? {
        didSet {
            guard let array = data as? Array<String> else {
                return
            }
            bannerView.data = array
            bannerView2.data = array
            bannerView.width = UIDevice.width
            bannerView2.width = UIDevice.width-32
        }
    }
    
    override func configUI() {
        backgroundColor = CSStyleManager().colorF5
        addSubview(bannerView)
        addSubview(classifyView)
        addSubview(bannerView2)
        addSubview(activityView)
    }
    
    override func configConstraint() {
        bannerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(UIDevice.width/ratio)
        }
        
        classifyView.snp.makeConstraints { (make) in
            make.top.equalTo(bannerView.snp_bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(240)
        }
        
        bannerView2.snp.makeConstraints { (make) in
            make.top.equalTo(classifyView.snp_bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(70)
        }
        
        activityView.snp.makeConstraints { (make) in
            make.top.equalTo(bannerView2.snp_bottom).offset(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(290)
        }
    }
}
