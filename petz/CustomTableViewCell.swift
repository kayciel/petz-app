//
//  CustomTableViewCell.swift
//  petz
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let profilePic = UIImageView()
    let name = UILabel()
    let overallRatingDec = UILabel()
    let overallRating = UILabel()
    let contactDec = UILabel()
    let contact = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(profilePic)
                
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 25)
        self.contentView.addSubview(name)
                
        overallRatingDec.translatesAutoresizingMaskIntoConstraints = false
        overallRatingDec.font = UIFont.systemFont(ofSize: 15)
        overallRatingDec.text = "Average Rating:"
        self.contentView.addSubview(overallRatingDec)
                
        overallRating.translatesAutoresizingMaskIntoConstraints = false
        overallRating.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(overallRating)
                
        contactDec.translatesAutoresizingMaskIntoConstraints = false
        contactDec.font = UIFont.systemFont(ofSize: 15)
        contactDec.text = "Contact:"
        self.contentView.addSubview(contactDec)
                
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
            name.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -30)
        ])
                
        NSLayoutConstraint.activate([
            contactDec.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 30),
            contactDec.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
                
        NSLayoutConstraint.activate([
            overallRatingDec.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 30),
            overallRatingDec.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 30)
        ])
                
        NSLayoutConstraint.activate([
            contact.leadingAnchor.constraint(equalTo: contactDec.trailingAnchor, constant: 10),
            contact.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
                
        NSLayoutConstraint.activate([
            overallRating.leadingAnchor.constraint(equalTo: overallRatingDec.trailingAnchor, constant: 10),
            overallRating.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 30)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFrom(petCare: PetCare){
        name.text = petCare.name
        contact.text = petCare.contact
        overallRating.text = String(petCare.overall_rating)
        profilePic.image = UIImage(named: "Profile0")
    }

}

