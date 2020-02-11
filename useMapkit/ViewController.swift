//
//  ViewController.swift
//  useMapkit
//
//  Created by USER on 2020/02/11.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController ,MKMapViewDelegate{
    
    var mymapView:MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
         mymapView = MKMapView()
        mymapView.frame  = self.view.frame
        
        
        mymapView.delegate = self
        
        let mylatitude:CLLocationDegrees = 37.331741
        let maylognitude:CLLocationDegrees = -122.030333
        
        let center:CLLocationCoordinate2D = CLLocationCoordinate2DMake(mylatitude,maylognitude )
        
        mymapView.setCenter(center,animated: true)
        
        let myspan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
         
        let myregion:MKCoordinateRegion = MKCoordinateRegion(center:center,span: myspan)
        
        mymapView.region = myregion
        
        self.view.addSubview(mymapView)
        
        let mylongpress:UILongPressGestureRecognizer = UILongPressGestureRecognizer()
        mylongpress.addTarget(self, action: #selector(ViewController.recognizeLongPress(sender:)))
        
        mymapView.addGestureRecognizer(mylongpress)
        }

    @objc func recognizeLongPress(sender:UILongPressGestureRecognizer){
        
        if sender.state != UIGestureRecognizer.State.began{
            return
        }
        let location = sender.location(in: mymapView)
        
        let mycordinate :CLLocationCoordinate2D = mymapView.convert(location, toCoordinateFrom: mymapView)
        
        let mypin:MKPointAnnotation = MKPointAnnotation()
        
        mypin.coordinate = mycordinate
        
        mypin.title = "title"
        
        mypin.subtitle = "title"
        
        mymapView.addAnnotation(mypin)
        
    }
    func mapView (_mapview:MKMapView,viewFor annnotation:MKAnnotation)-> MKAnnotation?{
        
        let mypinidentifier = "Pinannnotationidentifier"
        
        let mypinview = MKPinAnnotationView(annotation: annnotation, reuseIdentifier: mypinidentifier)
        
        mypinview.animatesDrop = true
        
        mypinview.canShowCallout = true
        
        mypinview.annotation = annnotation
        
        return mypinview as! MKAnnotation
        
    }

    
}

