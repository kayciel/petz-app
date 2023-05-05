//
//  Review.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import Foundation
import UIKit

struct Review: Codable {
    var id: Int
    var rating: Int
    var text: String
    var date: String
    var reviewee_id: Int

    init(id: Int, rating: Int, text: String, date: String, reviewee_id: Int) {
        self.id = id
        self.rating = rating
        self.text = text
        self.date = date
        self.reviewee_id = reviewee_id
    }
}
