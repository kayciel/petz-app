//
//  ProfilePushViewController.swift
//  petz
//
//  Created by Kayciel Ramos on 4/29/23.
//

import UIKit

class ProfilePushViewController: UIViewController {
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let bioTextView = UITextView()
    let contactLabel = UILabel()
    let hostLabel = UILabel()
    let ownerLabel = UILabel()
    var editProfileButton = UIButton()
    var petCare : PetCare = PetCare(id: 1, name: "", username: "",  bio: "", contact: "", overall_rating: 10, host: true, owner: true, categories_h: [] , categories_o: [ ], available: true, reviews: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        petCare = getProfile()

        nameLabel.text = "Sally Smith"
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        usernameLabel.text = "ilovecats101"
        usernameLabel.font = .systemFont(ofSize: 15)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        bioTextView.text = "I am a sophomore at Cornell University and I enjoy spending time with cats"
        bioTextView.font = .systemFont(ofSize: 15)
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.isEditable = false
        view.addSubview(bioTextView)
        
        contactLabel.text = "sally@cornell.edu"
        contactLabel.font = .systemFont(ofSize: 15)
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactLabel)
        
        hostLabel.text = "Host"
        hostLabel.font = .systemFont(ofSize: 15)
        hostLabel.backgroundColor = .systemPink
        hostLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostLabel)
        
        ownerLabel.text = "Owner"
        ownerLabel.font = .systemFont(ofSize: 15)
        ownerLabel.backgroundColor = .systemCyan
        ownerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ownerLabel)
        
        editProfileButton.setImage((UIImage(systemName: "square.and.pencil", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))), for: .normal)
        editProfileButton.addTarget(self, action: #selector(presentEditView), for: .touchUpInside)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileButton)
        
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        NSLayoutConstraint.activate([
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            bioTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bioTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            bioTextView.bottomAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 60)

        ])
        NSLayoutConstraint.activate([
            contactLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactLabel.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            hostLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            hostLabel.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            ownerLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            ownerLabel.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            editProfileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    @objc func presentEditView() {
        present(EditProfileViewController(petCare: petCare, delegate: self) , animated: true)
    }
    
    func getProfile() -> PetCare {
        NetworkManager.shared.getCurrentProfile { petCare in
            self.petCare = petCare
            return petCare
        }
    }

}

extension ProfilePushViewController: UpdateProfileDelegate {
    func updateProfile(name: String, username: String, bio: String, contact: String, host: Bool, owner: Bool){
        nameLabel.text = name
        usernameLabel.text = username
        bioTextView.text = bio
        contactLabel.text = contact
        if (host){
            hostLabel.text = "Host"
            hostLabel.backgroundColor = .systemPink
        } else {
            hostLabel.text = ""
            hostLabel.backgroundColor = .white
        }
        if (owner){
            ownerLabel.text = "Owner"
            ownerLabel.backgroundColor = .systemCyan
        } else {
            ownerLabel.text = ""
            ownerLabel.backgroundColor = .white
        }
    }
    
}
