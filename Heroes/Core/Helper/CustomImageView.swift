//
//  CustomImageView.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

public let imageCache = NSCache<NSString, UIImage>()
public class CustomImageView: UIImageView {
    public var imageUrlString: String?
    
    public func loadImageUsingUrlString(_ urlString: String, defaultImg: UIImage, contentMode: ContentMode = .scaleAspectFill, isRender: Bool = false) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        image = defaultImg
        self.contentMode = contentMode
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            self.clipsToBounds = true
            self.contentMode = contentMode
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, respones, error) in
            if let _ = error { return }
            
            if urlString.contains("http") {
                DispatchQueue.main.async(execute: {
                    if let data = data, let imageToCache = UIImage(data: data) {
                        if self.imageUrlString == urlString {
                            if isRender {
                                imageToCache.withRenderingMode(.alwaysTemplate)
                                self.tintColor = .blue
                            }
                            self.image = imageToCache
                        }
                        self.contentMode = contentMode
                        self.clipsToBounds = true
                        imageCache.setObject(imageToCache, forKey: urlString as NSString)
                        self.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
                    }
                })
                
            }
        }).resume()
    }
}
