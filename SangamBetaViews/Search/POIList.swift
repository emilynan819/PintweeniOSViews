//
//  ContentView.swift
//  POI4
//
//  Created by Emily Nan on 2019/10/31.
//  Copyright © 2019 Emily Nan. All rights reserved.
//

import SwiftUI

struct POIList: View {
    @EnvironmentObject var userdata: UserData
    @State private var searchTerm : String = ""
    
    let poi = Bundle.main.decode([POIItem].self, from: "poiData.json")
    
    var body: some View {
        NavigationView {
            List {
                
                SearchBar(text: $searchTerm)
                
                ForEach(poi.filter {
                    self.searchTerm.isEmpty ? true :
                        "\($0)".localizedCaseInsensitiveContains(self.searchTerm)
                    }
                ) { item in

                    POIRow(item: item)

                }
                
            }.navigationBarTitle("POI List")
            
        }
        
    }
    
}
struct POIList_Previews: PreviewProvider {
    static var previews: some View {
      
            POIList().environmentObject(UserData())
        
    }
}
