//
//  ViewController.swift
//  LokasyonKullanimi
//
//  Created by Kasım on 10.08.2023.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelHiz: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        //41.0370175,28.974792
    }
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations[locations.count-1]
        
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        
        labelEnlem.text = "Enlem : \(enlem)"
        labelBoylam.text = "Boylam : \(boylam)"
        labelHiz.text = "Hız : \(sonKonum.speed)"
        
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)
        
        /*let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "\(enlem) - \(boylam)"
        pin.subtitle = "Konum"
        mapView.addAnnotation(pin)*/
        mapView.showsUserLocation = true
    }
}
