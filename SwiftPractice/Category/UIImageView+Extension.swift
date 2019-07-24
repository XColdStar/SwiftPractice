//
//  UIImageView+Extention.swift
//  SwiftPractice
//
//  Created by hanxing on 2019/7/24.
//  Copyright © 2019 hanxing. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: String) {
        kf.setImage(with: URL(string: url))
    }
    
    func setImage(with resource: Resource?,
                  placeholder: UIImage? = nil) {
         _ = setImage(with: resource, placeholder: placeholder, options: nil, progressBlock: nil, completionHandler: nil)
    }

    func setImage(with resource: Resource?,
                         placeholder: UIImage? = nil,
                         options: KingfisherOptionsInfo? = nil,
                         progressBlock: DownloadProgressBlock? = nil,
                         completionHandler: CompletionHandler? = nil) -> RetrieveImageTask {
       return kf.setImage(with: resource, placeholder: placeholder, options: options, progressBlock: progressBlock, completionHandler: completionHandler)
    }
    
}
