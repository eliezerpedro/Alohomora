//
//  infoViewController.swift
//  Alohomora
//
//  Created by student on 25/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {

    
    @IBOutlet weak var nomeLabel: UILabel!
    
    var nome: String?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var enderecoLabel: UILabel!
    @IBOutlet weak var telefoneLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var buttonConf: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeLabel.text = nome;
        descricaoLabel.text = "Caminhão de aulas da IBM"
        telefoneLabel.text = "98574-4652"
        enderecoLabel.text = "Av. Jorn. Aníbal Fernandes, Recife - PE"
              
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //@IBAction func PopUpClicked(_ sender: UIButton) -> Void{
    //    let popOverVc = UIStoryboard(name: "Confirmado!", bundle: nil).instantiateInitialViewController(withIndetifier: "PopUp") as! PopUpViewController
        
     //   self.addChildViewController(popOverVc)
        
    //    popOverVc.view.frame = self.view.frame
     //   self.view.addSubview(popOverVc.view)
    //    popOverVc.didMove(isMovingToParentViewController: self)
    //}
    
    
}
