//
//  TransactionPushViewController.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import UIKit

class TransactionPushViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let reuseID = "Transaction"
    var currentIndex = IndexPath()
    var Transactions:[Transaction] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Transactions"
        
        let transaction1 = Transaction(amount: 10, message: "Fooddd", sender: "Sally", recipient: "Josephine")
        let transaction2 = Transaction(amount: 1, message: "Candy", sender: "Josephine", recipient: "Baggy")
        
        Transactions = [transaction1, transaction2]
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: reuseID)
        self.view.addSubview(tableView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? TransactionTableViewCell{
            let currentTransaction = Transactions[indexPath.row]
            
            cell.updateFrom(Transaction: currentTransaction)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}


