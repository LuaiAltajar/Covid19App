//
//  CountryDataRow.swift
//  Covid19 App
//
//  Created by Luai Altajar on 08.05.2021.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    
    
    var body: some View {
        
        HStack{
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .frame(width: 110, alignment: .leading)
            
            Spacer()
            
            Text(countryData.confirmed.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .frame(width: 50,height: 40,alignment:.center)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .frame(width: 50,height: 40,alignment:.center)
                .font(.subheadline)
                .foregroundColor(.green)
        
    }
}

struct CountryDataRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
}
