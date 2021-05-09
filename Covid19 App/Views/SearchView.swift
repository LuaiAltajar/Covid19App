//
//  SearchView.swift
//  Covid19 App
//
//  Created by Luai Altajar on 09.05.2021.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
    
        HStack{
            TextField("Country...", text: $searchText)
                .padding()
            
        }//End of HStack
        .frame(height: 50)
        .background(Color("cardBackgroundGray"))
    }
}


