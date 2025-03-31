//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Валерий on 27.03.2025.
//

import Foundation
import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var cellImage: UIImageView!
    
    func configure(imageName: String, dateText: String, isLiked: Bool) {
        if let image = UIImage(named: imageName) {
            cellImage.image = image
        } else {
            print("Image not found for name: \(imageName)")
        }

        dateLabel.text = dateText

        let likeImageName = isLiked ? "like_button_on" : "like_button_off"
        if let likeImage = UIImage(named: likeImageName) {
            likeButton.setImage(likeImage, for: .normal)
        } else {
            print("Like button image not found for name: \(likeImageName)")
        }
    }
}
