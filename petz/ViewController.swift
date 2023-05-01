//
//  ViewController.swift
//  petz
//
//  Created by Kayciel Ramos on 4/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    var openProfileButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        openProfileButton.setTitle("OPEN MY PROFILE", for: .normal)
        openProfileButton.setTitleColor(.black, for: .normal)
        openProfileButton.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        openProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(openProfileButton)
        
        setUpConstraints()

    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            openProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            openProfileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    @objc func pushView() {
        navigationController?.pushViewController(ProfilePushViewController(), animated: true)
    }


}

