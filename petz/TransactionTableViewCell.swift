

//
//  TransactionTableViewCell.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    let amountLabel = UILabel()
    let amountLabelDec = UILabel()
    let messageLabel = UILabel()
    let senderLabel = UILabel()
    let senderLabelDec = UILabel()
    let recipientLabel = UILabel()
    let recipientLabelDec = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        amountLabelDec.translatesAutoresizingMaskIntoConstraints = false
        amountLabelDec.font = UIFont.systemFont(ofSize: 20)
        amountLabelDec.textColor = .green
        amountLabelDec.text = "+$ "
        self.contentView.addSubview(amountLabelDec)
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = UIFont.systemFont(ofSize: 20)
        amountLabel.textColor = .green
        self.contentView.addSubview(amountLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(messageLabel)
        
        senderLabelDec.translatesAutoresizingMaskIntoConstraints = false
        senderLabelDec.font = UIFont.systemFont(ofSize: 15)
        senderLabelDec.text = "From: "
        self.contentView.addSubview(senderLabelDec)
        
        recipientLabelDec.translatesAutoresizingMaskIntoConstraints = false
        recipientLabelDec.font = UIFont.systemFont(ofSize: 15)
        recipientLabelDec.text = "To: "
        self.contentView.addSubview(recipientLabelDec)
        
        senderLabel.translatesAutoresizingMaskIntoConstraints = false
        senderLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.contentView.addSubview(senderLabel)
        
        recipientLabel.translatesAutoresizingMaskIntoConstraints = false
        recipientLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.contentView.addSubview(recipientLabel)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpConstraints(){
        NSLayoutConstraint.activate([
            amountLabelDec.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            amountLabelDec.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor),
            amountLabelDec.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            amountLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.amountLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            messageLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            senderLabelDec.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 10),
            senderLabelDec.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            senderLabelDec.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            recipientLabelDec.topAnchor.constraint(equalTo: self.senderLabel.bottomAnchor, constant: 10),
            recipientLabelDec.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            recipientLabelDec.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            senderLabel.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 10),
            senderLabel.leadingAnchor.constraint(equalTo: senderLabelDec.trailingAnchor, constant: 5),
            senderLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            recipientLabel.topAnchor.constraint(equalTo: self.senderLabel.bottomAnchor, constant: 10),
            recipientLabel.leadingAnchor.constraint(equalTo: recipientLabelDec.trailingAnchor, constant: 5),
            recipientLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
    }
    func updateFrom(Transaction: Transaction){
        amountLabel.text = String(Transaction.amount)
        messageLabel.text = Transaction.message
        senderLabel.text = Transaction.sender
        recipientLabel.text = Transaction.recipient
    }
}
