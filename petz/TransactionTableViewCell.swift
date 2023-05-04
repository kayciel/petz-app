//
//  TransactionTableViewCell.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    let amountLabel = UILabel()
    let messageLabel = UILabel()
    let senderLabel = UILabel()
    let recipientLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(amountLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(messageLabel)
        
        senderLabel.translatesAutoresizingMaskIntoConstraints = false
        senderLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(senderLabel)
        
        recipientLabel.translatesAutoresizingMaskIntoConstraints = false
        recipientLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(recipientLabel)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpConstraints(){
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            amountLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            amountLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.amountLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            amountLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            senderLabel.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 10),
            senderLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            senderLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            recipientLabel.topAnchor.constraint(equalTo: self.senderLabel.bottomAnchor, constant: 10),
            recipientLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            recipientLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    func updateFrom(Transaction: Transaction){
        amountLabel.text = String(Transaction.amount)
        messageLabel.text = Transaction.message
        senderLabel.text = Transaction.sender
        recipientLabel.text = Transaction.recipient
    }
}
