//
//  Estabelecimento.swift
//  Alohomora
//
//  Created by student on 30/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class Estabelecimento {
    
    var user_id: String
    var hour: String
    var date: String
    var padlock: String
    
    init(json: [String: AnyObject]) {
        self.user_id = json["user_id"] as? String ?? ""
        self.hour = json["hour"] as? String ?? ""
        self.date = json["date"] as? String ?? ""
        self.padlock = json["padlock"] as? String ?? ""
        
            }
        }

class EstabelecimentoDAO {
    
    static func getestabelecimentos (callback: @escaping ((Estabelecimento) -> Void)) {
        
        let endpoint: String = "https://ufpetardeiotnodemcu.mybluemix.net/app/request/reserve"
        
        guard let url = URL(string: endpoint) else {
            print("Erroooo: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        let estabelecimento = Estabelecimento(json: json[0])
                        
                        let cpfEstacinamento = estabelecimento.user_id
                        
                        print("\(cpfEstacinamento) tem \(estabelecimento.hour) nesse horário")
                        
                        callback(estabelecimento)
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
    }
    
    
}
