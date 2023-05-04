//
//  PetCare.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import Foundation
import UIKit

class PetCare {
    var petCarePicName: String
    var name: String
    var contact: String
    var overallRating: String
    var bio: String
    var id: String
    var avalibility: Bool
    var reviews: [Review]

    init(petCarePicName: String, name: String, contact: String, overallRating: String, id: String, bio: String, avalibility: Bool, reviews: [Review]) {
        self.petCarePicName = petCarePicName
        self.name = name
        self.contact = contact
        self.overallRating = overallRating
        self.reviews = reviews
        self.avalibility = avalibility
        self.id = id
        self.bio = bio
    }
}
