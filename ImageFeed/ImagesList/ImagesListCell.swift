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
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var cellImage: UIImageView!
    
}
