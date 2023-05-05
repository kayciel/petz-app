//
//  ReviewTableViewCell.swift
//  petz
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    let reviewID = UILabel()
    let reviewIDLabel = UILabel()
    let reviewRating = UILabel()
    let reviewRatingStarLabel = UILabel()
    let reviewText = UILabel()
    let reviewer_ID = UILabel()
    let reviewer_IDLabel = UILabel()
    let reviewee_ID = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        reviewID.translatesAutoresizingMaskIntoConstraints = false
        reviewID.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewID)
        
        reviewIDLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewIDLabel.text = "Review ID: "
        reviewIDLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewIDLabel)
        
        reviewRating.translatesAutoresizingMaskIntoConstraints = false
        reviewRating.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewRating)
        
        reviewRatingStarLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewRatingStarLabel.text = "⭐️"
        self.contentView.addSubview(reviewRatingStarLabel)
        
        reviewText.translatesAutoresizingMaskIntoConstraints = false
        reviewText.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewText)
        
        reviewer_ID.translatesAutoresizingMaskIntoConstraints = false
        reviewer_ID.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(reviewer_ID)
        
        reviewer_IDLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewer_IDLabel.font = UIFont.systemFont(ofSize: 15)
        reviewer_IDLabel.text = "Reviewer ID: "
        self.contentView.addSubview(reviewer_IDLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
            NSLayoutConstraint.activate([
                reviewIDLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
                reviewIDLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
                reviewIDLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
            
            NSLayoutConstraint.activate([
                reviewID.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
                reviewID.leftAnchor.constraint(equalTo: reviewIDLabel.rightAnchor, constant: 5),
                reviewID.heightAnchor.constraint(equalToConstant: 20)
            ])
            
            NSLayoutConstraint.activate([
                reviewRatingStarLabel.topAnchor.constraint(equalTo: reviewIDLabel.topAnchor),
                reviewRatingStarLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
                reviewRatingStarLabel.bottomAnchor.constraint(equalTo: reviewIDLabel.bottomAnchor)
            ])
            
            NSLayoutConstraint.activate([
                reviewRating.topAnchor.constraint(equalTo: reviewIDLabel.topAnchor),
                reviewRating.rightAnchor.constraint(equalTo: reviewRatingStarLabel.leftAnchor, constant: -10),
                reviewRating.bottomAnchor.constraint(equalTo: reviewIDLabel.bottomAnchor)
            ])
            
            NSLayoutConstraint.activate([
                reviewer_IDLabel.topAnchor.constraint(equalTo: reviewIDLabel.bottomAnchor, constant: 15),
                reviewer_IDLabel.leadingAnchor.constraint(equalTo: reviewIDLabel.leadingAnchor),
                reviewer_IDLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
            
            NSLayoutConstraint.activate([
                reviewer_ID.topAnchor.constraint(equalTo: reviewIDLabel.bottomAnchor, constant: 15),
                reviewer_ID.leftAnchor.constraint(equalTo: reviewer_IDLabel.rightAnchor, constant: 10),
                reviewer_ID.heightAnchor.constraint(equalToConstant: 20)
            ])
            
            NSLayoutConstraint.activate([
                reviewText.topAnchor.constraint(equalTo: reviewer_ID.bottomAnchor, constant: 15),
                reviewText.leadingAnchor.constraint(equalTo: reviewIDLabel.leadingAnchor),
                reviewText.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                reviewText.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -10)
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFrom(Review: Review){
        reviewID.text = String(Review.id)
        reviewRating.text = String(Review.rating)
        reviewText.text = Review.text
        reviewer_ID.text = String(Review.date)
        reviewee_ID.text = String(Review.reviewee_id)
    }
}


