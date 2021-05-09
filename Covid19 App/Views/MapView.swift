//
//  MapView.swift
//  Covid19 App
//
//  Created by Luai Altajar on 09.05.2021.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var countryData: [CountryData]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    
        var allAnotations: [CoronaCaseAnnotation] = []
        
        
        for data in countryData{
            
            let title = data.country + "\n Confirmed " + data.confirmed.formatNumber() + "\n Death " + data.deaths.formatNumber()
            
            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            allAnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinate))
        }
        
        uiView.annotations.forEach{uiView.removeAnnotation($0)}
        uiView.addAnnotations(allAnotations)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
}

class CoronaCaseAnnotation: NSObject, MKAnnotation{
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
