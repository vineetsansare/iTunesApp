//
//  CoreWebImageView.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 18/12/2021.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CoreWebImageView: UIImageView {

    var imageUrlString: String?

    func loadImageUsingUrlString(url: URL? = nil, placeHolderImage: UIImage? = UIImage(named: CoreConstants.ImagePlaceHolders.artist)) {
        image = nil
        guard let url = url else {
            image = UIImage(named: CoreConstants.ImagePlaceHolders.artist)
            return
        }
        
        let urlString = url.relativeString
        imageUrlString = urlString
        image = nil

        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            image = imageFromCache
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            DispatchQueue.main.async {
                guard let safeData = data,
                      let downloadedImage = UIImage.init(data: safeData) else {
                    self.setImageWithAnimation(imageToTransition: UIImage(named: CoreConstants.ImagePlaceHolders.artist))
                    return
                }
                if self.imageUrlString == urlString {
                    self.setImageWithAnimation(imageToTransition: downloadedImage)
                }
                imageCache.setObject(downloadedImage, forKey: urlString as NSString)
            }
        }
        dataTask.resume()
    }

    func setImageWithAnimation(imageToTransition: UIImage?) {
        UIView.transition(with: self, duration: 0.50, options: .transitionCrossDissolve,
                          animations: { self.image = imageToTransition },
                          completion: nil)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        tintColor = .white
    }
}

