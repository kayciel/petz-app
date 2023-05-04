//
//  Review.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import Foundation
import UIKit

class Review {
    var reviewID: String
    var reviewRating: String
    var reviewText: String
    var reviewer_ID: String
    var reviewee_ID: String

    init(reviewID: String, reviewRating: String, reviewText: String, reviewer_ID: String, reviewee_ID: String) {
        self.reviewID = reviewID
        self.reviewRating = reviewRating
        self.reviewText = reviewText
        self.reviewer_ID = reviewer_ID
        self.reviewee_ID = reviewee_ID
    }
}
