//
//  MapContainerView.swift
//  Covid19 App
//
//  Created by Luai Altajar on 09.05.2021.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    
    
    var body: some View {
        
        MapView(countryData: $covidFetch.allCountries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
