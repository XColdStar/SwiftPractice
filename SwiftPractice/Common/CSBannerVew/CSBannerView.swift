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
    fileprivate var timer: Timer? = nil
    
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
    
    lazy var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.pageIndicatorTintColor = CSStyleManager().colorF5
        page.currentPageIndicatorTintColor = CSStyleManager().mainColor
        page.currentPage = 0;
        page.backgroundColor = UIColor.clear
        return page
    }()
    
    override var data: Any? {
        didSet {
            print(data ?? "空值")
            if let array = data as? Array<String> {

                guard array.count != 0 else {return}
                dataArray = Array()
                dataArray?.append(array.last!)
                dataArray?.append(contentsOf: array)
                dataArray?.append(array.first!)
                
                guard dataArray?.count != 0 else {return}
                collectionView.reloadData()
                
                pageControl.numberOfPages = dataArray!.count - 2
                pageControl.currentPage = 0

                DispatchQueue.main.async {
                    self.collectionView.setContentOffset(CGPoint(x: UIDevice.width, y: 0), animated: false)
                    self.startTimer()
                }
            }
        }
    }

    override func configUI() {
        addSubview(collectionView)
        addSubview(pageControl)
    }
    
    override func configConstraint() {
        collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
}

//MARK: ### 定时器处理 ###
extension CSBannerView {
    
    fileprivate func startTimer() {
        destoryTimer()
        timer = Timer(timeInterval: 3, target: self, selector: #selector(startScroll), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    fileprivate func destoryTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc fileprivate func startScroll() {
        var offsetX = collectionView.contentOffset.x
        offsetX += UIDevice.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
        if Int(offsetX) >= ((dataArray!.count-1) * Int(UIDevice.width) ) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25)  {
                self.collectionView.setContentOffset(CGPoint(x: UIDevice.width, y: 0), animated: false)
            }
        }
        
    }
    
}

//MARK: ### 处理无线轮播 ###
extension CSBannerView {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        destoryTimer()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let currentIndex = Int(offsetX/UIDevice.width)
        if currentIndex == 0 {
            pageControl.currentPage = dataArray!.count - 2
        } else if currentIndex == dataArray!.count-1 {
            pageControl.currentPage = 0
        } else {
            pageControl.currentPage = currentIndex-1
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let currentIndex = Int(offsetX/UIDevice.width)
        if currentIndex == 0 {
            scrollView.setContentOffset(CGPoint(x: Int(UIDevice.width) * (dataArray!.count-2), y: 0), animated: false)
        } else if currentIndex == dataArray!.count-1 {
            scrollView.setContentOffset(CGPoint(x: UIDevice.width, y: 0), animated: false)
        } else {

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
