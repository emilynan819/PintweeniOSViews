//
//  CountryList.swift
//  View3
//
//  Created by Emily Nan on 2020/02/03.
//  Copyright © 2020 Emily Nan. All rights reserved.
//

import Foundation

class Countries:ObservableObject{
    @Published var results:[Country]=[]
    @Published var LatLongList:[[Double]]=[]
}
struct Country: Identifiable,Codable{
    let id = UUID()
    let country:String
    var points:Int
    var latlong:[[Double]]
}
