//
//  EditProfileViewController.swift
//  petz
//
//  Created by Kayciel Ramos on 4/30/23.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let usernameLabel = UILabel()
    let usernameTextField = UITextField()
    let bioLabel = UILabel()
    let bioTextField = UITextField()
    let contactLabel = UILabel()
    let contactTextField = UITextField()
    let hostButton = UIButton()
    let hostLabel = UILabel()
    let ownerButton = UIButton()
    let ownerLabel = UILabel()
    let saveButton = UIButton()
    let checkedImage = UIImage(systemName: "checkmark.square.fill")
    let uncheckedImage = UIImage(systemName: "checkmark.square")
    weak var delegate: UpdateProfileDelegate?
    var profile : Profile?


    init(profile: Profile, delegate: UpdateProfileDelegate){
        self.profile = profile
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        nameTextField.text = profile.name
        usernameTextField.text = profile.username
        bioTextField.text = profile.bio
        contactTextField.text = profile.contact
        if (profile.host){
            hostButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }else {
            hostButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        if (profile.owner){
            ownerButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            ownerButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit My Profile"
        
        view.backgroundColor = .white
        
        nameLabel.text = "NAME"
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        nameTextField.backgroundColor = .lightGray
        nameTextField.textColor = .black
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        usernameLabel.text = "USERNAME"
        usernameLabel.font = .systemFont(ofSize: 15)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        usernameTextField.backgroundColor = .lightGray
        usernameTextField.textColor = .black
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        bioLabel.text = "BIO"
        bioLabel.font = .systemFont(ofSize: 15)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        bioTextField.backgroundColor = .lightGray
        bioTextField.textColor = .black
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioTextField)
        
        contactLabel.text = "CONTACT"
        contactLabel.font = .systemFont(ofSize: 15)
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactLabel)
        
        contactTextField.backgroundColor = .lightGray
        contactTextField.textColor = .black
        contactTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactTextField)
        
        hostButton.translatesAutoresizingMaskIntoConstraints = false
        hostButton.addTarget(self, action: #selector(updateHost), for: .touchUpInside)
        view.addSubview(hostButton)
        
        hostLabel.text = "host"
        hostLabel.font = .systemFont(ofSize: 15)
        hostLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostLabel)
        
        ownerButton.translatesAutoresizingMaskIntoConstraints = false
        ownerButton.addTarget(self, action: #selector(updateOwner), for: .touchUpInside)
        view.addSubview(ownerButton)
        
        ownerLabel.text = "owner"
        ownerLabel.font = .systemFont(ofSize: 15)
        ownerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ownerLabel)
        
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            usernameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor , constant: 20)
        ])
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            usernameTextField.topAnchor.constraint(equalTo:usernameLabel.bottomAnchor, constant: 10),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            bioLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor , constant: 20)
        ])
        NSLayoutConstraint.activate([
            bioTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            bioTextField.topAnchor.constraint(equalTo:bioLabel.bottomAnchor, constant: 10),
            bioTextField.widthAnchor.constraint(equalToConstant: 300),
            bioTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            contactLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            contactLabel.topAnchor.constraint(equalTo: bioTextField.bottomAnchor , constant: 20)
        ])
        NSLayoutConstraint.activate([
            contactTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            contactTextField.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 10),
            contactTextField.widthAnchor.constraint(equalToConstant: 300),
            contactTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            hostButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hostButton.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 80)
        ])
        NSLayoutConstraint.activate([
            hostLabel.trailingAnchor.constraint(equalTo: hostButton.leadingAnchor, constant: 60),
            hostLabel.bottomAnchor.constraint(equalTo: hostButton.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            ownerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ownerButton.topAnchor.constraint(equalTo: hostButton.bottomAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            ownerLabel.trailingAnchor.constraint(equalTo: ownerButton.leadingAnchor, constant: 60),
            ownerLabel.bottomAnchor.constraint(equalTo: ownerButton.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.topAnchor.constraint(equalTo: ownerLabel.bottomAnchor, constant: 40)
        ])
    }
    
    @objc func dismissView(){
        dismiss(animated: true)
        if let nameText = nameTextField.text, let usernameText = usernameTextField.text, let bioText = bioTextField.text, let contactText = contactTextField.text{
            delegate?.updateProfile(name: nameText, username: usernameText, bio: bioText, contact: contactText, host: hostButton.currentImage == checkedImage, owner: ownerButton.currentImage == checkedImage)
        }
    }
    @objc func updateHost(){
        if (hostButton.currentImage == checkedImage){
            hostButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }else {
            hostButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
    }
    
    @objc func updateOwner(){
        if (ownerButton.currentImage == checkedImage){
            ownerButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }else {
            ownerButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
    }

}

protocol UpdateProfileDelegate : ProfilePushViewController {
    func updateProfile(name: String, username: String, bio: String, contact: String, host: Bool, owner: Bool)
        
}
