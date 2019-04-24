//
//  ViewController.swift
//  Alohomora
//
//  Created by student on 24/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var HomeMapKit: MKMapView!

    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in Hackatruck
        let truck = CLLocation(latitude: -8.05605232, longitude: -34.95095883)
        centerMapOnLocation(location: truck)
        HomeMapKit.showsUserLocation = true
        setupLocationManager()
        addAnnotation()
    }
    

    func setupLocationManager(){
        //Esta variavel pega a localização mais proxima
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Pede autorização do Usuário
        locationManager.requestWhenInUseAuthorization()
        //Atualiza a posicao do usuario
        locationManager.startUpdatingLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Verificar se o array de localizacao existe pelo menos uma localizacao
        if locations.count > 0{
            if let location = locations.last{
                userLocation = location
                print("A localizaçao do usuario é \(userLocation.coordinate)")
            }
        }
    }
    
    //Cria estrutura para uma anotação
    func addAnnotation(){
        let estabelecimento:MKPointAnnotation = MKPointAnnotation()
        //Seta um pin no mapa
        estabelecimento.coordinate = CLLocationCoordinate2DMake(-8.05605232, -34.95095883)
        //Estabelece um nome para o local setado
        estabelecimento.title = "Hackatruck UFPE"
        HomeMapKit.addAnnotation(estabelecimento)
    }
    
    //Define o zoom no mapa
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 2000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        HomeMapKit.setRegion(coordinateRegion, animated: true)
    }
    
    


}

