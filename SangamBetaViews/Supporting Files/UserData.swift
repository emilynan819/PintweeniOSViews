//
//  UserData.swift
//  POI4
//
//  Created by Emily Nan on 2019/10/31.
//  Copyright © 2019 Emily Nan. All rights reserved.
//
//
import SwiftUI
//import Mapbox

final class UserData: ObservableObject {
      @Published var showFavoitesOnly = false
      @Published var pois = poi
    
      @Published var items = [POIItem]()
   
     // @Published var annotations = [MGLPointAnnotation]()
    
    
    @Published var color: [String : Color] = [
        "Restaurant & Bar" : .purple,
        "SeeSight": .orange,
        "UNESCO":.green,
        "Activity" : .red,
        "Shopping" : .blue,
        "Exhibit & Shows" : .gray,
        "Culture" : .yellow
    ]

    @Published var categ: [String : String] = [
        "Restaurant & Bar" : "moon.circle.fill",
        "SeeSight": "link.circle.fill",
        "UNESCO": "checkmark.seal.fill",
        "Activity" : "safari.fill",
        "Shopping" : "gift.fill",
        "Exhibit & Shows" : "eye.fill",
        "Culture" : "gauge.fill"
    ]

    //Invited Friends
    @Published var friends: [String : String] = [
        "friend1" : "Ford",
        "friend2" : "Mark",
        "friend3" : "Lily",
        "friend4" : "Rose",
        "friend5" : "Jhon"
    ]

    func add(item: POIItem) {
        items.append(item)
    }

    func remove(item: POIItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    
}


