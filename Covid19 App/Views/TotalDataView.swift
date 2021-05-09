//
//  TotalDataView.swift
//  Covid19 App
//
//  Created by Luai Altajar on 09.05.2021.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData: TotalData
    
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Confirmed")
                
                TotalDataCard(number: totalData.critical.formatNumber(), name: "Critical", color: .yellow)
                
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "Death", color: .red)
                
            }
            
            HStack {
                TotalDataCard(number: String(format: "%.2f", totalData.fatalityRate), name: "Death %", color: .red)
                
                TotalDataCard(number: totalData.recovered.formatNumber(), name: "Recovered", color: .green)
                
                TotalDataCard(number: String(format: "%.2f", totalData.recoveredRate), name: "Recovery %", color: .green)
                
            }
            
            
        }//End of Vstack
        .frame(height: 170)
        .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: testTotalData)
    }
}
