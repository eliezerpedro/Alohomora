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
    var estabelecimento:MKPointAnnotation = MKPointAnnotation()

    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in Hackatruck
        addAnnotation()
        let truck = CLLocation(latitude: -8.05605232, longitude: -34.95095883)
        centerMapOnLocation(location: truck)
        HomeMapKit.showsUserLocation = true
        setupLocationManager()
        HomeMapKit.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "estabelecimentoInfo" {
            let infoViewController = segue.destination as! infoViewController
            infoViewController.nome = estabelecimento.title
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
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
        //Seta um pin no mapa
        estabelecimento.coordinate = CLLocationCoordinate2DMake(-8.05605232, -34.95095883)
        //Estabelece um nome para o local setado
        estabelecimento.title = "Hackatruck Ufpe"
        HomeMapKit.addAnnotation(estabelecimento)

    }
    
    //func addGesture(press:UILongPressGestureRecognizer)
    
    //Define o zoom no mapa
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 2000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        HomeMapKit.setRegion(coordinateRegion, animated: true)
    }

}

extension ViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        performSegue(withIdentifier: "estabelecimentoInfo", sender: nil)
        
    }
}




