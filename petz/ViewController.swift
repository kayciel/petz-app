//
//  ViewController.swift
//  petz
//
//  Created by Kayciel Ramos on 4/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    var openProfileButton = UIButton()
    var transactionsButton = UIButton()
    var PetCares: [PetCare] = []
    let tableView = UITableView()
    let reuseID = "my cell"
    var currentIndex = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Pet Sitters"
        view.backgroundColor = .white
        let review0 = Review(reviewID: "ReviewID: 0", reviewRating: "Rating: 10", reviewText: "IDK", reviewer_ID: "Reviewer ID: 123", reviewee_ID: "321")
        let review1 = Review(reviewID: "ReviewID: 1", reviewRating: "Rating: 9.5", reviewText: "LOL", reviewer_ID: "Reviewer ID: 321", reviewee_ID: "123")

        let PetCare0 = PetCare(petCarePicName: "Profile0", name: "Name: Jack", contact: "Contact: 123456789", overallRating: "Average Rating: 10.0", id: "ID: 123", bio: "xyz", avalibility: true, reviews: [review0, review1])
        
        let PetCare1 = PetCare(petCarePicName: "Profile1", name: "Name: Anna", contact: "Contact: 987654321", overallRating: "Average Rating: 9.5", id: "ID: 321", bio: "College Student", avalibility: true, reviews: [review1])
    
        
        PetCares = [PetCare0,PetCare1]
        
        openProfileButton.setImage(UIImage(systemName: "person.crop.circle", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle)), for: .normal)
        openProfileButton.setTitleColor(.black, for: .normal)
        openProfileButton.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        openProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(openProfileButton)
        
        transactionsButton.setImage(UIImage(systemName: "creditcard",withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle)), for: .normal)
        transactionsButton.addTarget(self, action: #selector(pushTransactionsView), for: .touchUpInside)
        transactionsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(transactionsButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseID)
        self.view.addSubview(tableView)
        
        setUpConstraints()

    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            openProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            openProfileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([
        transactionsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
       transactionsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
    ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: openProfileButton.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
    @objc func pushView() {
        navigationController?.pushViewController(ProfilePushViewController(), animated: true)
    }
    
    @objc func pushTransactionsView() {
        navigationController?.pushViewController(TransactionPushViewController(), animated: true)
    }


}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentIndex = indexPath
        let currentPetCare = PetCares[indexPath.row]
        let vc = DetailViewController(PetCare: currentPetCare)
        // vc.del = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PetCares.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? CustomTableViewCell{
            let currentPetCare = PetCares[indexPath.row]
            
            cell.updateFrom(petCare: currentPetCare)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}


