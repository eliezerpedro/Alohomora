//
//  ConfirmationViewController.swift
//  Alohomora
//
//  Created by student on 30/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

   
    @IBAction func onPostTapped(_ sender: Any) {
    
        let parameters = ["request":["user_id": "111113", "hour": "12:18", "date":"18/11/2019", "padlock":"04"]]
        
        guard let url = URL(string: "https://ufpetardeiotnodemcu.mybluemix.net/app/request/reserve") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        
    }
        
    }
    

