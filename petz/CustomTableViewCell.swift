//
//  CustomTableViewCell.swift
//  petz
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let profilePic = UIImageView()
    let name = UILabel()
    let overallRating = UILabel()
    let contact = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(profilePic)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(name)
        
        overallRating.translatesAutoresizingMaskIntoConstraints = false
        overallRating.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(overallRating)
        
        contact.translatesAutoresizingMaskIntoConstraints = false
        contact.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(contact)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            profilePic.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            profilePic.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.33),
            profilePic.heightAnchor.constraint(equalTo: profilePic.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 30),
            name.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            contact.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 30),
            contact.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            overallRating.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 30),
            overallRating.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFrom(petCare: PetCare){
        name.text = petCare.name
        contact.text = petCare.contact
        overallRating.text = petCare.overallRating
        profilePic.image = UIImage(named: petCare.petCarePicName)
    }

}

