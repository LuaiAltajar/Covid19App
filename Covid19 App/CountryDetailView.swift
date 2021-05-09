//
//  CountryDetailView.swift
//  Covid19 App
//
//  Created by Luai Altajar on 09.05.2021.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
    var countryName: String
    
    var body: some View {
        
        VStack{
            VStack{
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.confirmedCases.formatNumber() ?? "Error", name: "Confirmed")
                    .padding(.top)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.activeCases.formatNumber() ?? "Error", name: "Active Cases")

                CountryDetailRow(number:"+" + (countryStatisticsRequest.detailedCountryData?.newCases.formatNumber() ?? "Error"), name: "New Cases")
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.recoveredCases.formatNumber() ?? "Error", name: "Recovered Cases")
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.criticalCases.formatNumber() ?? "Error", name: "Critical Cases", color: .yellow)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.deaths.formatNumber() ?? "Error", name: "Deaths", color: .red)
                
                CountryDetailRow(number:"+" + (countryStatisticsRequest.detailedCountryData?.newDeaths.formatNumber() ?? "Error"), name: "New Deaths", color: .red)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.testsDone.formatNumber() ?? "Error", name: "Tests Done", color: .yellow)
                
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
                
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.recoveredRate ?? 0.0) + "%", name: "Recovery Rate", color: .green)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 50)
        .navigationBarTitle(countryName)
        .onAppear(){
            self.getStatistics()
        }
    }
    
    private func getStatistics(){
        countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
    
}

