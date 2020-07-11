//
//  RestaurantTableViewCell.swift
//  NearbyRestaurants
//
//  Created by Nischal Hada on 11/7/20.
//  Copyright © 2020 Nischal Hada. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    let gradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = .viewBackgroundColor
        titleLabel?.font = .heading2
        detailLabel?.font = .body1
        titleLabel?.textColor = .titleColor
        detailLabel?.textColor = .descriptionColor

        backgroundImageView.clipsToBounds = true
        backgroundImageView.contentMode = .scaleAspectFill
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)
        gradientLayer.frame = contentView.bounds
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(_ model: RestaurantListModel) {
        titleLabel?.text = model.name
        detailLabel?.text = model.address
        backgroundImageView?.setImage(url: URL(string: model.imageUrl))
        backgroundImageView.addGradient(with: gradientLayer)
    }
}
