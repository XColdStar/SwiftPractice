//
//  CSBannerView.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/24.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit

private let cellIdentifier = "CSBannerCell"
let ratio = CGFloat(375/167.0)

class CSBannerView: CSBaseView {

    fileprivate var dataArray: Array<String>?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIDevice.width, height: 0), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = true
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(CSBannerCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collection.autoresizingMask = [AutoresizingMask.flexibleWidth, AutoresizingMask.flexibleHeight]
        
        return collection
    }()
    
    override var data: Any? {
        didSet {
            print(data ?? "空值")
            if let array = data as? Array<String> {
                dataArray = array
                collectionView.reloadData()
            }
        }
    }

    override func configUI() {
        addSubview(collectionView)
    }
    
    override func configConstraint() {
        collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
}

extension CSBannerView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIDevice.width, height: UIDevice.width/ratio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CSBannerCell
        cell.data = dataArray?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(String(describing: dataArray?[indexPath.row]))")
    }
    
}
