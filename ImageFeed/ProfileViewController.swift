//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Валерий on 31.03.2025.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var loginNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapLogoutButton(_ sender: Any) {
    }
}
