//
//  PetCare.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import Foundation
import UIKit

struct PetCare: Codable {
    var id: Int
    var name: String
    var username: String
    var bio: String
    var contact: String
    var overall_rating: Float
    var reviews: [Review]
    var host: Bool
    var owner: Bool
    var categories_h: [String]
    var categories_o: [String]
    var available: Bool

    init(id: Int, name: String, username: String,  bio: String, contact: String, overall_rating: Float, host: Bool, owner: Bool, categories_h: [ String ] , categories_o: [ String ], available: Bool, reviews: [Review]) {
        self.id = id
        self.name = name
        self.username = username
        self.bio = bio
        self.contact = contact
        self.overall_rating = overall_rating
        self.host = host
        self.owner = owner
        self.categories_h = categories_h
        self.categories_o = categories_o
        self.reviews = reviews
        self.available = available
    }

}

struct Response: Codable {
    var users: [PetCare]
}
