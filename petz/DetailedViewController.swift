//
//  DetailedViewController.swift
//  petz
//


import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let picImageView = UIImageView()
    let nameLabel = UILabel()
    let idLabel = UILabel()
    let contactLabel = UILabel()
    let overallRatingLabel = UILabel()
    let bioLabel = UILabel()
    let tableView = UITableView()
    let reuseID = "My Review"
    var currentIndex = IndexPath()

    
    // weak var del: updateCell?
    
    
    let PetCare: PetCare
    init(PetCare: PetCare) {
        self.PetCare = PetCare
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        picImageView.image = UIImage(named:PetCare.petCarePicName)
        picImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picImageView)
        
        idLabel.text = PetCare.id
        idLabel.font = .systemFont(ofSize: 20)
        idLabel.layer.cornerRadius = 5
        idLabel.clipsToBounds = true
        idLabel.textAlignment = .center
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(idLabel)
        
        nameLabel.text = PetCare.name
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.layer.cornerRadius = 5
        nameLabel.clipsToBounds = true
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
    
        bioLabel.text = PetCare.bio
        bioLabel.font = .systemFont(ofSize: 20)
        bioLabel.layer.cornerRadius = 5
        bioLabel.clipsToBounds = true
        bioLabel.textAlignment = .center
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        contactLabel.text = PetCare.contact
        contactLabel.font = .systemFont(ofSize: 20)
        contactLabel.layer.cornerRadius = 5
        contactLabel.clipsToBounds = true
        contactLabel.textAlignment = .center
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactLabel)
        
        overallRatingLabel.text = PetCare.overallRating
        overallRatingLabel.font = .systemFont(ofSize: 20)
        overallRatingLabel.layer.cornerRadius = 5
        overallRatingLabel.clipsToBounds = true
        overallRatingLabel.textAlignment = .center
        overallRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overallRatingLabel)

        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: reuseID)

        
        setupConstraints()
    }

//    @objc func changeContactCell() {
//
//        if let text = nameLabel.text {
//            del?.updateName(name: text)
//        }
//        if let text = contactLabel.text {
//            del?.updatecontact(contact: text)
//        }
//        if let text = overallRatingLabel.text {
//            del?.updateoverallRating(overallRating: text)
//        }
//
//    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            picImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            picImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            picImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 10),
            idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            idLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])

        NSLayoutConstraint.activate([
            contactLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            contactLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])

        NSLayoutConstraint.activate([
            overallRatingLabel.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 10),
            overallRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overallRatingLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: overallRatingLabel.bottomAnchor, constant: 10),
            bioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bioLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PetCare.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? ReviewTableViewCell{
            let currentReview = PetCare.reviews[indexPath.row]
            cell.updateFrom(Review: currentReview)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
}


//protocol updateCell: UIViewController {
//    func updateName(name: String)
//    func updatecontact(contact: String)
//    func updateoverallRating(overallRating: String)
//}

