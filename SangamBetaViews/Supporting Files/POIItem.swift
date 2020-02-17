//
//  POIItem.swift
//  POI4
//
//  Created by Emily Nan on 2019/10/31.
//  Copyright © 2019 Emily Nan. All rights reserved.
//

import SwiftUI
import CoreLocation
//import Mapbox

struct POIItem: Codable, Equatable, Identifiable {

      var id: Int
      var country: String
      var city: String
      var category: Category
      var placeName: String

      var address: String

     // fileprivate var coordinates: Coordinates
    //  fileprivate var imageName: String
      var coordinates: Coordinates
    //  var imageName: String
      var description: String
      var phoneNumber: String

      var isFeatured: Bool
      var isFavorite: Bool

      var locationCoordinate: CLLocationCoordinate2D {
          CLLocationCoordinate2D(
              latitude: coordinates.latitude,
              longitude: coordinates.longitude)
      }

      enum Category: String, CaseIterable, Codable, Hashable {
          case restaurant = "Restaurant & Bar"
          case seesight = "SeeSight"
          case unesco = "UNESCO"
          case activity = "Activity"
          case shopping = "Shopping"
          case exhibit = "Exhibit & Shows"
          case culture = "Culture"

      }
    
    var imageName: String {
        placeName.replacingOccurrences(of: " ", with: "-").lowercased()
    }

            #if DEBUG
    static let example = POIItem(id: 21, country: "China", city: "Shanghai", category: Category.seesight, placeName: "Waitan", address: "Zhongshan East 1st Road,Shanghai,China", coordinates: Coordinates(latitude: 34.011286, longitude: -116.166868), description: "The Bund (外滩Wàitān) is Shanghai's stately street of old colonial-era buildings and the first port of call for many visitors. The Bund was the financial center of the Far East until the 1930s. It has been referred to as 'a museum of buildings', as many different styles of European buildings can be found here.", phoneNumber: "86-1111-1111", isFeatured: true, isFavorite: true)
            #endif

}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

