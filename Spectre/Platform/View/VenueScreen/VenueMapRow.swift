//
//  VenueMapRow.swift
//  Spectre
//
//  Created by Nicu Danciu on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit
import MapKit

class VenueMapRow: UICollectionViewCell, NibIdentifiable, ReuseIdentifiable, MKMapViewDelegate {
    
    @IBOutlet private var mapView: MKMapView!
    @IBOutlet private var actionButton: UIButton!
    
    var actionHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        actionButton.titleLabel?.adjustsFontForContentSizeCategory = true
        actionButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        mapView.layer.cornerRadius = 10
    }
    
    func display() {
        let location = CLLocationCoordinate2DMake(46.770439, 23.591423)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.title = "Cluj-Napoca"
        annotation.subtitle = "Cluj"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction private func executeAction(_ sender: Any) {
        actionHandler?()
    }
}
