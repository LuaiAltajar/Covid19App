//
//  RecentView.swift
//  Covid19 App
//
//  Created by Luai Altajar on 08.05.2021.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    @State var searchText = ""
    @State var isSearchVisible = false
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                if isSearchVisible{
                    
                    SearchView(searchText: $searchText)
                }
                
                TotalDataView(totalData: covidFetch.totalData)
                ListHeaderView()
                
                List {
                    
                    ForEach(covidFetch.allCountries.filter {
                        self.searchText.isEmpty ? true: $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        
                        NavigationLink(destination:
                                        CountryDetailView(countryName: countryData.country)) {
                            
                            CountryDataRowView(countryData: countryData)
                        }
                    }
                }
                
            }//End of VStack
            .navigationBarTitle("Recent Data", displayMode: .inline)
            .navigationBarItems(trailing:
                                    
                                    Button(action: {
                                        
                                        self.isSearchVisible.toggle()
                                        
                                        if !self.isSearchVisible {
                                            self.searchText = ""
                                        }
                                        
                                    }, label: {
                                        Image(systemName: "magnifyingglass")
                                    })
            )
        }//End of Navigation view
        
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
