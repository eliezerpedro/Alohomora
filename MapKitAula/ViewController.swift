//
//  ViewController.swift
//  MapKitAula
//
//  Created by student on 12/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapinhaView: MKMapView!
    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in Honolulu
        let truck = CLLocation(latitude: -8.05605232, longitude: -34.95095883)
        centerMapOnLocation(location: truck)
        mapinhaView.showsUserLocation = true
        //mapinhaView.userLocation.
        setupLocationManager()
        addAnnotation()
        //locationManager(self.locationManager, didUpdateLocations: [self.userLocation])
    }

    // Primeira Função
    func setupLocationManager(){
        //Esta variavel pega a localização mais proxima
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    // Segunda Funçao
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0{
            if let location = locations.last{
                userLocation = location
                print("A localizaçao do usuario é \(userLocation.coordinate)")
                //centerMapOnlocation(location: userLocation)
            }
        }
    }
    // Terceira Funcao - Criar estrutura para uma anotation
    func addAnnotation(){
        //let touchPoint = gestureRecognizer.location(in: mapinhaView)
        //let newCordenate: CLLocationCoordinate2D = mapinhaView.convert(touchPoint, toCoordinateFrom: mapinhaView)
        let estabelecimento:MKPointAnnotation = MKPointAnnotation()
        estabelecimento.coordinate = CLLocationCoordinate2DMake(-8.05605232, -34.95095883)
        estabelecimento.title = "Hackatruck UFPE"
        //estabelecimento.subtitle = String(describing: "Latitude \(newCordenate.latitude) / Longitude \(newCordenate.longitude)")
        mapinhaView.addAnnotation(estabelecimento)
    }
    
    //Quarta Função
//    func addGesture(){
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(gestureRecognizer:)))
//        longPress.minimumPressDuration = 1.0
//        mapinhaView.addGestureRecognizer(longPress)
//    }
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 2000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapinhaView.setRegion(coordinateRegion, animated: true)
    }


}

