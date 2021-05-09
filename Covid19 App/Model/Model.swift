//
//  Model.swift
//  Covid19 App
//
//  Created by Luai Altajar on 08.05.2021.
//

import Foundation


struct TotalData {
    
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double{
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    var recoveredRate: Double{
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryData {
    let country: String
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let longitude: Double
    let latitude: Double
    
    var fatalityRate: Double{
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    var recoveredRate: Double{
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
    
    
}

struct DetailedCountryData {
    
    let country: String
    
    let confirmedCases: Int
    let newCases: Int
    
    let recoveredCases: Int
    let criticalCases: Int
    let activeCases: Int
    
    let deaths: Int
    let newDeaths: Int
    
    let testsDone: Int
    
    var fatalityRate: Double{
        return (100.00 * Double(deaths)) / Double(confirmedCases)
    }
    var recoveredRate: Double{
        return (100.00 * Double(recoveredCases)) / Double(confirmedCases)
    }
    
    
}





let testTotalData = TotalData(confirmed: 200, critical: 100, deaths: 20, recovered: 50)
let testCountryData = CountryData(country: "Test", confirmed: 100, critical: 20, deaths: 30, recovered: 22, longitude: 0, latitude: 0)
