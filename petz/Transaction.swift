//
//  Transaction.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import Foundation
import UIKit

class Transaction {
    var amount: Int
    var message: String
    var sender: String
    var recipient: String

    init(amount: Int, message: String, sender: String, recipient: String) {
        self.amount = amount
        self.message = message
        self.sender = sender
        self.recipient = recipient
    }
}
