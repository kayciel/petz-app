//
//  NetworkManager.swift
//  petz
//
//  Created by Kayciel Ramos on 5/4/23.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    var url = URL(string: "http://34.85.175.30/users/")!

    func getAllSitters(completion: @escaping ([PetCare]) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Response.self, from: data)
                    completion(response.users)
                }
                catch (let error){
//                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
    
    func getCurrentProfile(completion: @escaping (PetCare) -> Void){
        let editUrl = URL(string: "http://34.85.175.30/users/1")!
        var request = URLRequest(url:editUrl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(PetCare.self, from: data)
                    completion(response)
                }
                catch (let error){
//                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
    
    func editSitter(name: String, username: String, bio: String, contact: String, overall_rating: Float, host: Bool, owner: Bool, categories_h: [String], categories_o: [String], reviews: [Review], available: Bool, completion: @escaping (PetCare) -> Void) {
        let editUrl = URL(string: "http://34.85.175.30/users/1")!
        var request = URLRequest(url:editUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "id": 1,
            "name": name,
            "username": username,
            "bio": bio,
            "contact": contact,
            "overall_rating": overall_rating,
            "host": host,
            "owner": owner,
            "categories_h":categories_h,
            "categories_o":categories_o,
            "reviews": reviews,
            "available" :available
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request) {data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(PetCare.self, from: data)
                    completion(response)
                }
                catch (let error){
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()

    }

}
