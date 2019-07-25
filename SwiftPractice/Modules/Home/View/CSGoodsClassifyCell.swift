//
//  CSGoodsClassifyCell.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/25.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

private let cellIdentifier = "CSGoodsClassifyChidrenCell"

class CSGoodsClassifyCell: CSBaseCollectionViewCell {
    
    var count: NSInteger = 0 {
        didSet {
            collectionView.reloadData()
        }
    }

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = (UIDevice.width-4*50-100)/3
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIDevice.width, height: 0), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        collection.isScrollEnabled = false
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = true
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(UINib(nibName: "CSGoodsClassifyChidrenCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collection.autoresizingMask = [AutoresizingMask.flexibleWidth, AutoresizingMask.flexibleHeight]
        
        return collection
    }()
    
    override func configUI() {
        contentView.addSubview(collectionView)
    }
    
    override func configConstraint() {
        collectionView.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(contentView)
        }
    }
}

extension CSGoodsClassifyCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 25, right: 25 )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CSGoodsClassifyChidrenCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
