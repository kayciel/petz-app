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
    let contactLabelDec = UILabel()
    let overallRatingLabel = UILabel()
    let overallRatingLabelDec = UILabel()
    let bioTextView = UITextView()
    let tableView = UITableView()
    let reuseID = "My Review"
    var currentIndex = IndexPath()

    
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

        picImageView.image = UIImage(named:"Profile0")
        picImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picImageView)
        
        idLabel.text = String(PetCare.id)
        idLabel.font = .systemFont(ofSize: 20)
        idLabel.layer.cornerRadius = 5
        idLabel.clipsToBounds = true
        idLabel.textAlignment = .center
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(idLabel)
        
        nameLabel.text = PetCare.name
        nameLabel.font = .boldSystemFont(ofSize: 25)
        nameLabel.layer.cornerRadius = 5
        nameLabel.clipsToBounds = true
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
    
        bioTextView.text = PetCare.bio
        bioTextView.font = .systemFont(ofSize: 20)
        bioTextView.layer.cornerRadius = 5
        bioTextView.clipsToBounds = true
        bioTextView.textAlignment = .center
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioTextView)
        
        contactLabel.text = PetCare.contact
        contactLabel.font = .systemFont(ofSize: 20)
        contactLabel.layer.cornerRadius = 5
        contactLabel.clipsToBounds = true
        contactLabel.textAlignment = .center
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactLabel)
        
        contactLabelDec.text = "Contact: "
        contactLabelDec.font = .systemFont(ofSize: 20)
        contactLabelDec.layer.cornerRadius = 5
        contactLabelDec.clipsToBounds = true
        contactLabelDec.textAlignment = .center
        contactLabelDec.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactLabelDec)
        
        overallRatingLabel.text = String(PetCare.overall_rating)
        overallRatingLabel.font = .systemFont(ofSize: 20)
        overallRatingLabel.layer.cornerRadius = 5
        overallRatingLabel.clipsToBounds = true
        overallRatingLabel.textAlignment = .center
        overallRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overallRatingLabel)
        
        overallRatingLabelDec.text = "Average Rating:"
        overallRatingLabelDec.font = .systemFont(ofSize: 20)
        overallRatingLabelDec.layer.cornerRadius = 5
        overallRatingLabelDec.clipsToBounds = true
        overallRatingLabelDec.textAlignment = .center
        overallRatingLabelDec.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overallRatingLabelDec)

        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: reuseID)

        
        setupConstraints()
    }

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
                contactLabelDec.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                contactLabelDec.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
                contactLabelDec.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            ])
            
            NSLayoutConstraint.activate([
                contactLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                contactLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
                contactLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            ])
            
            NSLayoutConstraint.activate([
                overallRatingLabelDec.topAnchor.constraint(equalTo: contactLabelDec.bottomAnchor, constant: 10),
                overallRatingLabelDec.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
                overallRatingLabelDec.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            ])
            
            NSLayoutConstraint.activate([
                overallRatingLabel.topAnchor.constraint(equalTo: contactLabelDec.bottomAnchor, constant: 10),
                overallRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
                overallRatingLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            ])
            
            NSLayoutConstraint.activate([
                bioTextView.topAnchor.constraint(equalTo: overallRatingLabel.bottomAnchor, constant: 10),
                bioTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                bioTextView.heightAnchor.constraint(equalToConstant: 100),
                bioTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            ])
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 10),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
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
