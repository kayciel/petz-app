//
//  Profile.swift
//  petz
//
//  Created by Kayciel Ramos on 4/29/23.
//

import Foundation

class Profile {
    var name: String
    var username : String
    var bio: String
    var contact: String
    var host: Bool
    var owner: Bool
    
    init(name: String, username: String, bio: String, contact: String, host: Bool, owner: Bool){
        self.name = name
        self.username = username
        self.bio = bio
        self.contact = contact
        self.host = host
        self.owner = owner
    }
}
