//
//  CSGoodsClassifyView.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/25.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

private let cellIdentifier = "CSGoodsClassifyCell"

class CSGoodsClassifyView: CSBaseView {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIDevice.width, height: 0), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = true
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(CSGoodsClassifyCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collection.autoresizingMask = [AutoresizingMask.flexibleWidth, AutoresizingMask.flexibleHeight]
        
        return collection
    }()
    
    lazy var grayLine: UIView = {
        let view = UIView()
        view.backgroundColor = CSStyleManager().colorF5
        view.layer.cornerRadius = 1;
        view.clipsToBounds = true
        view.addSubview(greenLine)
        return view
    }()

    lazy var greenLine: UIView = {
        let view = UIView()
        view.backgroundColor = CSStyleManager().mainColor
        view.layer.cornerRadius = 1;
        view.clipsToBounds = true
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let line = UIView(frame: CGRect(x: 0, y: 0, width: UIDevice.width-32, height: 0.5))
        line.backgroundColor = CSStyleManager().colorF5
        view.addSubview(line)
        view.addSubview(leftView)
        view.addSubview(middleView)
        view.addSubview(rightView)
        return view
    }()
    
    lazy var leftView: UIButton = {
        let view = UIButton()
        view.isEnabled = false
        view.setImage(UIImage(named: "xmHomeDrugClassifyFirst"), for: .normal)
        view.setTitle("选对药", for: .normal)
        view.setTitleColor(CSStyleManager().mainColor, for: .normal)
        view.titleLabel?.font = CSStyleManager.regularFont(12)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return view
    }()
    
    lazy var middleView: UIButton = {
        let view = UIButton()
        view.isEnabled = false
        view.setImage(UIImage(named: "xmHomeDrugClassifySecond"), for: .normal)
        view.setTitle("少花钱", for: .normal)
        view.setTitleColor(CSStyleManager().mainColor, for: .normal)
        view.titleLabel?.font = CSStyleManager.regularFont(12)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return view
    }()
    
    lazy var rightView: UIButton = {
        let view = UIButton()
        view.isEnabled = false
        view.setImage(UIImage(named: "xmHomeDrugClassifyThird"), for: .normal)
        view.setTitle("有疗效", for: .normal)
        view.setTitleColor(CSStyleManager().mainColor, for: .normal)
        view.titleLabel?.font = CSStyleManager.regularFont(12)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return view
    }()

    override func configUI() {
        addSubview(collectionView)
        addSubview(grayLine)
        addSubview(bottomView)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    override func configConstraint() {
        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(145+50)
        }
        
        grayLine.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp_bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(2)
        }
        
        greenLine.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(grayLine)
            make.width.equalTo(20)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(grayLine.snp_bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(34)
        }
        
        leftView.snp.makeConstraints { (make) in
            make.left.equalTo(bottomView.snp_left).offset(25)
            make.centerY.equalTo(bottomView)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
        
        middleView.snp.makeConstraints { (make) in
            make.center.equalTo(bottomView)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
        
        rightView.snp.makeConstraints { (make) in
            make.right.equalTo(bottomView.snp_right).offset(-25)
            make.centerY.equalTo(bottomView)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
    }
}

extension CSGoodsClassifyView {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let progress = CGFloat(offsetX/(UIDevice.width-32))
        greenLine.snp.updateConstraints { (make) in
            make.left.equalTo(grayLine.snp_left).offset(20*progress)
        }
    }
}

extension CSGoodsClassifyView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIDevice.width-32, height: 145)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CSGoodsClassifyCell
        cell.count = indexPath.row == 0 ? 8 : 5
        return cell
    }

}
