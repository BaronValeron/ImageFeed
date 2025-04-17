//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Валерий on 31.03.2025.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    var avatarImageView: UIImageView!
    var nameLabel: UILabel!
    var loginNameLabel: UILabel!
    var descriptionLabel: UILabel!
    
    var logoutButton: UIButton!
    
    private enum LayoutConstants {
        static let avatarSize: CGFloat = 70
        static let logoutButtonSize: CGFloat = 44
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 8
        static let topOffset: CGFloat = 32
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAvatarImageView()
        configureLogoutButton()
        configureNameLabel()
        configureLoginNameLabel()
        configureDescriptionLabel()
    }
    
    private func configureAvatarImageView() {
        guard let profileImage = UIImage(named: "avatar_photo") else { return }
        avatarImageView = UIImageView()
        avatarImageView.image = profileImage
        avatarImageView.tintColor = .gray
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.avatarSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.avatarSize),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.topOffset),
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.horizontalPadding)
        ])
    }

    private func configureLogoutButton() {
        guard let logoutIcon = UIImage(named: "logout_button") else { return }
        logoutButton = UIButton.systemButton(
            with: logoutIcon,
            target: self,
            action: #selector(didTapLogoutButton)
        )
        logoutButton.tintColor = .red
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalToConstant: LayoutConstants.logoutButtonSize),
            logoutButton.widthAnchor.constraint(equalToConstant: LayoutConstants.logoutButtonSize),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.horizontalPadding),
            logoutButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
    }

    private func configureNameLabel() {
        nameLabel = createLabel(
            text: "Екатерина Новикова",
            font: UIFont.systemFont(ofSize: 23, weight: .bold),
            textColor: .white
        )
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: LayoutConstants.verticalPadding),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: logoutButton.trailingAnchor)
        ])
    }

    private func configureLoginNameLabel() {
        loginNameLabel = createLabel(
            text: "@ekaterina_nov",
            font: UIFont.systemFont(ofSize: 13, weight: .regular),
            textColor: .gray
        )
        view.addSubview(loginNameLabel)
        
        NSLayoutConstraint.activate([
            loginNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: LayoutConstants.verticalPadding),
            loginNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            loginNameLabel.trailingAnchor.constraint(equalTo: logoutButton.trailingAnchor)
        ])
    }

    private func configureDescriptionLabel() {
        descriptionLabel = createLabel(
            text: "Hello, world!",
            font: UIFont.systemFont(ofSize: 13, weight: .regular),
            textColor: .white
        )
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: LayoutConstants.verticalPadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: logoutButton.trailingAnchor)
        ])
    }
    
    private func createLabel(text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    @objc
    private func didTapLogoutButton() {

    }
}
