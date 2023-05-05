//
//  ViewController.swift
//  petz
//
//  Created by Kayciel Ramos on 4/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    var sittersData: [PetCare] = []
    let tableView = UITableView()
    let reuseID = "sitter"
    var currentIndex = IndexPath()
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Pet Sitters"
        view.backgroundColor = .white
//        let review0 = Review(reviewID: "ReviewID: 0", reviewRating: "Rating: 10", reviewText: "IDK", reviewer_ID: "Reviewer ID: 123", reviewee_ID: "321")
//        let review1 = Review(reviewID: "ReviewID: 1", reviewRating: "Rating: 9.5", reviewText: "LOL", reviewer_ID: "Reviewer ID: 321", reviewee_ID: "123")
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseID)
        self.view.addSubview(tableView)
        
        setUpConstraints()
        createSittersData()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
    func createSittersData(){
        NetworkManager.shared.getAllSitters { sitters in
            DispatchQueue.main.async {
                self.sittersData = sitters
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func refreshData() {
  
        NetworkManager.shared.getAllSitters { sitters in
            DispatchQueue.main.sync {
                self.sittersData = sitters
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }

}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentIndex = indexPath
        let currentPetCare = sittersData[indexPath.row]
        let vc = DetailViewController(PetCare: currentPetCare)
        // vc.del = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sittersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? CustomTableViewCell{
            let currentPetCare = sittersData[indexPath.row]
            
            cell.updateFrom(petCare: currentPetCare)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}


