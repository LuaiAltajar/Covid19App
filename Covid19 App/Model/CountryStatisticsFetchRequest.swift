//
//  CountryStatisticsFetchRequest.swift
//  Covid19 App
//
//  Created by Luai Altajar on 09.05.2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class CountryStatisticsFetchRequest: ObservableObject {
    
    @Published var detailedCountryData: DetailedCountryData?
    
    let headers: HTTPHeaders = [
        "x-rapidapi-key": "863df1807cmsh680c0986ba0525bp1c8b10jsn3877fd6c2811",
        "x-rapidapi-host": "covid-193.p.rapidapi.com"
    ]
    
    
    init() {  }
    
    
    func getStatsFor(country: String) {
        
        AF.request("https://covid-193.p.rapidapi.com/history?country=\(country)", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil{
                let json = JSON(result!)
                //              print(json["response"][0])
                
                
                let country = json["response"][0]["country"].stringValue
                
                let deaths = json["response"][0]["deaths"]["total"].intValue
                let newDeaths = json["response"][0]["deaths"]["new"].intValue
                
                let tests = json["response"][0]["test"]["total"].intValue
                
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["active"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
                
                
                self.detailedCountryData = DetailedCountryData(country: country, confirmedCases: totalCases, newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testsDone: tests)
            }
        }
    }
}
