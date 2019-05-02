//
//  ConfirmationViewController.swift
//  Alohomora
//
//  Created by student on 30/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    @IBOutlet weak var cpfText: UITextField!
    @IBOutlet weak var dataText: UITextField!
    @IBOutlet weak var horaText: UITextField!
    @IBOutlet weak var cadeadoText: UITextField!
    
    @IBOutlet weak var nomeText: UITextField!
    @IBOutlet weak var sucessoLabel: UILabel!
   

    @IBAction func buttonMapa(_ sender: Any) {
        
        self.performSegue(withIdentifier: "voltarMapa", sender: nil)
        
    }
    
    @IBAction func buttonConfirmar(_ sender: Any) {
        let cpf = cpfText.text!
        let data = dataText.text!
        let hora = horaText.text!
        let cadeado = cadeadoText.text!
        
        
        let confirmar = UIAlertController(title: "Confirma", message:"Você tem certeza da escolha?", preferredStyle: UIAlertControllerStyle.alert)
        
        let janela1 = UIAlertAction(title: "confirmar", style: UIAlertActionStyle.default)
        {(UIAlertAction) in
            
            self.performSegue(withIdentifier: "popUp", sender: nil)
            
            
            
            let parameters = ["request":["user_id": cpf, "hour": hora, "date":data, "padlock":cadeado]]
            
            guard let url = URL(string: "https://alohomorabeta1.mybluemix.net/app/request/reserve") else { return }
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
        
        let retornar = UIAlertAction(title: "retornar", style: UIAlertActionStyle.default, handler: nil)
        
        confirmar.addAction(janela1)
        confirmar.addAction(retornar)
        
        self.present(confirmar, animated: true,completion: nil)
        
    }

    func getconfirmar(_ sender: Any){
guard let url = URL(string: "https://alohomorabeta1.mybluemix.net/app/request/reserve") else { return }
    let session = URLSession.shared
    session.dataTask(with: url) { (data, response, error) in
        if let response = response {
            print(response)
    }
    
        if let data = data {
            print(data)
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
            
            
    } catch {
        print(error)
    }
    
    }
    }.resume()
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event:UIEvent?) {
        cpfText.resignFirstResponder()
        cadeadoText.resignFirstResponder()
        horaText.resignFirstResponder()
        dataText.resignFirstResponder()
        nomeText.resignFirstResponder()
        
        
    }
    
}

    /*@IBAction func onPostTapped(_ sender: Any) {
 
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
        
        
    } */
        

    

