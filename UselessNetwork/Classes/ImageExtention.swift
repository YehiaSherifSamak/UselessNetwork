//
//  ImageExtention.swift
//  UselessNetwork
//
//  Created by Soft Xpert on 2/9/21.
//

import UIKit
import SDWebImage


extension UIImageView {
    func downloadImageWithProgress(_ url: URL, placeholderImage: UIImage? = nil) {
        self.configureLoadingIndicator()
        sd_setImage(with: url, placeholderImage: placeholderImage ?? image) {
            [weak self]  (image, error, cacheType, imageURL) in
            guard let strongSelf = self, let _ = image else { return }
            strongSelf.stopLoadingAnimation()
        }
        if let _ = self.image {
            self.stopLoadingAnimation()
        }
    }
    
    func stopLoading() {
        sd_cancelCurrentImageLoad()
        stopLoadingAnimation()
    }
    
    func stopLoadingAnimation() {
        guard let currentIndicator = subviews.first as? UIActivityIndicatorView else { return }
        currentIndicator.stopAnimating()
    }
    
    fileprivate func configureLoadingIndicator() {
        if let currentIndicator = subviews.first as? UIActivityIndicatorView {
            currentIndicator.startAnimating()
            return
        }
        addIndicatorToTheCenter().startAnimating()
    }
    
    private func addIndicatorToTheCenter() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        self.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }
    
}
