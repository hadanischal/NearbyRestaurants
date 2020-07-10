//
//  ImageViewExtension.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 10/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import Kingfisher
import UIKit

extension UIImageView {
    public func setImage(url: URL?) {
        self.kf.setImage(with: url, placeholder: Asset.Icons.placeholder.image)
    }
}
