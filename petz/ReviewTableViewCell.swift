//
//  ReviewTableViewCell.swift
//  petz
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    let reviewID = UILabel()
    let reviewRating = UILabel()
    let reviewText = UILabel()
    let reviewer_ID = UILabel()
    let reviewee_ID = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        reviewID.translatesAutoresizingMaskIntoConstraints = false
        reviewID.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewID)
        
        reviewRating.translatesAutoresizingMaskIntoConstraints = false
        reviewRating.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewRating)
        
        reviewText.translatesAutoresizingMaskIntoConstraints = false
        reviewText.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewText)
        
        reviewer_ID.translatesAutoresizingMaskIntoConstraints = false
        reviewer_ID.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewer_ID)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            reviewID.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            reviewID.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            reviewID.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            reviewRating.topAnchor.constraint(equalTo: reviewID.topAnchor),
            reviewRating.leftAnchor.constraint(equalTo: reviewID.rightAnchor, constant: 10),
            reviewRating.bottomAnchor.constraint(equalTo: reviewID.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            reviewer_ID.topAnchor.constraint(equalTo: reviewID.bottomAnchor, constant: 15),
            reviewer_ID.leadingAnchor.constraint(equalTo: reviewID.leadingAnchor),
            reviewer_ID.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            reviewText.topAnchor.constraint(equalTo: reviewer_ID.bottomAnchor, constant: 15),
            reviewText.leadingAnchor.constraint(equalTo: reviewID.leadingAnchor),
            reviewText.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            reviewText.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFrom(Review: Review){
        reviewID.text = Review.reviewID
        reviewRating.text = Review.reviewRating
        reviewText.text = Review.reviewText
        reviewer_ID.text = Review.reviewer_ID
        reviewee_ID.text = Review.reviewee_ID
    }
}


